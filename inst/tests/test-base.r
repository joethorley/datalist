context("base")

test_that("base returns vector of correct class", {
  vlogical <- dvariable(as.logical(0:9))
  vinteger <- dvariable(1:10)
  vnumeric <- dvariable(1:10 + 0.1)
  vfactor <- dvariable(factor(1:10))
  vdate <- dvariable(as.Date("2000-01-01") + 1:10)
  vposixt <- dvariable(as.POSIXct("2000-01-01", tz= "GMT") + 1:10)
  
  expect_that(base(vlogical), is_a('logical'))
  expect_that(base(vinteger), is_a('integer'))
  expect_that(base(vnumeric), is_a('numeric'))
  expect_that(base(vfactor), is_a('factor'))
  expect_that(base(vdate), is_a('Date'))
  expect_that(base(vposixt), is_a('POSIXt'))
})

test_that("base returns vector of length 1", {
  vlogical <- dvariable(as.logical(0:9))
  vinteger <- dvariable(1:10)
  vnumeric <- dvariable(1:10 + 0.1)
  vfactor <- dvariable(factor(1:10))
  vdate <- dvariable(as.Date("2000-01-01") + 1:10)
  vposixt <- dvariable(as.POSIXct("2000-01-01", tz= "GMT") + 1:10)
  
  expect_that(length(base(vlogical)), equals(1))
  expect_that(length(base(vinteger)), equals(1))
  expect_that(length(base(vnumeric)), equals(1))
  expect_that(length(base(vfactor)), equals(1))
  expect_that(length(base(vdate)), equals(1))
  expect_that(length(base(vposixt)), equals(1))
})

test_that("base returns correct value", {
  vlogical <- dvariable(as.logical(0:9))
  vinteger <- dvariable(1:10)
  vnumeric <- dvariable(1:10 + 0.1)
  vfactor <- dvariable(factor(1:10))
  vdate <- dvariable(as.Date("2000-01-01") + 1:10)
  vposixt <- dvariable(as.POSIXct("2000-01-01", tz= "GMT") + 1:10)
  
  expect_that(base(vlogical), equals(FALSE))
  expect_that(base(vinteger), equals(as.integer(round(mean(1:10)))))
  expect_that(base(vnumeric), equals(mean(1:10 + 0.1)))
  expect_that(base(vfactor), equals(factor(1:10)[1]))
  expect_that(base(vdate), equals(mean(as.Date("2000-01-01") + 1:10)))
  expect_that(base(vposixt), equals(mean(as.POSIXct("2000-01-01", tz= "GMT") + 1:10)))
})
