


#' Download source file from web
#'
#' Pull the file from the cdc website
#'
#' @usage download_natality(type)
#' @param type Either ps or us
#' @param year The year of the data you want to pull
#' @export
#'
#' @details Leads to having the file locally
#'
#' @examples
#' download_natality('ps')


download_natality <- function(type, year = 2013) {
  stopifnot(type %in% c('us', 'ps'))
  # Create dir for data files.
  dir <- "zips"
  dir.create(dir, showWarnings = FALSE)
  temp <- tempfile()
  
  # Location of the files.
  url <- 'ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/DVS/natality/Nat'
  
  # Creat full path
  url <- paste0(url, year, type, '.zip')
  
  # Take the base of the file name at this loaction.
  file <- basename(url)
  
  # Download the file from the internet.
  download.file(url, file)
  
  # Extract zipped contents to directory.
  unzip(file, exdir = dir)
  
  # The list of unzipped files.
  fileList <- grep(type, list.files(dir), ignore.case = TRUE, value = TRUE)
  fileList <- grep(year, fileList, value = TRUE)
  
  # Full location to the files.
  paste(dir, fileList, sep = "/")
}

