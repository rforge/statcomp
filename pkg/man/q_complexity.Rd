% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/complexity_measures_q-log.R
\name{q_complexity}
\alias{q_complexity}
\title{A function to compute q-log complexity}
\usage{
q_complexity(opd, q)
}
\arguments{
\item{opd}{A numeric vector that details an ordinal pattern distribution.}

\item{q}{q-log parameter}
}
\value{
The q-log complexity value.
}
\description{
q-log complexity
}
\details{
This function calculates the q-log complexity as described in Ribeiro et al. 2017.
}
\examples{
x = arima.sim(model=list(ar = 0.3), n = 10^4)
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
q_complexity(opd = opd, q = 1)
}
\references{
Ribeiro et al. 2017, https://arxiv.org/abs/1705.04779.
}
\author{
Sebastian Sippel
}
