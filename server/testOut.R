## Test outputs
output$testPlot <- renderPlot({
  
  data <- testData()
  
  validate(need(input$columnTest, "Select a column to test"))
  
  validate(need(is.numeric(data[ , input$columnTest]), "Data must be numeric"))
  
  splitData <- split(data[ , input$columnTest], data[ , input$columnSplitTest]) 
  
  plot <- qplot(data[ , input$columnTest], geom = "density", 
                colour = data[ , input$columnSplitTest]) + 
    scale_colour_manual(input$columnSplitTest, values = c("#CDDE5A", "black")) + 
    xlab(input$columnSplitTest)
  

  #mtext(paste("P-value: ", test, sep = ""), 1, line = 5)
  
  suppressMessages(plot(plot))
  
})

output$mean1Box <- renderValueBox({
  
  data <- testData()
  
  validate(need(input$columnTest, "Select a column to test"))
  
  validate(need(is.numeric(data[ , input$columnTest]), "Data must be numeric"))
  
  splitData <- split(data[ , input$columnTest], data[ , input$columnSplitTest]) 
  
  trueMean <- mean(splitData[[1]], na.rm = TRUE)
  
  trueMean<- round(trueMean, 5)
  
  valueBox(trueMean, "Mean Group 1")
  
})


output$mean2Box <- renderValueBox({
  
  data <- testData()
  
  validate(need(input$columnTest, "Select a column to test"))
  
  validate(need(is.numeric(data[ , input$columnTest]), "Data must be numeric"))
  
  splitData <- split(data[ , input$columnTest], data[ , input$columnSplitTest]) 
  
  trueMean <- mean(splitData[[2]], na.rm = TRUE)
  
  trueMean<- round(trueMean, 5)
  
  valueBox(trueMean, "Mean Group 2")
  
})

output$pvalue2Box <- renderValueBox({
  
  data <- testData()
  
  validate(need(input$columnTest, "Select a column to test"))
  
  validate(need(is.numeric(data[ , input$columnTest]), "Data must be numeric"))
  
  splitData <- split(data[ , input$columnTest], data[ , input$columnSplitTest]) 
  
  test <- t.test(splitData[[1]], splitData[[2]])
  
  test <- round(test$p.value, 5)
  
  valueBox(test, "P-Value")
  
})
