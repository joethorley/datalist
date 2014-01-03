\name{generate_data}
\alias{generate_data}
\title{Generate data}
\usage{
generate_data(data, range = NULL, length_out = 30)
}
\arguments{
  \item{data}{the data.frame of variables from which the
  data.frame will be generated}

  \item{range}{a character vector of the variables in data
  to represent by a sequence of values}

  \item{length_out}{the the number of values in a sequence}
}
\value{
The generated data.frame which can then be passed to a
model for the purpose of estimating the effects of
particular variables.
}
\description{
Generates a data.frame that can then be passed to a model
to predict the effects of particular variables with the
other variables held constant.
}
\details{
Unless a variable is named in range it is fixed at its base
value. A logical variable base value is FALSE while a
factor's is its first level. All other variables are set to
be the mean value of the same class, i.e., an integer
variable's base value is its rounded mean.

If a variable is specified in range then it is represented
by a sequence of as evenly spaced as possible unique values
of the same class from the minimum to the maximum of the
observed values with a length of length_out (by default
30). The only exceptions are if the number of unique values
between the maximum or minimum are less than length_out or
logical variables for which the only values returned are
FALSE and TRUE and factors for which all levels are
returned.

The generated data frame consists of all combinations of
the values for the variables in range together with the
base value for the other variables.
}
\examples{
data <- data.frame(numeric = 1:10 + 0.1, integer = 1:10,
   factor = factor(1:10), date = as.Date("2000-01-01") + 1:10,
   posixt = ISOdate(2000,1,1) + 1:10)

generate_data (data)
generate_data (data,range='numeric')
generate_data (data,range=c('date','factor'))
}

