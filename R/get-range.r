get_range <- function (object, observed = FALSE, length_out = 30) {
  assert_that(is.flag(observed))
  assert_that(is.count(length_out))
  
  UseMethod("get_range", object)
}

get_range.continuous <- function(object, observed = FALSE, length_out = 30) {
  if (observed) {
    if(length_out >= length(object$obs))
      return (object$obs)
    x <- seq(from = 1, to = length(object$obs), length.out = length_out)
    x <- as.integer(round(x))
    return (object$obs[x])
  }
  x <- seq(from = get_min(object), to = get_max(object), length.out = length_out)
  x <- unique(x)
  return (x)
}

get_range.categorical <- function (object, observed = FALSE, length_out = 30) {
  if(observed) {
    if (length_out >= length(object$obs))
      return (object$obs)
    return (object$obs[1:length_out])
  }
  if (length_out >= length(object$levels))
    return (object$levels)
  return (object$levels[1:length_out])
}

get_range.vinteger <- function(object, observed = FALSE, length_out = 30) {
  if (observed) {
    if(length_out >= length(object$obs))
      return (object$obs)
    x <- seq(from = 1, to = length(object$obs), length.out = length_out)
    x <- as.integer(round(x))
    return (object$obs[x])
  }
  x <- seq(from = get_min(object), to = get_max(object), length.out = length_out)
  x <- unique(as.integer(round(x)))
  return (x)
}
