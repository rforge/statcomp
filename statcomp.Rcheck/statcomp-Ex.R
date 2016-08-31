pkgname <- "statcomp"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "statcomp-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('statcomp')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("MPR_complexity")
### * MPR_complexity

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: MPR_complexity
### Title: A function to compute the MPR-complexity
### Aliases: MPR_complexity

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
MPR_complexity(opd)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("MPR_complexity", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("fis")
### * fis

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: fis
### Title: A (low-level) function to compute the Fisher-information
### Aliases: fis

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
fis(opd = opd)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("fis", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("global_complexity")
### * global_complexity

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
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



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("global_complexity", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("hellinger_distance")
### * hellinger_distance

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: hellinger_distance
### Title: Distance measure between ordinal pattern distributions:
###   Hellinger distance
### Aliases: hellinger_distance

### ** Examples

hellinger_distance(p=ordinal_pattern_distribution(rnorm(10000), ndemb = 5), q= ordinal_pattern_distribution(arima.sim(model=list(ar=0.9), n= 10000), ndemb = 5))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("hellinger_distance", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("henon_map")
### * henon_map

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: henon_map
### Title: A function to generate a time series from the Henon Map
### Aliases: henon_map

### ** Examples

henon_map(N = 10^4, a=1.4, b=0.3)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("henon_map", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("logistic_map")
### * logistic_map

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: logistic_map
### Title: A function to generate a time series from the logistic map
### Aliases: logistic_map

### ** Examples

logistic_map(N = 10^4, r=4)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("logistic_map", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("nbitflips")
### * nbitflips

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: nbitflips
### Title: A function to compute bitflip statistics and time series
### Aliases: nbitflips

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^6)
nbitflips(x = x, ndemb = 6)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("nbitflips", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ordinal_pattern_distribution")
### * ordinal_pattern_distribution

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ordinal_pattern_distribution
### Title: A function to compute ordinal pattern statistics
### Aliases: ordinal_pattern_distribution

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
ordinal_pattern_distribution(x = x, ndemb = 6)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ordinal_pattern_distribution", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("ordinal_pattern_time_series")
### * ordinal_pattern_time_series

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: ordinal_pattern_time_series
### Title: A function to compute time series of ordinal patterns
### Aliases: ordinal_pattern_time_series

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
ordinal_pattern_time_series(x = x, ndemb = 6)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("ordinal_pattern_time_series", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("permutation_entropy")
### * permutation_entropy

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: permutation_entropy
### Title: A function to compute the permutation entropy
### Aliases: permutation_entropy

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
opd = ordinal_pattern_distribution(x = x, ndemb = 6)
permutation_entropy(opd)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("permutation_entropy", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("powernoise")
### * powernoise

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: powernoise
### Title: A function to generate k-noise
### Aliases: powernoise

### ** Examples

powernoise_series = powernoise(k=2, N=10000)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("powernoise", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("quadratic_map")
### * quadratic_map

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: quadratic_map
### Title: A function to generate a time series from the Quadratic map
### Aliases: quadratic_map

### ** Examples

quadratic_map(N = 10^4, k=1.4)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("quadratic_map", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("schuster_map")
### * schuster_map

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: schuster_map
### Title: A function to generate a time series from the Schuster Map
### Aliases: schuster_map

### ** Examples

schuster_map(N = 10^4, z=2)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("schuster_map", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("skew_tent_map")
### * skew_tent_map

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: skew_tent_map
### Title: A function to generate a time series from the logistic map
### Aliases: skew_tent_map

### ** Examples

skew_tent_map(N = 10^4, a=0.1847)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("skew_tent_map", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("tent_map")
### * tent_map

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: tent_map
### Title: A function to generate a time series from the logistic map
### Aliases: tent_map

### ** Examples

tent_map(N = 10^4, mu=1.8)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("tent_map", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("transformPermCoding")
### * transformPermCoding

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: transformPermCoding
### Title: A function to generate a vector from an index-transformation
###   vector from a permutation coding scheme
### Aliases: transformPermCoding

### ** Examples

transformPermCoding(target_pattern = "lehmerperm", ndemb = 4)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("transformPermCoding", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("weighted_ordinal_pattern_distribution")
### * weighted_ordinal_pattern_distribution

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: weighted_ordinal_pattern_distribution
### Title: A function to compute weighted ordinal pattern statistics
### Aliases: weighted_ordinal_pattern_distribution

### ** Examples

x = arima.sim(model=list(ar = 0.3), n = 10^4)
weighted_ordinal_pattern_distribution(x = x, ndemb = 6)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("weighted_ordinal_pattern_distribution", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
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
