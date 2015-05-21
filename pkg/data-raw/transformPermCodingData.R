## This script is to produce transformPermCoding_vectors:
# Sebastian Sippel
# 20.02.2015

transformPermCodingData = list()

lehmerperm_vec = sapply(3:7, FUN=function(x) transformPermCoding(target_pattern="lehmerperm", ndemb=x))
names(lehmerperm_vec) = c("3","4","5","6","7")

kellerperm_vec = sapply(3:7, FUN=function(x) transformPermCoding(target_pattern="kellerperm", ndemb=x))
names(kellerperm_vec) = c("3","4","5","6","7")

lehmerperm_bitflip_adjusted_vec = sapply(3:7, FUN=function(x) transformPermCoding(target_pattern="lehmerperm_bitflips_adjusted", ndemb=x))
names(lehmerperm_bitflip_adjusted_vec) = c("3","4","5","6","7")

kellerperm_bitflip_adjusted_vec = sapply(3:7, FUN=function(x) transformPermCoding(target_pattern="kellerperm_bitflips_adjusted", ndemb=x))
names(kellerperm_bitflip_adjusted_vec) = c("3","4","5","6","7")

lehmerperm_jumps_adjusted_vec = sapply(3:7, FUN=function(x) transformPermCoding(target_pattern="lehmerperm_jumps_adjusted", ndemb=x))
names(lehmerperm_jumps_adjusted_vec) = c("3","4","5","6","7")

kellerperm_jumps_adjusted_vec = sapply(3:7, FUN=function(x) transformPermCoding(target_pattern="kellerperm_jumps_adjusted", ndemb=x))
names(kellerperm_jumps_adjusted_vec) = c("3","4","5","6","7")

lehmerperm_Olivares = sapply(3:7, FUN=function(x) transformPermCoding(target_pattern="lehmerperm_Olivares", ndemb=x))
names(lehmerperm_Olivares) = c("3","4","5","6","7")

kellerperm_Olivares = sapply(3:7, FUN=function(x) transformPermCoding(target_pattern="kellerperm_Olivares", ndemb=x))
names(kellerperm_Olivares) = c("3","4","5","6","7")

transformPermCodingData = list(lehmerperm_vec, kellerperm_vec, lehmerperm_bitflip_adjusted_vec, kellerperm_bitflip_adjusted_vec,
     lehmerperm_jumps_adjusted_vec, kellerperm_jumps_adjusted_vec, lehmerperm_Olivares, kellerperm_Olivares)
names(transformPermCodingData) = c("lehmerperm", "kellerperm", "lehmerperm_bitflip_adjusted", "kellerperm_bitflip_adjusted",
                                      "lehmerperm_jumps_adjusted", "kellerperm_jumps_adjusted", "lehmerperm_Olivares", "kellerperm_Olivares")

transformPermCodingData$lehmerperm[paste(ndemb)]
setwd("/Users/ssippel/code/R_packages/statcomp/pkg/data-raw/")
save(transformPermCodingData, file="transformPermCodingData.RData")

# setwd("/Users/ssippel/code/R_packages/statcomp/")
load("/Users/ssippel/code/R_packages/statcomp/pkg/data-raw/transformPermCodingData.RData")
use_data(transformPermCodingData, internal=T)
use_data_raw()


