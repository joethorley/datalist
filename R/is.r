is_data_list <- function (x) {
  
  assert_that(is.list(x))
  assert_that(is.character(names(x)))
  
  bol <- sapply(x, inherits, "logical")
  
  for (class in c("integer","numeric","factor","Date","POSIXt","matrix","array")) {
    bol <- bol | sapply(x, inherits, class)
  }
  return (all(bol))
}

on_failure(is_data_list) <- function(call, env) {
  paste0(deparse(call$x), " is not a list with logical, integer, 
         or numeric vectors, matrices or arrays and factor, Date, 
         and POSIXt vectors as the only variables")
}

is_data_frame <- function (x) {
  return (is.data.frame(x) && is_data_list(as.list(x)))
}

on_failure(is_data_frame) <- function(call, env) {
  paste0(deparse(call$x), " is not a data.frame with logical, integer, 
         numeric, factor, Date, and POSIXt vectors as the only variables")
}
