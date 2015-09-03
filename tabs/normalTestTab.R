
fluidRow(
  column(width = 3,
         box(width = NULL, solidHeader = TRUE, title = "Data",
             
             p("We can use tests to determine if our data follows a normal distribution. "),
             
             selectInput("chosenNormalData", label = "Choose a dataset:", choices = availableData)
             
         ),
         box(width = NULL, title = "Shapiro-Wilks",
             
             p("Use the options below to select a column and a transformation."),
             uiOutput("columnNormalChoices"),
             
             selectInput("normalTransform", "Choose a transform:", choices = c("None", "Square", "Log", "Exp"))
             
         )
  ),
  
  column(width = 9,
         box(plotOutput("normalPlot", height = 600), width = NULL),
         br(),
         valueBoxOutput("normalMeanBox", width = 6),
         valueBoxOutput("normalpvalueBox", width = 6)
  )
)