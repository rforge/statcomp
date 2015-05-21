# -------------------------------------------------------
# AUXILIARY FUNCTIONS
# -------------------------------------------------------
# This is a collection of package-internal, auxiliary functions:


# var.fun: calculates the variance, such as in Fadlallah et al (2013)
#' @keywords internal
#' @export
var.fun = function(x) var(x) * (length(x) - 1) / length(x)

#
# ------------------------------------------------------
# Internal functions to compute pattern coding schemes:
# all permutation codings are defined as ranks (i.e. in contrast to e.g. Olivares et al 2012)
# for comparability to Olivares et al, those matrices can still be generated


# Generate Lehmer matrix following Olivares et al 2012:
#' @keywords internal
generate_lehmerperm_matrix <- function(N) {
  return(t(sapply(1:factorial(N), FUN=function(x) lehmerperm(N=N, M = x) - 1)))
}

# Generate Keller_matrix following Olivares et al 2012:
#' @keywords internal
generate_kellerperm_matrix <- function(N) {
  lehmer_mat = generate_lehmerperm_matrix(N)
  keller_mat = array(data=NA, dim=c(factorial(N), N))
  
  for (i in 1:factorial(N)) {
    idx = which(ordinal_pattern_distribution(index.to.rank(lehmer_mat[i,]), ndemb = N) == 1)
    keller_mat[idx,] = lehmer_mat[i,]
  }
  return(keller_mat)    
}

# Generate Lehmer matrix following Olivares et al 2012, BUT AS RANKS:
#' @keywords internal
generate_lehmerperm_matrix_Olivares <- function(N) {
  lehmer = generate_lehmerperm_matrix(N)
  return(t(sapply(1:factorial(N), FUN=function(x) { index.to.rank(lehmer[x,]) })))
}


# Generate Keller matrix following Olivares et al 2012, BUT AS RANKS:
#' @keywords internal
generate_kellerperm_matrix_Olivares <- function(N) {
  lehmer_mat = generate_lehmerperm_matrix(N)
  keller_mat = array(data=NA, dim=c(factorial(N), N))
  
  for (i in 1:factorial(N)) {
    idx = which(ordinal_pattern_distribution(lehmer_mat[i,], ndemb = N) == 1)
    keller_mat[idx,] = lehmer_mat[i,]
  }
  return(keller_mat)  
}

# Generate NEW pattern coding schemes:
# ----------------------------------------------------------------------------
# Generate "adjusted" pattern, in which patterns are sorted based on bitflips:
#' @keywords internal
adjust_bitflips_pattern <- function(pattern_matrix) {
  ## This function sorts ordinal pattern according to their number of bitflips.
  ## The order is preserved amonth ordinal patterns that have
  ## the same number of bitflips.
  # N is the embedding dimension
  patterns_nbitflips <- findinversions(pattern_matrix)
  
  # sort based on patterns_nbitflips:
  sort.idx = sort.int(x=patterns_nbitflips, decreasing=F, index.return=T)$ix
  
  return(t(sapply(sort.idx, FUN=function(idx) pattern_matrix[idx,])))
}


# Generate "jumps-adjusted" pattern:
#' @keywords internal
adjust_jumps_pattern <- function(pattern_matrix) {
  # sorts pattern matrix based on the number of jumps:
  patterns_njumps = njumps(pattern_matrix)
  sort.idx = sort.int(x=patterns_njumps, decreasing=F, index.return=T)$ix
  
  return(t(sapply(sort.idx, FUN=function(idx) pattern_matrix[idx,])))
}





# -------------------------------
# FOR INTERNAL USE
# -------------------------------
# converts ranks to indices:
#' @keywords internal
rank.to.index <- function(pattern) {
  n = length(pattern)
  pattern_sorted = sort(pattern, decreasing = T)
  idx <- numeric(length=n)
  for (i in 1:n) {
    idx[i] = n - which(pattern==pattern_sorted[i])
  }
  return(idx)
}

