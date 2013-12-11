#' @title Test data list
#'
#' @description
#' Test whether x is a list of data suitable for input into JAGS, WinBUGS or 
#' OpenBUGS.
#' @param x the object to test
#' @return A logical scalar
#' @examples
#' is_data_list(trees)
#' is_data_list(as.list(trees))
#' trees$Comment <- "text"
#' is_data_list(trees)
#' @export
is_data_list <- function (x) {
  
  if(!is.list(x) || is.data.frame(x) || !is.character(names(x)))
    return (FALSE)
  
  bol <- sapply(x, inherits, "logical")
  
  for (class in c("integer","numeric","factor","Date","POSIXt","matrix","array")) {
    bol <- bol | sapply(x, inherits, class)
  }
  return (all(bol))
}

#' @title Test data frame
#'
#' @description
#' Tests whether x is a data.frame suitable for input into JAGS, WinBUGS or 
#' OpenBUGS.
#' @param x the object to test
#' @return A logical scalar
#' @examples
#' is_data_frame(trees)
#' is_data_frame(as.list(trees))
#' trees$Comment <- "text"
#' is_data_frame(trees)
#' @export
is_data_frame <- function (x) {
  return (is.data.frame(x) && is_data_list(as.list(x)))
}

#' @title Test data
#'
#' @description
#' Tests whether x is a data.frame or list of data suitable for input into 
#' JAGS, WinBUGS or OpenBUGS.
#' @param x the object to test
#' @return A logical scalar
#' @examples
#' is_data(trees)
#' is_data(as.list(trees))
#' trees$Comment <- "text"
#' is_data(trees)
#' @export
is_data <- function (x) {
  return (is_data_frame(x) || is_data_list(x))
}
