# Read different limit curves:

mind3 <- as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/mind3.txt"))
maxd3 <- as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/maxd3.txt"))
mind4 <- as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/mind4.txt"))
maxd4 <- as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/maxd4.txt"))
mind5 <- as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/mind5.txt"))
maxd5 <- as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/maxd5.txt"))
mind6 <- as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/mind6.txt"))
maxd6 <- as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/maxd6.txt"))

setwd("/Users/ssippel/code/R_packages/statcomp/pkg/data/")
save.image(file="limit_curves.RData")
