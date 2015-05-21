## Sebastian Sippel
# 19.01.2015

# This script is to write functions that calculate complexity measures as a function of 
# ANY ordinal pattern distribution!
# Any complexity measure can be computed also with a weighted OPD!

# Fisher Information: second argument should be a vector of the pattern coding



# ----------------------------------------------------
# Permutation Entropy:
# ----------------------------------------------------
#' @title A function to compute the permutation entropy
#' @export
#' @description Computation of the permutation entropy of a time series based on its ordinal pattern distribution (see Bandt and Pompe 2002). 
#' Permutation entropy is a global information measure, hence insensitive to the permutation ordering scheme.
#' @usage permutation_entropy(odp)
#' @param opd A numeric vector that details an ordinal pattern distribution.
#' @details 
#' This function calculates the permutation entropy as described in Bandt and Pompe 2002.
#' @return The normalized permutation entropy as a numeric value in the range [0;1]. 
#' @references Bandt and Pompe, 2002.
#' @author Sebastian Sippel
#' @examples
#' x = arima.sim(model=list(ar = 0.3), n = 10^4)
#' opd = ordinal_pattern_distribution(x = x, ndemb = 6)
#' permutation_entropy(opd)
permutation_entropy = function(opd) {
  # maximum Shannon Entropy:
  ssmax  = log( length(opd) )
  # compute Permutation entropy and return:
  PE = shannon_entropy(opd) / ssmax
  return(PE)
}

# ----------------------------------------------------
# MPR complexity using Jensen-Shannon Divergence:
# ----------------------------------------------------
#' @title A function to compute the MPR-complexity
#' @export
#' @description The function computes the MPR complexity, i.e. a generalized (global) complexity measure based on the Jenson-Shannon divergence.
#' @usage permutation_entropy(odp)
#' @param opd A numeric vector that details an ordinal pattern distribution.
#' @details 
#' Generalized complexity measures combine an information measure (i.e. entropy) with the distance of the distribution from the uniform distribution ('disequilibrium').
#' As a global measure, MPR-complexity is insensitive to the permutation coding scheme.
#' @return The normalized MPR complexity measure in the range [0; 1].
#' @references Martin, Plastino and Rosso (2006): Physica A 369 (2006) 439–462
#' @author Sebastian Sippel
#' @examples
#' x = arima.sim(model=list(ar = 0.3), n = 10^4)
#' opd = ordinal_pattern_distribution(x = x, ndemb = 6)
#' MPR_complexity(opd)
MPR_complexity = function(opd) {
  
  alpha = 0.5
  p00  = 1./length(opd)
  pp0    = length(opd)
  pp1    = length(opd) - 1 
  aaa    = ( 1. - alpha ) / pp0
  bbb    = alpha + aaa
  aux1   = bbb * log( bbb )
  aux2   = pp1 * aaa * log( aaa )
  aux3   = ( 1. - alpha ) * log( pp0 )
  q03    =  -1. / ( aux1 + aux2 + aux3 )
  
  # convert to probabilities:
  opd.prob = opd/sum(opd)
  
  # Jensen-Shannon Divergence (Disequilibrium measure, e.g. in Martin, Plastino and Rosso, 2006):
  opd.prob2 = alpha * (opd.prob)  + (1 - alpha) * p00 # Shannon Entropie von S[(P+P_e)/2] f?r ein bestimmtes pattern (nicht ausummiert), siehe auch: Rosso et al (2007), Eq. 3
  
  # Shannon Entropy of divergence measure:
  S_p_pe = shannon_entropy(opd.prob2)
  
  # Shannon Entropy of opd:
  S_p = shannon_entropy(opd=opd.prob)
  
  # Shannon Entropy of Equilibrium distribution:
  S_pe  = log( length(opd) )
  
  # Shannon entropy of OPD:
  H_s = S_p/S_pe
  
  # compute MPR-complexity:
  C_js = q03 * (S_p_pe - 0.5 * S_p - 0.5 * S_pe) * H_s
  return(C_js)
}


# ----------------------------------------------------
# Fisher information:
# ----------------------------------------------------

