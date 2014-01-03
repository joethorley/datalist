#' @title Generate data
#'
#' @description
#' Generates a data.frame that can then be passed to a model to predict the 
#' effects of particular variables with the other variables held constant.
#' 
#' @details
#' Unless a variable is named in range it is fixed at its base value. 
#' A logical variable base value is FALSE while a factor's is
#' its first level. All other variables are set to be the mean value
#' of the same class, i.e., an integer variable's base value is its rounded mean.
#' 
#' If a variable is specified in range then it is represented
#' by a sequence of as evenly spaced as possible unique values of the same class 
#' from the minimum to the maximum of the observed values with a 
#' length of length_out (by default 30). The only exceptions are if the number of
#' unique values between the maximum or minimum are less than length_out or 
#' logical variables
#' for which the only values returned are FALSE and TRUE and factors for which all levels
#' are returned.  
#' 
#' The generated data frame consists of all combinations of the values for the
#' variables in range together with the base value for the other variables.
#' 
#' @param data the data.frame of variables from which the data.frame will be generated
#' @param range a character vector of the variables in data to 
#' represent by a sequence of values
#' @param length_out the the number of values in a sequence
#' @return The generated data.frame which can then be passed to a model for the
#' purpose of estimating the effects of particular variables.
#' @examples
#' data <- data.frame(numeric = 1:10 + 0.1, integer = 1:10, 
#'    factor = factor(1:10), date = as.Date("2000-01-01") + 1:10,
#'    posixt = ISOdate(2000,1,1) + 1:10)
#'    
#' generate_data (data)
#' generate_data (data,range='numeric')
#' generate_data (data,range=c('date','factor'))
#' @export
generate_data <- function (data, range = NULL, length_out = 30) {
  assert_that(is.data.frame(data))
  assert_that(is.null(range) || is.character(range))
  assert_that(is.count(length_out) && noNA(length_out))

  range <- as.character(range)
  length_out <- as.integer(length_out)
  
  x <- range[!range %in% c(colnames (data),"")]
  if (length(x))
    message (paste(c("the following variables are in range but not data:", x), 
                   collapse = " "))  
  
  dat<-list()
  for (colname in colnames(data)) {
    variable <- dvariable(data[, colname, drop=T])    
    if (colname %in% range) {
        dat[[colname]] <- generate_range(variable, length_out=length_out)        
    } else
      dat[[colname]] <- base(variable)
  }
  data <- expand.grid (dat)
  
  return (data)
}
