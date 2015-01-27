


#' Download source file from web
#'
#' Pull the file from the cdc website
#'
#' @usage download_natality(type)
#' @param type Either ps or us
#' @export
#'
#' @details Leads to having the file locally
#'
#' @examples
#' download_natality('ps')


download_natality <- function(type) {
  stopifnot(type %in% c('us', 'ps'))
  # Create dir for data files.
  dir <- "zips"
  dir.create(dir, showWarnings = FALSE)
  temp <- tempfile()
  
  # Location of the files.
  url <- 'ftp://ftp.cdc.gov/pub/Health_Statistics/NCHS/Datasets/DVS/natality/Nat2013'
  
  # Creat full path
  url <- paste0(url, type, '.zip')
  
  # Take the base of the file name at this loaction.
  file <- basename(url1)
  
  # Download the file from the internet.
  download.file(url1, file)
  
  # Extract zipped contents to directory.
  unzip(file, exdir = dir)
  
  # The list of unzipped files.
  fileList <- list.files(dir)
  
  # Full location to the files.
  paste(dir, fileList, sep = "/")
}

