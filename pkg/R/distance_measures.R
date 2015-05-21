# This script implements distance measures for Ordinal-pattern distributions:
# Sebastian Sippel
# 21.05.2015


### Hellinger distance
#% Calculates the Hellinger distance for two discrete distributions
#% given through the two vectors p and q of equal length.
#%p(i) >= 0, q(i) >= 0 for all i.
#%
#% Holger Lange 25.10.2013
# in the range 0...1

#' @title Distance measure between ordinal pattern distributions: Hellinger distance
#' @export
#' @description Compute the Hellinger Distance
#' @usage hellinger_distance(p, q)
#' @param p An ordinal pattern distribution
#' @param q A second ordinal pattern distribution to compare against p.
#' @details 
#' This function returns a distance measure.
#' @return A vector of length 1.
#' @references none
#' @author Sebastian Sippel
#' @examples
#' hellinger_distance(p=ordinal_pattern_distribution(rnorm(10000), ndemb = 5), q= ordinal_pattern_distribution(arima.sim(model=list(ar=0.9), n= 10000), ndemb = 5))
hellinger_distance = function(p,q) {
  h=0;
  if (length(which(p<0)) != 0 | length(which(q<0)) != 0) {
    print('positive values required'); return() }
  
  if (length(p) != length(q)) {
    print('Distributions must have the same length!') }
  
  #Normalization:
  ht=0;
  p = p/sum(p);
  q = q/sum(q);
  
  for (i in 1:length(p)) {
    ht=ht+(sqrt(p[i]) - sqrt(q[i]))^2
  }
  
  h=sqrt(ht/2);
  return(h)
}


# -------------------------------------------------------------
# Distance measures within the Entropy-Complexity plane:
# -------------------------------------------------------------




