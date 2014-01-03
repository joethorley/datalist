#' @title datalist
#' 
#' @description
#' The datalist package provides two main functions: the \code{convert_data} 
#' function to transform 
#' a data set (data.frame or list) into a list of integer and numeric 
#' vectors, matrices and arrays 
#' for import into JAGS, WinBUGS and OpenBUGS; 
#' and the \code{generate_data} function to produce a data.frame that can 
#' be used to generate model predictions for
#' particular variables with the other variables in the model held constant.
#' 
#' @details
#' The datalist package also provides the \code{is_convertible_data} function
#' to test whether a data set is suitable for 
#' transformation into a list of integer and numeric vectors, 
#' matrices and arrays. Its sister functions \code{is_convertible_data_list} and
#' \code{is_convertible_data_frame} also test the type of the data set. 
#' 
#' @docType package
#' @import assertthat
#' @name datalist
#' @aliases package-datalist
#' @seealso \code{\link{convert_data}},
#' \code{\link{generate_data}} and \code{\link{is_convertible_data}}
NULL