#' @title A function to compute the Fisher-information
#' @export
#' @description The function computes the Fisher information, i.e. a local information measure.
#' @usage fisher_information(odp)
#' @param opd A numeric vector that details an ordinal pattern distribution in a user-specified permutation coding scheme.
#' @param x (OPTIONAL) If opd is not specified, a time series vector x must be specified
#' @param ndemb (OPTIONAL) If x is given, the embedding dimension (ndemb) is required.
#' @param defaultCoding Logical. If TRUE, the Fisher information is computed based on the ordinal pattern distribution (opd) specified, or based on the default Keller coding scheme. If FALSE, the ordinal pattern distribution must be given in the default coding scheme (i.e. Keller and Sinn, 2005), and the Fisher information based on various pattern coding schemes is returned.
#' @details 
#' The Fisher information is a local information and complexity measure, computed based on the ordinal pattern distribution. 
#' The Fisher information is based on local gradients, hence it is sensitive to the permutation coding scheme.
#' @return The normalized Fisher information measure in the range [0; 1]. If defaultCoding is TRUE, returns the Fisher information measure based on various permutation coding schemes.
#' @references Olivares et al (2012): Physica A 391 (2012) 2518–2526
#' @author Sebastian Sippel
#' @examples
#' x = arima.sim(model=list(ar = 0.3), n = 10^4)
#' opd = ordinal_pattern_distribution(x = x, ndemb = 6)
#' fisher_information(opd = opd)
fisher_information = function(opd = NA, x = NA, ndemb = NA, defaultCoding = F) {
  # if no ordinal pattern distribution is specified:
  if (is.na(opd)) {
    opd = ordinal_pattern_distribution(x=x, ndemb = ndemb)
  }
  
  if (defaultCoding == F) {
      # convert to probabilities:
      opd.prob = opd / sum(opd)
    
      ## calculate Fisher information according to Olivares et al 2012
      fis = sum(sapply(1:(length(opd)-1), FUN=function(i) return((sqrt(opd.prob[i+1]) - sqrt(opd.prob[i]))^2))) / 2
      return(fis)
  } else {
    # calculate Fisher information for different pattern coding schemes:
    fis_patterns = sapply(transformPermCodingData, FUN= function(i) {
      opd.temp = changePermCodingOPD(opd=opd, ndemb=ndemb, transform_vec=unlist(i[paste(ndemb)]), use_target_pattern=F)
      return(fis(opd.temp))
    } )
    names(fis_patterns) = paste("fis_",names(x=transformPermCodingData), sep="")
    return(fis_patterns)
  }
}







# ----------------------------------------------------
# Make high-level functions for complexity measures:
# ----------------------------------------------------
# complexity is a (fast) high-level function to calculate various complexity measures:
# x is a time series
# ndemb is the embedding dimension
# x = rnorm(10000)
# ndemb = 4


#' @title A function to compute global information and complexity measures for time series
#' @export
#' @description This is a high-level function that calculates global complexity measures directly from a given time series or ordinal pattern distribution.
#' @usage global_complexity(x = NA, opd = NA, ndemb)
#' @param opd A numeric vector that details an ordinal pattern distribution in a user-specified permutation coding scheme.
#' @param x (OPTIONAL) If opd is not specified, a time series vector x must be specified
#' @param ndemb (OPTIONAL) If x is given, the embedding dimension (ndemb) is required.
#' @details 
#' This function calculates the following global measures of complexity and information:
#' \itemize{
#'  \item{Permutation Entropy (PE, cf. Bandt and Pompe, 2002)}
#'  \item{Permutation Statistical complexity (MPR complexity, cf. Martin, Plastino and Rosso, 2006)}
#'  \item{Number of "forbiden patterns" (cf. Amigo 2010)}
#' }
#' @return A named vector containing the three global complexity measures.
#' @references 
#' Bandt and Pompe (2002): Physical Review Letters 88 (2002), 174102-1-174102-4.
#' Martin, Plastino and Rosse (2006): Physica A 369 (2006) 439–462
#' Amigo (2010): Permutation Complexity in Dynamical Systems. Springer. ISBN 978-3-642-04083-2
#' @author Sebastian Sippel
#' @examples
#' x = arima.sim(model=list(ar = 0.3), n = 10^4)
#' global_complexity(x = x, ndemb = 6)
#' # or:
#' opd = ordinal_pattern_distribution(x = x, ndemb = 6)
#' global_complexity(opd = opd, ndemb = 6)
global_complexity = function(x = NA, opd = NA, ndemb) {
  # if no ordinal pattern distribution is specified:
  if (is.na(opd)) {
    opd = ordinal_pattern_distribution(x=x, ndemb = ndemb)
  }
  
  # calculate global complexity measures:
  H_s = permutation_entropy(opd)
  C_js = MPR_complexity(opd)
  nforbid = nforbiden(opd)
  
  # put global complexity measures into one vector:
  global_complexity = c(H_s, C_js, nforbid)
  names(global_complexity) = c("PE", "MPR_Cjs", "nforbiden")
  
  return(global_complexity)
}