# converts indices to ranks:
#' @keywords internal
index.to.rank <- function(pattern) {
  n = length(pattern)
  pattern_sorted = sort(pattern, decreasing = T)
  rank = numeric(length=n)
  for (i in 1:n) {
    rank[n-pattern[i]] = pattern_sorted[i]
  }
  return(rank)
}

#' @keywords internal
njumps <- function(permutations_matrix) {
  D = dim(permutations_matrix)[2]
  njumps <- numeric(length=factorial(D))
  
  for (i in 1:factorial(D)) {
    for (j in 1:(D-1)) {
      njumps[i] = njumps[i] + abs(permutations_matrix[i,j] - permutations_matrix[i,j+1]) -1
    }
  }
  return(njumps)
}

#' @keywords internal
findinversions <- function(patterns) {
  d <- dim(patterns)[2]
  inver <- NULL
  patdiff <- NULL
  for (i in 1:dim(patterns)[1]) {
    inver[i] = 0
    for (k in (1:(d-1))) {
      patdiff[k] = sign(patterns[i,k+1]-patterns[i,k])
    }
    inver[i] = 0
    for (l in 1:(length(patdiff)-1)) {
      inver[i] = inver[i] + abs(sign(patdiff[l+1]-patdiff[l]))
    }
  }
  return(inver)
}


## FACTORADIC function:
#' @keywords internal
factoradic <- function(M,N) {
  f = array(data = 0, dim=c(1,N))
  jj = 2
  
  while (M != 0) {
    f[,N-jj+1] <- M%%jj
    M <- floor(M/jj)
    jj <- jj+1
  }
  
  return(f)
}




# lehmerperm:
#' @keywords internal
lehmerperm = function(N,M) {
  # lehmerperm - obtain the M-th permutation of (1:N)
  #   perm = lehmerperm(N,M) returns the m-th permutation of the sorted list
  #   of all permutations from PERMS, where M=1 corresponds to identity 
  #   permutation. N, M are non-negative scalar, perm has size 1-by-N.
  #
  #   See also PERMS
  #        and NPERMUTEK, RECPERMS, NEXTPERM, PERMS1 on the File Exchange
  #
  # Algorithm: For given N and M, where 1 <= M <= N!, the M-th 
  #            permutation of N objects is closely related to the 
  #            factoradic of M; see factoradic on the File Exchange.
  #            To convert the factoradic into a permutation follow these
  #            steps
  #            
  #            For decreasing i
  #                If element(j)>=element(i) ; where j>i
  #                    element(j) increase by one.
  #
  #            The result will be a permutation of (0:N-1).
  #            Add 1 to yield the permutation of (1:N).
  
  # for Matlab (should work for most versions)
  # version 1.0 (Feb 2009)
  # (c) Darren Rowland
  # email: darrenjrowland@hotmail.com
  #
  # Keywords: single permutation
  
  # MatLab-code translated into R by Sebastian Sippel, 11.10.2013
  
  #error(nargchk(2,2,nargin));
  nargin <- length(as.list(match.call()))-1
  if(nargin != 2) stop("Wrong number of input elements")
  
  if(length(N) != 1 | N <= 0 | round(N, digits=0) != N) stop("The first input has to be a non-negative integer")
  
  if(length(M) != 1 | M <= 0 | round(M, digits=0) != M) stop("The second input has to be a non-negative integer")
  
  if(M > factorial(N)) stop("M should not exceed N!")
  
  # convert M to zero-based
  M = M-1;
  perm = factoradic(M,N)
  
  for (ii in (N-1):1) {
    
    ##Alternative Schleife:
    #     for jj = ii+1:N
    #         if(perm(jj)>=perm(ii))
    #             perm(jj) = perm(jj) + 1;
    #         end
    #     end
    
    #for (ii in (N-1):1) {
    #for (jj in (ii+1):N) {
    #  if(perm[,jj] >= perm [,ii]) perm[,jj] = perm[,jj] +1
    #}
    #}
    
    #perm(ii+1:N) = perm(ii+1:N) + (perm(ii+1:N)>=perm(ii)); -> original vector
    
    perm[,(ii+1):N] <- ifelse (perm[,(ii+1):N] >= perm[,ii], perm[,(ii+1):N]+1, perm[,(ii+1):N])
  }
  # convert permutation to one-based (from zero-based)
  perm = perm + 1
  
  return(perm)
}


