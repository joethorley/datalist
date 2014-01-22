get_base <- function(object, observed = FALSE) {
  assert_that(is.flag(observed))
  UseMethod("get_base", object)
}

get_base.continuous <- function(object, observed = FALSE) {
  return (get_mean(object, observed = observed))
}

get_base.categorical <- function(object, observed = FALSE) {
  return (get_min(object, observed = observed))
}
