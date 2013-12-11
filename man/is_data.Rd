\name{is_data}
\alias{is_data}
\title{Test data}
\usage{
  is_data(x)
}
\arguments{
  \item{x}{the object to test}
}
\value{
  A logical scalar
}
\description{
  Tests whether x is a data.frame or list of data suitable
  for input into JAGS, WinBUGS or OpenBUGS.
}
\examples{
is_data(trees)
is_data(as.list(trees))
trees$Comment <- "text"
is_data(trees)
}

