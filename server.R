shinyServer(function(input, output, session) { 
  
  source("./server/reactive.R", local = TRUE)
  
  source("./server/renderUI.R", local = TRUE)

  source("./server/dataOut.R", local = TRUE)
  
  source("./server/distOut.R", local = TRUE)
 
  source("./server/oneSampleOut.R", local = TRUE)
  
  source("./server/testOut.R", local = TRUE)
  
  source("./server/normalOut.R", local = TRUE)
 
  source("./server/modOut.R", local = TRUE)
}
)


