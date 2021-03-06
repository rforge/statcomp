% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chaotic_maps.R
\name{henon_map}
\alias{henon_map}
\title{A function to generate a time series from the Henon Map}
\usage{
henon_map(N, a, b, startx="rand", starty="rand", disregard_N=0)
}
\arguments{
\item{N}{length of the time series that is to be generated}

\item{a}{Henon map parameter a}

\item{b}{Henon map parameter b}

\item{startx}{start value in x direction. Default is to random.}

\item{starty}{start value in y direction. Default is to random.}

\item{disregard_N}{Number of values at the beginning of the series to disregard}
}
\value{
A vector of length N
}
\description{
Generates a time series from the Henon map
}
\examples{
henon_map(N = 10^4, a=1.4, b=0.3)
}
\references{
Schuster, H.G., 1988. Deterministic chaos. An Introduction.
}
\author{
Sebastian Sippel
}
