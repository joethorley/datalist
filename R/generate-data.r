#' @title Generate dummy data
#'
#' @description
#' Generates dummy data frame based on the variables in data.
#' If a variable is specified in range then it is represented
#' by a sequence of evenly spaced values from the minimum to the maximum 
#' of the observed values (the range) of length equal to length_out. 
#' If it is not specified in range then it is represented by the mean of the 
#' observed values. The returned data frame includes all combinations of the
#' generated values.
#' 
#' @param data the data frame of variables used to generate the dummy data frame
#' @param range a character vector of the variables in data to 
#' represent by a sequence of values
#' @param length_out the the number of values in a sequence
#' @return the dummy data frame
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
      dat[[colname]] <- get_base_value(variable)
  }
  data <- expand.grid (dat)
  
  return (data)
}