# ----------------------------------------------------------------------------
# Generate vector for transforming opd-original to any given ordinal pattern distribution!
# ----------------------------------------------------------------------------
# the "natural" coding scheme of my function is generate_kellerperm_matrix_Olivares!
# INPUTS: 
# ndemb: Embedding dimension for time series
# target_pattern: either a character vector specifying the target pattern, 
# or a numeric matrix, which contains a self-constructed permutation coding scheme!
# OUTPUT: a numeric vector that contains the indices for changing the ordering for the ordinal pattern distribution!

#' @title A function to generate a vector from an index-transformation vector from a permutation coding scheme
#' @keywords internal
#' @description Generates a position vector to change the ordinal pattern distribution in the default permutation coding scheme (i.e. generated by ordinal_pattern_distribution(x, ndemb)) into a user-specified coding scheme. This is a required input for the function changePermCodingOPD.
#' @usage transformPermCoding(target_pattern = "lehmerperm", ndemb = 4)
#' @param target_pattern A character vector or numeric matrix that specifies the pattern to be transformed into the position vector. If a numeric matrix, could be generated by the function generateCodingScheme(target_pattern, ndemb), or user-specified. If a character vector is given, options are:
#' \itemize{
#'  \item{"lehmerperm"}
#'  \item{"kellerperm"}
#'  \item{"lehmerperm_Olivares"}
#'  \item{"kellerperm_Olivares"}
#'  \item{"lehmerperm_bitflips_adjusted"}
#'  \item{"kellerperm_bitflips_adjusted"}
#'  \item{"lehmerperm_jumps_adjusted"}
#'  \item{"kellerperm_jumps_adjusted"}
#' }
#' @param ndemb Embedding dimension of the ordinal patterns (i.e. sliding window size). Should be chosen such as length(x) >> ndemb
#' @details 
#' This function returns a character vector to transform the output of ordinal_pattern_distribution (permutation coding as of Keller and Sinn, 2005) into a user-specified permutation coding scheme.
#' For example, pattern #5 in "lehmerperm" (ndemb = 5) is given by the ranks c(0, 1, 4, 2, 3). This corresponds to pattern #41 in the (original) Keller coding scheme, as given by transformPermCoding(target_pattern = "lehmerperm", ndemb = 5)[5].
#' @return A numeric vector of length factorial(ndemb), which contains the positions of the corresponding patterns in the Keller Coding scheme. 
#' @references see e.g. Olivares et al. 2012
#' @author Sebastian Sippel
#' @examples
#' transformPermCoding(target_pattern = "lehmerperm", ndemb = 4)
transformPermCoding <- function(target_pattern = NA, ndemb) {
  
  if (is.character(target_pattern)) {
    pattern = generateCodingScheme(target_pattern=target_pattern, ndemb = ndemb)
  } else if (is.numeric(target_pattern) && is.matrix(target_pattern) && (dim(target_pattern) == c(factorial(ndemb), ndemb))) {
    pattern = target_pattern
  } else {
    print("A valid option for 'target_pattern' must be supplied!")
    return(NA)
  }
  transform_vec = sapply(1:factorial(ndemb), FUN=function(i) which(ordinal_pattern_distribution(pattern[i,], ndemb=dim(pattern)[2]) == 1))
  return(transform_vec)
}





