context("as")

test_that("as integer date", {
  x <- -1:3
  expect_identical(date2integer(integer2date(x)), x)
  expect_identical(integer2date(1), as.Date("2000-01-01"))
})
