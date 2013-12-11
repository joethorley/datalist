on_failure(is_data_list) <- function(call, env) {
  paste0(deparse(call$x), " is not a list with logical, integer, 
         or numeric vectors, matrices or arrays and factor, Date, 
         and POSIXt vectors as the only variables")
}

on_failure(is_data_frame) <- function(call, env) {
  paste0(deparse(call$x), " is not a data.frame with logical, integer, 
         numeric, factor, Date, and POSIXt vectors as the only variables")
}
