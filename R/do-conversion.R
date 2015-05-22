do_conversion <- function (data, numericise = TRUE, centre = FALSE, 
                          standardise = FALSE, dat = NULL) {
  
  assert_that(is_convertible_data_frame(data) || is_convertible_data_list(data))
  assert_that(is.null(dat) || is_convertible_data_frame(dat) ||
                is_convertible_data_list(dat))
  assert_that(is.null(dat) || (is_convertible_data_frame(data) && 
                                 is_convertible_data_frame(dat)) ||
                (is_convertible_data_list(data) && is_convertible_data_list(dat)))
  
  assert_that(is.flag(numericise) || is.character(numericise) || is.null(numericise))
  assert_that(is.flag(centre) || is.character(centre) || is.null(centre))
  assert_that(is.flag(standardise) || is.character(standardise) || is.null(standardise))

  
  if (is.null(dat))
    dat <- data
  
  names_data <- names(data)
  names_dat <- names(dat)
  
  if (is.logical(numericise)) {
    if (numericise) {
      numericise <- names_data
    } else
      numericise <- NULL
  }
  if (is.logical(centre)) {
    if (centre) {
      centre <- names_data
    } else
      centre <- NULL
  }
  if (is.logical(standardise)) {
    if (standardise) {
      standardise <- names_data
    } else
      standardise <- NULL
  }  
  
  numericise <- numericise[!numericise %in% c(centre, standardise)]
  centre <- centre[!centre %in% standardise]
  
  all <- c(numericise, centre, standardise)
  
  x <- all[!all %in% names_data]
  if(length(x))
    message(paste(c("the following variables are not in data:", x),collapse = " "))
  
  x <- names_dat[!names_dat %in% names_data]
  if (length(x))
    message(paste(c("the following variables are in dat but not data: ", x), collapse = " "))
  
  for(name in names_data) {
      variable <- variable(data[[name]])      
    if (name %in% names_dat) {
      dat[[name]] <- convert_variable(
        variable, 
        dat[[name]], 
        numericise = name %in% numericise,
        centre = name %in% centre,
        standardise = name %in% standardise
      )
    }
  }
  return (dat)
}
