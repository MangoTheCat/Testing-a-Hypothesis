titlePanel("Distributions")

fluidRow(
  
  box(width = 3, solidHeader = TRUE, title = "Inputs",
      
      p("Data can fit many distributions. Using datasets from the last exercise lets investigate what the distribution looks like."),
      
      selectInput("chosenDistData", label = "Choose a dataset:", choices = availableData),
      
      uiOutput("columnChoices"),
      
      selectInput("plotType", label = "Select Plot Type:", choices = c("Histogram", "Density Plot")),
      
      checkboxInput("addMedian", "Add median line"),
      
      conditionalPanel("input.plotType == 'Histogram'", 
                       checkboxInput("addDensity", "Add density curve")
      )
      
  ),
  
  box(plotOutput("distPlot", height = 600), width = 9)
)