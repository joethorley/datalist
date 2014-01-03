#' @title Test convertible data list
#'
#' @description
#' Test whether x is a list of data suitable for conversion for
#' input into JAGS, WinBUGS or 
#' OpenBUGS.
#' @param x the object to test
#' @return A logical scalar
#' @seealso \code{\link{is_convertible_data}}
#' @examples
#' is_convertible_data_list(trees)
#' is_convertible_data_list(as.list(trees))
#' trees$Comment <- "text"
#' is_convertible_data_list(trees)
#' @export
is_convertible_data_list <- function (x) {
  
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
#' Tests whether x is a data.frame suitable for conversion for input into 
#' JAGS, WinBUGS or 
#' OpenBUGS.
#' @param x the object to test
#' @return A logical scalar
#' @seealso \code{\link{is_convertible_data}}
#' @examples
#' is_convertible_data_frame(trees)
#' is_convertible_data_frame(as.list(trees))
#' trees$Comment <- "text"
#' is_convertible_data_frame(trees)
#' @export
is_convertible_data_frame <- function (x) {
  return (is.data.frame(x) && is_convertible_data_list(as.list(x)))
}

#' @title Test data set
#'
#' @description
#' Tests whether x is a data.frame or list of data suitable for conversion for 
#' input into 
#' JAGS, WinBUGS or OpenBUGS.
#' @param x the object to test
#' @return A logical scalar
#' @seealso \code{\link{is_convertible_data_list}} and 
#' \code{\link{is_convertible_data_frame}}
#' @examples
#' is_convertible_data(trees)
#' is_convertible_data(as.list(trees))
#' trees$Comment <- "text"
#' is_convertible_data(trees)
#' @export
is_convertible_data <- function (x) {
  return (is_convertible_data_frame(x) || is_convertible_data_list(x))
}

is.POSIXt <- function (x) {
  return (inherits(x, "POSIXt"))
}
