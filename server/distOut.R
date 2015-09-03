# Distribution outputs
output$distPlot <- renderPlot({
  
  data <- distData()
  
  validate(need(input$columnDist, "Select a column to generate plot"))
  
  if(class(data[ ,input$columnDist]) == "factor"){
    
    plot <- qplot(data[ ,input$columnDist], fill = I("#CDDE5A"), col = I("black")) + 
      labs(title = paste("Histogram of", input$columnDist)) + 
      xlab(input$columnDist)
    
  } else{
      
    plot <- switch(input$plotType,
                   "Histogram" = {
                     
                     qplot(data[ ,input$columnDist],y = ..density.., geom = "histogram", , fill = I("#CDDE5A"), col = I("black")) + 
                       labs(title = paste("Histogram of", input$columnDist)) + 
                       xlab(input$columnDist)
                     
                   },
                   "Density Plot" = { 
                     
                     qplot(data[ ,input$columnDist], geom = "density") +  
                       labs(title = paste("Histogram of", input$columnDist)) + 
                       xlab(input$columnDist)
                     
                   }, 
    )
    
    if(input$addMedian) 
      plot <- plot + geom_vline(aes(xintercept = median(data[ ,input$columnDist])), col = "green")
    if(input$addDensity & input$plotType == "Histogram") 
      plot <- plot + geom_density(colour = "red")
    #lines(density(data[, input$columnDist]), col = "red")
    
    
    }
  
  
  
  print(plot)
  
})
