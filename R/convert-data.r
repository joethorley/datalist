#' @title Convert data
#'
#' @description
#' Convert (by numericising, centring or standardising) the variables of a 
#' data.frame or elements of a list into a list of integer or numeric values 
#' ready for analysis by 
#' JAGS, OpenBUGS or WinBUGS.
#' 
#' Numericising, centring and standardising represent increasing conversion of a
#' variable. A variable is first converted into a numeric value (numericising).
#' Next the mean is subtracted from all the values (centring). Finally all the 
#' values are divided by the standard deviation (standardising).
#' 
#' Numericising has no effect on numeric and integer values. Factors are 
#' numericized
#' by converting to an integer.
#' Date and POSIXt variables are numericised by converting to integer values
#' and subtracting the integer value of 1999-12-31 or 1999-12-31 23:59:59 GMT, 
#' respectively.
#' 
#' Centring has no affect on factors while Date and POSIXt values are subtracted 
#' from the rounded mean. 
#' Similarly, standardising has no affect on factors while centred 
#' Date and POSIXt values are divided by their respective standard deviation.
#'
#'
#' @param data the data frame or list of data on which the conversion is based
#' @param numericise a logical scalar or a character vector of the variables to 
#' numericise
#' @param centre a logical scalar or a character vector of the variables 
#' to centre
#' @param standardise a logical scalar or a character vector of the variables
#' to standardise
#' @param dat the data frame or data list to convert. If dat is NULL the dataset 
#' passed as the data argument is converted
#' @return The converted data frame
#' @examples
#' data <- data.frame(numeric = 1:10 + 0.1, integer = 1:10, 
#' factor = factor(1:10), date = as.Date("2000-01-01") + 1:10,
#' posixt = ISOdate(2000,1,1) + 1:10)
#' convert_data(data)
#' convert_data(data, centre = TRUE)
#' convert_data(data, standardise = TRUE)
#' convert_data(data, numericise = FALSE, standardise = "date")
#' convert_data(data, numericise = FALSE, centre = "date", standardise = "date")
#' @export
convert_data <- function (data, numericise = TRUE, centre = FALSE, 
                          standardise = FALSE, dat = NULL) {
  
  do_conversion(data, numericise = TRUE, centre = FALSE, standardise = FALSE, 
             dat = NULL)$dat
}
