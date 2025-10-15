#
# FILE:
#  google_push.R
#
# DESCRIPTION:
#
# R script for pushing files to Google Drive and updating Google Sheets
# The function checks for the presence of folders based on the names passed as an argument.
# If that folder is present, then the folder and file information are recorded.
# If the folder is not present, then the function creates the folder and uploads the images.
# In either case, the "Graphics for R Recreation" is updated. This includes inserting a thumbnail,
# the link to the folder, and a "Complete" status.
#

# AUTHORS:
#   Louis Cousino (main code)
#


data_literacy_upload <- function(folder_name_list) {
  
  
  # Loading Libraries
  library(tidyverse)
  library(googledrive)
  library(googlesheets4)
  
  # Initializing dataframes and lists
  
  files_processed <- data.frame()
  
  sheet_id <- "1E-gqkr_1BI9ljVmyM_VlpAuhsBZda4Raxvf2Zg3Wufo"
  
  # Getting row number for update
  
  sheet_data <- read_sheet(sheet_id)
  
  for (i in 1:length(folder_name_list)) {
    
    folder_info <- as.data.frame(NULL)
    
    file_info <- as.data.frame(NULL)
    
    folder_id <- NA
    
    file_id <- NA
    
    folder_name <- folder_name_list[i]
    
    print(folder_name)
    
    # Checking if the ID is present in the spreadsheet
    
    internal_file_id <- scan(here::here("Slow Reveal Recreations", folder_name, "recreate-id.txt"))
    
    if (length(which(sheet_data$ID == internal_file_id)) == 1) {
      
      row_num <- which(sheet_data$ID == internal_file_id) + 1
      
      files_processed[i ,1:3] <- c(folder_name, internal_file_id, "Match")
      
    } else {
      
      print(str_c("No matching ID for folder:", folder_name))
      
      files_processed[i ,1:3] <- c(folder_name, internal_file_id, "No Match")
      
      next
      
    }
    
    # Getting file name and path from provided path
    
    full_path <- here::here("Slow Reveal Recreations", folder_name, "recreated-imgs")
    
    files_for_import <- list.files(full_path)
    
    # Setting the main folder ID
    
    main_directory_id <- "1iqyrP6aiX8Ucg8erS8WzHtStMdDw84JE"
    
    # Creating recreation folder if it does not already exist
    
    if (drive_find(q = sprintf("name = '%s' and '%s' in parents", folder_name, main_directory_id)) |> 
        nrow() != 1) {
      
      # This makes the folder and records the ID of the file
      folder_info <- drive_mkdir(folder_name, path = as_id(main_directory_id))
      
      drive_share(folder_info, role = "reader", type = "anyone")
      
      folder_id <- folder_info$id
      
    } else {
      
      warning(str_c("Folder \"", folder_name, "\" already exists"))
      
      # Getting folder ID
      
      folder_info <- drive_find(q = sprintf("name = '%s' and '%s' in parents", folder_name, main_directory_id))
      
      folder_id <- folder_info$id
      
    }
    
    # Uploading file if it does not already exist
    
    for (j in 1:length(files_for_import)) {
      
      files_matching_query <- drive_find(q = sprintf("name = '%s' and '%s' in parents", files_for_import[j], folder_id)) |> 
        nrow()
      
      if (files_matching_query == 0) {
        
        print("File does not exist in Google Drive folder. Uploading file")
        
        # This makes the folder and records the ID of the file
        file_info <- drive_upload(here::here("Slow Reveal Recreations", folder_name, "recreated-imgs", files_for_import[j]),
                                  path = folder_info)
        
        file_id[j] <- file_info$id
        
        
        
      } else if (files_matching_query == 1) {
        
        
        # Getting folder ID
        
        file_info <- drive_find(q = sprintf("name = '%s' and '%s' in parents", files_for_import[j], folder_id))
        
        file_id[j] <- file_info$id
        
        warning(str_c("File \"", file_info[1,1], "\" already exists"))
        
      } else if (files_matching_query > 1) {
        
        # Getting folder ID
        
        file_info <- drive_find(q = sprintf("name = '%s' and '%s' in parents", files_for_import[j], folder_id))
        
        file_id[j] <- file_info$id
        
        warning(str_c("More than one \"", file_info[1,1], "\" of the same name exists in the Google Drive folder"))
        
        
      }
      
    }
    
    # Updating the "Graphics for R Recreation" sheet
    
    
    
    # Creating folder link
    
    folder_link <- str_c("=HYPERLINK(\"https://drive.google.com/drive/folders/", folder_id,"\")")
    
    # Updating data
    
    range_write(sheet_id, data = data.frame(Folder_Lnk = gs4_formula(folder_link), Priotity = sheet_data[row_num-1, 15], Status = "Recreation Complete"), range = str_c("M",row_num,":","O",row_num),
                col_names = FALSE)
    
    range_write(sheet_id, data = data.frame(Thumbnail = gs4_formula(str_c("=IMAGE(\"https://drive.google.com/uc?id=", file_id[length(file_id)], "\")"))), range = str_c("D", row_num),
                col_names = FALSE)
    
  }
  
  colnames(files_processed) <- c("folder_name","ID_number","status")
  
  return(files_processed)
  
}




