# Function:
make.data.frame <- function(cur.mat) {
  cur.df = data.frame(cur.mat)
  colnames(cur.df) = c("x", "y")
  return(cur.df)  
}




# Read different limit curves:

mind3 <- make.data.frame(as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/mind3.txt")))
maxd3 <- make.data.frame(as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/maxd3.txt")))
mind4 <- make.data.frame(as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/mind4.txt")))
maxd4 <- make.data.frame(as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/maxd4.txt")))
mind5 <- make.data.frame(as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/mind5.txt")))
maxd5 <- make.data.frame(as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/maxd5.txt")))
mind6 <- make.data.frame(as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/mind6.txt")))
maxd6 <- make.data.frame(as.matrix(read.table("/Users/ssippel/Studium_Geooekologie/Master_Thesis/R/Functions/Data/Cjs_minmaxcurves/maxd6.txt")))

setwd("/Users/ssippel/code/R_packages/statcomp/statcomp/pkg/data/")
save(list=c("mind3", "maxd3", "mind4", "maxd4", "mind5", "maxd5", "mind6", "maxd6"), file="limit_curves.RData")
# save.image(file="limit_curves.RData")
