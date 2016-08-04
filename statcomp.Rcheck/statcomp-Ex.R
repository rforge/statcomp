pkgname <- "statcomp"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('statcomp')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("MPR_complexity")
### * MPR_complexity

flush(stderr()); flush(stdout())

### Name: MPR_complexity
### Title: A function to compute the MPR-complexity
### Aliases: MPR_complexity

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
MPR_complexity(opd)



cleanEx()
nameEx("fis")
### * fis

flush(stderr()); flush(stdout())

### Name: fis
### Title: A (low-level) function to compute the Fisher-information
### Aliases: fis

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
fis(opd = opd)



cleanEx()
nameEx("global_complexity")
### * global_complexity

flush(stderr()); flush(stdout())

### Name: global_complexity
### Title: A function to compute global information and complexity measures
###   for time series
### Aliases: global_complexity

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
global_complexity(x = x, ndemb = 6)
# or:
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
global_complexity(opd = opd, ndemb = 6)



cleanEx()
nameEx("hellinger_distance")
### * hellinger_distance

flush(stderr()); flush(stdout())

### Name: hellinger_distance
### Title: Distance measure between ordinal pattern distributions:
###   Hellinger distance
### Aliases: hellinger_distance

### ** Examples

hellinger_distance(p=ordinal_pattern_distribution(rnorm(10000), ndemb = 5), q= ordinal_pattern_distribution(arima.sim(model=list(ar=0.9), n= 10000), ndemb = 5))



cleanEx()
nameEx("nbitflips")
### * nbitflips

flush(stderr()); flush(stdout())

### Name: nbitflips
### Title: A function to compute bitflip statistics and time series
### Aliases: nbitflips

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^6)
nbitflips(x = x, ndemb = 6)



cleanEx()
nameEx("ordinal_pattern_distribution")
### * ordinal_pattern_distribution

flush(stderr()); flush(stdout())

### Name: ordinal_pattern_distribution
### Title: A function to compute ordinal pattern statistics
### Aliases: ordinal_pattern_distribution

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
ordinal_pattern_distribution(x = x, ndemb = 6)



cleanEx()
nameEx("ordinal_pattern_distribution_2")
### * ordinal_pattern_distribution_2

flush(stderr()); flush(stdout())

### Name: ordinal_pattern_distribution_2
### Title: A function to compute ordinal pattern statistics
### Aliases: ordinal_pattern_distribution_2

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
ordinal_pattern_distribution(x = x, ndemb = 6)



cleanEx()
nameEx("ordinal_pattern_time_series")
### * ordinal_pattern_time_series

flush(stderr()); flush(stdout())

### Name: ordinal_pattern_time_series
### Title: A function to compute time series of ordinal patterns
### Aliases: ordinal_pattern_time_series

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
ordinal_pattern_time_series(x = x, ndemb = 6)



cleanEx()
nameEx("permutation_entropy")
### * permutation_entropy

flush(stderr()); flush(stdout())

### Name: permutation_entropy
### Title: A function to compute the permutation entropy
### Aliases: permutation_entropy

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
permutation_entropy(opd)



cleanEx()
nameEx("transformPermCoding")
### * transformPermCoding

flush(stderr()); flush(stdout())

### Name: transformPermCoding
### Title: A function to generate a vector from an index-transformation
###   vector from a permutation coding scheme
### Aliases: transformPermCoding

### ** Examples

transformPermCoding(target_pattern = "lehmerperm", ndemb = 4)



cleanEx()
nameEx("weighted_ordinal_pattern_distribution")
### * weighted_ordinal_pattern_distribution

flush(stderr()); flush(stdout())

### Name: weighted_ordinal_pattern_distribution
### Title: A function to compute weighted ordinal pattern statistics
### Aliases: weighted_ordinal_pattern_distribution

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
weighted_ordinal_pattern_distribution(x = x, ndemb = 6)



cleanEx()
nameEx("weighted_ordinal_pattern_distribution_2")
### * weighted_ordinal_pattern_distribution_2

flush(stderr()); flush(stdout())

### Name: weighted_ordinal_pattern_distribution_2
### Title: A function to compute weighted ordinal pattern statistics
### Aliases: weighted_ordinal_pattern_distribution_2

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
weighted_ordinal_pattern_distribution_2(x = x, ndemb = 6, weight.fun = var.fun)



### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
