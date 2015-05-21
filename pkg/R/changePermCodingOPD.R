## Sebastian Sippel
# 05.01.2014

#' @title A function to change the ordering scheme of ordinal patterns
#' @export
#' @description Changes the permutation ordering scheme of a ordinal pattern distribution. This affects the computation of local information measures, but is insensitive to global measures.
#' @usage changePermCodingOPD(opd, ndemb, target_pattern, use_target_pattern = T, transform_vec = NA)
#' @param opd A numeric vector that comprises an ordinal pattern distribution in the Keller coding scheme (Physica A 356 (2005) 114-120).
#' @param ndemb Embedding dimension of the ordinal patterns (i.e. sliding window size).
#' @param target_pattern If specified, must consist of a numeric matrix of the dimensions c(factorial(ndemb), ndemb), which consists of a user-specified permutation coding scheme ('ranks-based').
#' @param transform_vec If specified, a numeric vector that contains indices to change an ordinal pattern distribution from the (original) coding scheme to any user-specified permutation coding scheme.
#' @details 
#' This function returns an ordinal pattern distribution in a user-specified permutation coding scheme.
#' @return An ordinal pattern distribution vector in a user-specified permutation coding scheme.
#' @references none
#' @author Sebastian Sippel
#' @examples
#' x = arima.sim(model=list(ar = 0.3), n = 10^4)
#' opd = ordinal_pattern_distribution(x = x, ndemb = 6)
changePermCodingOPD = function(opd, ndemb, target_pattern = NA, transform_vec = NA) {
  
  # function to change permutation coding in ordinal pattern distribution:
  if (!is.na(target_pattern)) {
    transform_vec = transformPermCoding(target_pattern=target_pattern, ndemb = ndemb)
  }
  
  # Convert ordinal pattern distribution to coding scheme using the transform_vec and return:
  opd.out = sapply(1:factorial(ndemb), FUN=function(i) opd[transform_vec[i]])
  return(opd.out)
}

