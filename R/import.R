


#' Import from file
#'
#' Read birth data from file
#'
#' @usage import(file)
#' @param file An unzipped file from the cdc website
#' @export
#'
#' @details Load data from fixed width file to R data.frame
#'
#' @examples
#' import('Nat2013PublicPS.r20141016')

import <- function(file) {
  options(stringsAsFactors = FALSE)
  data <- readLines(file)
  
  defs <- definitions
  
  cols <- list()
  for (i in 1:nrow(defs)) {
    name <- defs$var_name[i]
    slots <- defs$slots[i]
    
    if (grepl(':', slots)) {
      tmp <- eval(parse(text = slots))
    } else {
      tmp <- as.numeric(slots)
    }
    tmp <- data.frame(substr(data, min(tmp), max(tmp)))
    names(tmp) <- name
    cols[[name]] <- tmp
  }
  
  rm(data, tmp)
  dplyr::bind_cols(cols)
}
