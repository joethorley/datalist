\name{is_data_list}
\alias{is_data_list}
\title{Test data list}
\usage{
  is_data_list(x)
}
\arguments{
  \item{x}{the object to test}
}
\value{
  A logical scalar
}
\description{
  Test whether x is a list of data suitable for input into
  JAGS, WinBUGS or OpenBUGS.
}
\examples{
is_data_list(trees)
is_data_list(as.list(trees))
trees$Comment <- "text"
is_data_list(trees)
}

