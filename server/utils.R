getFactors <- function(data){
  
  types <- sapply(data, class)
  
  factors <- which(types=="factor")
  
  data[ ,factors, drop = FALSE]
  
}


getNumeric <- function(data){
  
  types <- sapply(data, class)
  
  factors <- which(types!="factor" & types != "Date")
  
  data[ ,factors, drop = FALSE]
  
}