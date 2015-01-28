


#' Import Death Data
#'
#' Import Death Data from the web
#'
#' @usage download_mortality(year)
#' @param year Tde year of data to download
#' @export
#'
#' @details This will load data from web, may grab one or two files depending on the year. The return is simply the name of the file
#'
#' @examples
#' download_mortality(2007)



download_mortality <- function(year) {

  base <- 'http://www.nber.org/mortality/'
  
  1959:2012 %>%  paste0(base, ., '/mort', ., '.csv.zip') -> f1

  c(1994:2007, 2010:2012) %>% paste0(base, ., '/mortterr', ., '.csv.zip') -> f2
  
  file <- grep(year, c(f1, f2), value = TRUE)

  # Download the file from the internet.
  lapply(file, function(x) download.file(x, basename(x)))

  # Extract zipped contents to directory.
  lapply(file, function(x) unzip(basename(x)))
  
  gsub('.zip', '',  basename(file))
}



#'http://www.nber.org/data/vital-statistics-mortality-data-multiple-cause-of-death.html' %>% 
#  html() %>% html_nodes('td a') %>% html_attr('href') %>%
#  grep('.csv', ., value = TRUE) %>% 
#  paste0('http://www.nber.org', .) -> files
# dput(files)













