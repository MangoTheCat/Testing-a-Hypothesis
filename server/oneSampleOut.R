
output$testOnePlot <- renderPlot({
  
  data <- oneTestData()
  
  validate(need(input$columnOneTest, "Select a column to test"))
  validate(need(input$meanValue, "Set mean to run test"))
  
  plot <- qplot(data[ , input$columnOneTest], y = ..density.., geom = "histogram", fill = I("#CDDE5A"), col = I("black")) + 
    labs(title = paste("Histogram of", input$columnOneTest)) + 
    xlab(input$columnOneTest)
  
  plot <- plot + geom_vline(aes(xintercept = mean(data[ , input$columnOneTest])), col = "red")
  

  
  #mtext(paste("P-value: ", test, ", mean: ", trueMean, sep = ""), 1, line = 5)

  suppressMessages(print(plot))
})



output$meanBox <- renderValueBox({
  
  data <- oneTestData()
  
  validate(need(input$columnOneTest, "Select a column to test"))
  
   trueMean <- mean(data[ , input$columnOneTest], na.rm = TRUE)
  
   trueMean<- round(trueMean, 5)
   
  valueBox(trueMean, "Mean")
  
  })


output$pvalueBox <- renderValueBox({
  
  data <- oneTestData()
  
  validate(need(input$columnOneTest, "Select a column to test"))
  validate(need(input$meanValue, "Set mean to run test"))
  
  test <- t.test(data[ , input$columnOneTest], mu = input$meanValue)
  
  test <- round(test$p.value, 5)

  valueBox(test, "P-Value")
  
})
