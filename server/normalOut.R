
output$normalPlot <- renderPlot({
  
  data <- normalData()
  
  validate(need(input$columnNormal, "Select a column to test"))
  validate(need(input$normalTransform, "Set mean to run test"))
  
  column <- switch(input$normalTransform, 
                   "None" = data[ , input$columnNormal], 
                   "Square" = (data[ , input$columnNormal])^2, 
                   "Log" = log(data[ , input$columnNormal]), 
                   "Exp" = exp(data[ , input$columnNormal]))
  
  if(any(column == Inf)) stop(paste("Cannot apply", input$normalTransform, "transform to this data."))
  
  plot <- qplot(column, y = ..density.., geom = "histogram", fill = I("#CDDE5A"), col = I("black")) + 
    labs(title = paste("Histogram of", input$columnNormal)) + 
    xlab(input$columnNormal)
  
  plot <- plot + geom_vline(aes(xintercept = mean(column)), col = "red")
  
  suppressMessages(print(plot))
})



output$normalMeanBox <- renderValueBox({
  
  data <- normalData()
  
  validate(need(input$columnNormal, "Select a column to test"))
  validate(need(input$normalTransform, "Set mean to run test"))
  
  column <- switch(input$normalTransform, 
                   "None" = data[ , input$columnNormal], 
                   "Square" = (data[ , input$columnNormal])^2, 
                   "Log" = log(data[ , input$columnNormal]), 
                   "Exp" = exp(data[ , input$columnNormal]))
  
  if(any(column == Inf)) column <- column[column != Inf]
  
  trueMean <- mean(column, na.rm = TRUE)
  
  trueMean<- round(trueMean, 5)
  
  valueBox(trueMean, "Mean")
  
})


output$normalpvalueBox <- renderValueBox({
  
  data <- normalData()
  
  validate(need(input$columnNormal, "Select a column to test"))
  validate(need(input$normalTransform, "Set mean to run test"))
  
  column <- switch(input$normalTransform, 
                   "None" = data[ , input$columnNormal], 
                   "Square" = (data[ , input$columnNormal])^2, 
                   "Log" = log(data[ , input$columnNormal]), 
                   "Exp" = exp(data[ , input$columnNormal]))
  
  if(any(column == Inf)) column <- column[column != Inf]
  
  test <- shapiro.test(column)
  
  test <- round(test$p.value, 5)
  
  valueBox(test, "P-Value")
  
})
