
fitModel <- reactive({
  
  data <- modData()
  
  validate(need(input$dv, "Select a column to fit a model"))
  
  validate(need(input$idv, "Select a column to fit a model"))
  
  
  dv <- switch(input$transform, 
               "None" = data[ , input$dv],
               "Square" = (data[ , input$dv])^2,
               "Log" = log(data[ , input$dv]), 
               data[ , input$dv])
  
  mod <- paste("data[ ,", paste0("'",input$idv, "'"), "]", collapse = "+")
  
  modCall <- paste("lm(dv ~ ", mod,")")
  
  model <- eval(parse(text = modCall))
  
  })



output$modOut <- renderPrint({
  
  out <- summary(fitModel())
  
  rownames(out$coefficients)[-1] <- unlist(input$idv)
  
  showModOut(out,signif.stars = FALSE)
  
  })

output$modPlot <- renderPlot({
  
  data <- modData()
  
  validate(need(input$dv, "Select a column to fit a model"))
  
  validate(need(input$idv, "Select a column to fit a model"))
  
  theDV <- switch(input$transform, 
               "None" = data[ , input$dv],
               "Square" = (data[ , input$dv])^2,
               "Log" = log(data[ , input$dv]), 
               data[ , input$dv])

  cols <- ifelse(length(input$idv) <= 3, length(input$idv), 3)

  plotList <- list()
  
  
  for(i in seq_along(input$idv)){
    
    theVar <- input$idv[[i]]
    varData <- data[[theVar]]
    

    plotCall <- paste("qplot(", theVar, ", theDV, data = data,
                      xlab ='", theVar,"', ylab = input$dv)")
    
    plotList[[i]] <- eval(parse(text = plotCall))

    }
  
  multiplot(plotlist = plotList, cols = cols)

})




output$diagPlot1 <- renderPlot({
  
  x <- fitModel()
  qplot(x$fitted.values, x$residuals) + geom_smooth(se = FALSE, col = "#CDDE5A") +
    geom_hline(aes(yintercept = 0), linetype = 2, col = "black") + 
    labs(title = "Residual vs Fitted", x = "Fitted Values", y = "Residuals")
  
})

output$diagPlot2 <- renderPlot({
  
  x <- fitModel()
  a <- quantile(x$residuals, probs = c(0.25, 0.75))
  b <- qnorm(c(0.25, 0.75))
  s <- diff(a)/diff(b)
  int <- a[1] - s*b[1]
  qplot(sample = x$residuals, stat = "qq") + 
    geom_abline(aes(slope = s, intercept = int))
  
})


