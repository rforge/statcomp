# --------------------------------------------------------------------
# User-friendly function to generate permutations coding schemes:
# --------------------------------------------------------------------
# the function generateCodingScheme generates different target patterns!
# target_pattern: a character vector that specifies the permutation coding scheme!
# options are: "lehmerperm", "kellerperm", 
#              "lehmerperm_Olivares", "kellerperm_Olivares", 
#              "lehmerperm_bitflips_adjusted", "kellerperm_bitflips_adjusted", 
#              "lehmerperm_jumps_adjusted", "kellerperm_jumps_adjusted", 
#              "random"
# ndemb: the embedding dimension of the coding scheme

#' @title A function to generate a variety of permutation coding schemes
#' @export
#' @description Calculates a user-specified permutation coding scheme (see Olivares et al 2012 for details). 
#' @usage generateCodingScheme(target_pattern = "lehmerperm", ndemb)
#' @param target_pattern A character vector that specifies the pattern to be generated. Options are:
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
#' This function returns a numeric matrix of the permutation ordering scheme in the 'ranks' ordering scheme (i.e. permutations are denoted differently as in Keller and Sinn, 2005).
#' @return A numeric matrix of the dimensions c(factorial(ndemb), ndemb), which contains all permutations.
#' @references see e.g. Olivares et al. 2012
#' @author Sebastian Sippel
#' @examples
#' generateCodingScheme(target_pattern = "lehmerperm", ndemb = 4)
generateCodingScheme = function(target_pattern = NA, ndemb, returnIDXVec = F) {
  
  # Switch between differen options for target_pattern:
  pattern = NA
  switch(EXPR=target_pattern,
         lehmerperm = { 
           pattern = generate_lehmerperm_matrix(N=ndemb)
         }, 
         kellerperm = {
           pattern = generate_kellerperm_matrix(N=ndemb)
         },
         lehmerperm_Olivares = {
           pattern = generate_lehmerperm_matrix_Olivares(N=ndemb)
         },
         kellerperm_Olivares = {
           pattern = generate_kellerperm_matrix_Olivares(N=ndemb)
         },
         # Adjustment options for bitflips:
         lehmerperm_bitflips_adjusted = {
           pattern = adjust_bitflips_pattern(generate_lehmerperm_matrix(N=ndemb))
         },
         kellerperm_bitflips_adjusted = {
           pattern = adjust_bitflips_pattern(generate_kellerperm_matrix(N=ndemb))
         },
         # Adjustment options for jumps:
         lehmerperm_jumps_adjusted = {
           pattern = adjust_jumps_pattern(generate_lehmerperm_matrix(N=ndemb))
         },
         kellerperm_jumps_adjusted = {
           pattern = adjust_jumps_pattern(generate_kellerperm_matrix(N=ndemb))
         },
         random = {
           temp_pattern = generate_lehmerperm_matrix(N=ndemb)
           random.vec = sample(x = 1:factorial(ndemb), size=factorial(ndemb), replace=F)
           # randomize:
           pattern = t(sapply(1:factorial(ndemb), FUN=function(i) temp_pattern[random.vec[i],]))
         },
         stop("A valid option for 'target_pattern' must be supplied!")
  )
  # Return pattern if generation was succesful:
  if (any(is.na(pattern))) {
    print("A valid option for 'target_pattern' must be supplied!")
    return()
  } else {
    print(paste(target_pattern, "has been succesfully generated!"))
    
    # return either matrix or pattern:
    if (returnIDXVec == F) return(pattern)  else return( transformPermCoding(target_pattern = pattern, ndemb = ndemb) )
  }
}


