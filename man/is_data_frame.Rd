\name{is_data_frame}
\alias{is_data_frame}
\title{Test data frame}
\usage{
  is_data_frame(x)
}
\arguments{
  \item{x}{the object to test}
}
\value{
  A logical scalar
}
\description{
  Tests whether x is a data.frame suitable for input into
  JAGS, WinBUGS or OpenBUGS.
}
\examples{
is_data_frame(trees)
is_data_frame(as.list(trees))
trees$Comment <- "text"
is_data_frame(trees)
}

