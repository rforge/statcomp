% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/complexity_measures_Renyi.R
\name{permutation_entropy_Renyi}
\alias{permutation_entropy_Renyi}
\title{A function to compute Renyi entropy}
\usage{
permutation_entropy_Renyi(opd, alpha)
}
\arguments{
\item{opd}{A numeric vector that details an ordinal pattern distribution.}

\item{alpha}{alpha parameter in Renyi entropy}
}
\value{
The Renyi entropy value.
}
\description{
Renyi permutation entropy
}
\details{
This function calculates the Renyi entropy as described in Jauregui et al., Physica A, 498 74-85, 2018.
}
\examples{
x = arima.sim(model=list(ar = 0.3), n = 10^4)
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
permutation_entropy_Renyi(opd = opd, alpha = 0.5)
}
\references{
Jauregui et al., Physica A, 498 74-85, 2018.
}
\author{
Sebastian Sippel
}
