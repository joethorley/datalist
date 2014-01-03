base <- function(object) {
  UseMethod("base", object)
}

base.dvariable <- function(object) {
  return (object$mean)
}

base.vlogical<- function(object) {
  return (object$min)
}

base.vfactor <- function(object) {
  return (object$min)
}

base.mlogical<- function(object) {
  return (object$min)
}

base.alogical<- function(object) {
  return (object$min)
}
