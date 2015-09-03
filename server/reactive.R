## Read in data for each panel
viewerData <- reactive({
  
  readRDS(file.path("./Data", paste(input$chosenData, ".rds", sep = "")))
  
})



distData <- reactive({
  
  readRDS(file.path("./Data", paste(input$chosenDistData, ".rds", sep = "")))
  
})


oneTestData <- reactive({
  
  readRDS(file.path("./Data", paste(input$chosenOneTestData, ".rds", sep = "")))
  
})

testData <- reactive({
  
  readRDS(file.path("./Data", paste(input$chosenTestData, ".rds", sep = "")))
  
})


normalData <- reactive({
  
  readRDS(file.path("./Data", paste(input$chosenNormalData, ".rds", sep = "")))
  
})

modData <- reactive({
  
  readRDS(file.path("./Data", paste(input$chosenModData, ".rds", sep = "")))
  
})