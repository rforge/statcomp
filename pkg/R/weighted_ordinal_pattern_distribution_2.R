weighted_ordinal_pattern_distribution_2 = function(x, ndemb) {
  
  
  epsilon=1.e-10
  npdim=factorial(ndemb)
  
  #Berechnungs der Ordnungsstatistik nach der Kodierung von Karsten Keller:
  #Physica A 356 (2005) 114-120
  
  nfac=factorial(ndemb)
  
  wifrec=.C("weighted_ordinal_pattern_loop",
           as.double(x),
           as.integer(length(x)),
           as.integer(ndemb),
           numeric(nfac),
           as.integer(nfac),NAOK=T)[[4]]
  
  # ifrec is the ordinal pattern distribution in the Keller coding scheme!
  return(wifrec)
}