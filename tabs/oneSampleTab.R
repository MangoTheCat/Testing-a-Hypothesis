titlePanel("One Sample Testing")

fluidRow(
  column(width = 3,
         box(width = NULL, solidHeader = TRUE, title = "Data",
             
             p("We can use different statistical tests to investigate our data. Here lets fit a simple one sample t-test to see how the p-value changes as we test different values of the mean."),
             
             selectInput("chosenOneTestData", label = "Choose a dataset:", choices = availableData)
             
         ),
         box(width = NULL, title = "T-Test",
             
             p("Use the options below to select a column and then try varying the mean that we are testing."),
             uiOutput("columnOneTestChoices"),
             
             uiOutput("meanRange")
             
         )
  ),
  
  column(width = 9,
         box(plotOutput("testOnePlot", height = 600), width = NULL),
         br(),
         valueBoxOutput("meanBox", width = 6),
         valueBoxOutput("pvalueBox", width = 6)
  )
)