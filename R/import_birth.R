

#' Import Birth Data
#'
#' Import Birth Data from the web
#'
#' @usage import_birth(set)
#' @param set first or section portion
#' @export
#'
#' @details This will load data from web
#'
#' @examples
#' import_birth()

import_birth <- function(set = 1) {
  stopifnot(set %in% 1:2)
  if (set == 1) {
    load(url("http://darrkj.github.io/data/Nat2013PublicUS1.rda"))
    birthUS1 <<- birthUS1
  } else {
    load(url("http://darrkj.github.io/data/Nat2013PublicUS2.rda"))
    birthUS2 <<- birthUS2
  }
  return(invisible(NULL))
}

