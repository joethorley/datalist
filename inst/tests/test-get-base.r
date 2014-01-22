context("get_base")

test_that("get_base returns vector of correct class", {
  vlogical <- variable(as.logical(0:9))
  vinteger <- variable(1:10)
  vnumeric <- variable(1:10 + 0.1)
  vfactor <- variable(factor(1:10))
  vdate <- variable(as.Date("2000-01-01") + 1:10)
  vposixt <- variable(as.POSIXct("2000-01-01", tz= "GMT") + 1:10)
  
  expect_that(get_base(vlogical), is_a("logical"))
  expect_that(get_base(vinteger), is_a("integer"))
  expect_that(get_base(vnumeric), is_a("numeric"))
  expect_that(get_base(vfactor), is_a("factor"))
  expect_that(get_base(vdate), is_a("Date"))
  expect_that(get_base(vposixt), is_a("POSIXt"))
})

test_that("get_base returns vector of length 1", {
  vlogical <- variable(as.logical(0:9))
  vinteger <- variable(1:10)
  vnumeric <- variable(1:10 + 0.1)
  vfactor <- variable(factor(1:10))
  vdate <- variable(as.Date("2000-01-01") + 1:10)
  vposixt <- variable(as.POSIXct("2000-01-01", tz= "GMT") + 1:10)
  
  expect_that(length(get_base(vlogical)), equals(1))
  expect_that(length(get_base(vinteger)), equals(1))
  expect_that(length(get_base(vnumeric)), equals(1))
  expect_that(length(get_base(vfactor)), equals(1))
  expect_that(length(get_base(vdate)), equals(1))
  expect_that(length(get_base(vposixt)), equals(1))
})

test_that("get_base returns correct value", {
  vlogical <- variable(as.logical(0:9))
  vinteger <- variable(1:10)
  vnumeric <- variable(1:10 + 0.1)
  vfactor <- variable(factor(1:10))
  vdate <- variable(as.Date("2000-01-01") + 1:10)
  vposixt <- variable(as.POSIXct("2000-01-01", tz= "GMT") + 1:10)
  
  expect_that(get_base(vlogical), equals(FALSE))
  expect_that(get_base(vinteger), equals(as.integer(round(mean(1:10)))))
  expect_that(get_base(vnumeric), equals(mean(1:10 + 0.1)))
  expect_that(get_base(vfactor), equals(factor(1:10)[1]))
  expect_that(get_base(vdate), equals(mean(as.Date("2000-01-01") + 1:10)))
  expect_that(get_base(vposixt), equals(mean(as.POSIXct("2000-01-01", tz= "GMT") + 1:10)))
})
