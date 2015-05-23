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
  all(bol)
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

#' @title Test data set
#'
#' @description
#' Tests whether x is converted data that can be input into
#' JAGS, WinBUGS or OpenBUGS.
#' @param x the object to test
#' @return A flag (logical scalar) indicating whether converted data
#' @seealso \code{\link{is_convertible_data}} and 
#' \code{\link{convert_data}}
#' @examples
#' is_converted_data_list(trees)
#' is_converted_data_list(convert_data(trees))
#' is_converted_data_list(list(x = 1:10, y = 0.33, z = matrix(1:9, ncol = 3)))
#' is_converted_data_list(list(x = 1:10, y = 0.33, z = matrix(1:9, ncol = 3)))
#' is_converted_data_list(list(x = factor(1:10), y = 0.33, z = matrix(1:9, ncol = 3)))
#' @export
is_converted_data_list <- function (x) {
  if(is.data.frame(x) || !is.list(x))
    return (FALSE)
  
  all(sapply(x, is.numeric))
}

#' @title Test data set
#'
#' @description
#' Tests whether x is converted data that can be input into
#' JAGS, WinBUGS or OpenBUGS.
#' @param x the object to test
#' @return A flag (logical scalar) indicating whether converted data
#' @seealso \code{\link{is_convertible_data}} and 
#' \code{\link{convert_data}}
#' @examples
#' is_converted_data_frame(trees)
#' is_converted_data_frame(convert_data(trees))
#' @export
is_converted_data_frame <- function (x) {
  if(!is.data.frame(x))
    return (FALSE)
  
  all(sapply(x, is.numeric))
}

#' @title Test data set
#'
#' @description
#' Tests whether x is converted data that can be input into
#' JAGS, WinBUGS or OpenBUGS.
#' @param x the object to test
#' @return A flag (logical scalar) indicating whether converted data
#' @seealso \code{\link{is_convertible_data}} and 
#' \code{\link{convert_data}}
#' @examples
#' is_converted_data(trees)
#' is_converted_data(convert_data(trees))
#' is_converted_data(list(x = 1:10, y = 0.33, z = matrix(1:9, ncol = 3)))
#' is_converted_data(list(x = 1:10, y = 0.33, z = matrix(1:9, ncol = 3)))
#' is_converted_data(list(x = factor(1:10), y = 0.33, z = matrix(1:9, ncol = 3)))
#' @export
is_converted_data <- function (x) {
  if(!is.list(x))
    return (FALSE)
  
  all(sapply(x, is.numeric))
}

is.POSIXt <- function (x) {
  return (inherits(x, "POSIXt"))
}
