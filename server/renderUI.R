
# render UI for each panel
output$columnChoices <- renderUI({selectInput("columnDist", "Select Column:", 
                                              choices = names(distData()))})

output$columnOneTestChoices <- renderUI({
  
  data <- oneTestData()
  
  data <- getNumeric(data)
  
  selectInput("columnOneTest", "Select Column:", choices = names(data))})


output$meanRange <- renderUI({
  
  data <- oneTestData()
  
  validate(need(input$columnOneTest, "Select a column to run t-test"))
  
  mean <- mean(data[ ,input$columnOneTest])
  min <- floor(mean(data[ ,input$columnOneTest])) - 1
  max <- ceiling(mean(data[ ,input$columnOneTest])) + 1
  
  sliderInput("meanValue", "Choose a mean to test:", 
              min = min, 
              max = max,
              value = mean, 
              step = 0.1)
  
})

output$columnTestChoices <- renderUI({
  
  data <- testData()
  
  data <- getNumeric(data)
  
  selectInput("columnTest", "Select Column:", choices = names(data))
  
})


output$columnTestSplitChoices <- renderUI({
  
  data <- testData()
  
  data <- getFactors(data)
  
  totalLevels <- sapply(data, nlevels)
  
  data <- data[ , totalLevels == 2, drop = FALSE]
  
  selectInput("columnSplitTest", "Select Category Column:", choices = names(data))
  
})


output$columnNormalChoices <- renderUI({
  
  data <- normalData()
  
  data <- getNumeric(data)
  
  selectInput("columnNormal", "Select Column:", choices = names(data))
  
})


output$dvChoices <- renderUI({
  
  data <- modData()
  
  data <- getNumeric(data)
  
  selectInput("dv", "Select Dependent Variable:", choices = names(data), 
              selected = names(data)[1])
  
})



output$idvChoices <- renderUI({
  
  data <- modData()
  
  selectInput("idv", "Select Independent Variable:", choices = names(data), 
              selected = names(data)[2], multiple = TRUE)
  
})