#' @title A function to compute global and local information and complexity measures for time series
#' @export
#' @description This is a high-level function that calculates local and global complexity measures directly from a given time series or ordinal pattern distribution.
#' This function combines function to calculate global complexity nd information measures (global_complexity) with the Fisher information (fisher_information).
#' @usage statistical_complexity(x = NA, opd = NA, ndemb)
#' @param opd A numeric vector that details an ordinal pattern distribution in a user-specified permutation coding scheme.
#' @param x (OPTIONAL) If opd is not specified, a time series vector x must be specified
#' @param ndemb (OPTIONAL) If x is given, the embedding dimension (ndemb) is required.
#' @details 
#' This function calculates the following global and local measures of complexity and information:
#' \itemize{
#'  \item{Permutation Entropy (PE, cf. Bandt and Pompe, 2002)}
#'  \item{Permutation Statistical complexity (MPR complexity, cf. Martin, Plastino and Rosso, 2006)}
#'  \item{Number of "forbiden patterns" (cf. Amigo 2010)}
#'  \item{Fisher information based on ordinal patterns (cf. Olivares et al 2012), using the following coding schemes:}
#'  \itemize{
#'  \item{"lehmerperm"}
#'  \item{"kellerperm"}
#'  \item{"lehmerperm_Olivares"}
#'  \item{"kellerperm_Olivares"}
#'  \item{"lehmerperm_bitflips_adjusted"}
#'  \item{"kellerperm_bitflips_adjusted"}
#'  \item{"lehmerperm_jumps_adjusted"}
#'  \item{"kellerperm_jumps_adjusted"}
#'  }
#' }. This is a more-user-friendly implementation of the information and complexity measures. 
#' However, a faster calculation is achieved if the pattern coding transformation vectors are calculated beforehand (using e.g. IDXvec <- generateCodingScheme(..., returnIDXVec = T), changePermCodingOPD(..., use_target_pattern = F, transform_vec = IDXvec) and fisher_information(defaultCoding = F))
#' @return A named vector containing the statistical complexity of the given time series.
#' @references 
#' Bandt and Pompe (2002): Physical Review Letters 88 (2002), 174102-1-174102-4.
#' Martin, Plastino and Rosse (2006): Physica A 369 (2006) 439–462
#' Amigo (2010): Permutation Complexity in Dynamical Systems. Springer. ISBN 978-3-642-04083-2
#' Olivares, Plastino and Rosso: Physica A 391 (2012) 2518–2526
#' @author Sebastian Sippel
#' @examples
#' x = arima.sim(model=list(ar = 0.3), n = 10^4)
#' statistical_complexity(x = x, ndemb = 6)
#' # or:
#' opd = ordinal_pattern_distribution(x = x, ndemb = 6)
#' statistical_complexity(opd = opd, ndemb = 6)
statistical_complexity = function(x = NA, opd = NA, ndemb) {
  # if no ordinal pattern distribution is specified:
  if (is.na(opd)) {
    opd = ordinal_pattern_distribution(x=x, ndemb = ndemb)
  }
  
  # calculate global complexity:
  global_complexity_measures = global_complexity(opd=opd)
  
  # calculate local complexity:
  fis_patterns = fisher_information(opd=opd, ndemb = ndemb)

  return(c(global_complexity_measures, fis_patterns))
}


# statistical_complexity(x= rnorm(10000), ndemb = 6)

# a more user-friendly (but slow!) implementation of the Fisher information:
# save transform_vecs as DATA!! THEN THERE IS NO NEED TO COMPUTE THEM ALL THE TIME;
# AND IT's always FAST!
# make named list for each transformation_vector:
# transformPermCodingData is a dataset that contains the transformation vectors for the standard cases:


# ----------------------------------------------------
# Number of forbiden patterns:
# ----------------------------------------------------
# returns the number of forbiden patterns (in %) from any ordinal pattern distribution:
#' @keywords internal
nforbiden = function(opd) {
  return(length(which(opd == 0)) / length(opd))
}


# ----------------------------------
# AUXILIARY FUNCTIONS:
# ----------------------------------
# compute non-normalized Shannon Entropy:
#' @keywords internal
shannon_entropy = function(opd) {
  opd.prob = opd / sum(opd)
  H_s = (-1) * sum(sapply(opd.prob, FUN=function(prob) if (prob >= 1.e-30) return(prob * log(prob)) else return(0)))
  return(H_s)
}


# Complexity measures to implement:
# Permutation Entropy (PE)
# Weighted permutation entropy (WPE)
# Normalized weighted permutation entropy
# Complexity, Jensen-SHannon
# number of forbidden patterns
# Fisher information based on various pattern coding scheme...