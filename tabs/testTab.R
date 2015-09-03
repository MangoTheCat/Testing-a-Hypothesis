titlePanel("Hypothesis Testing")

fluidRow(
  column(width = 3,
         box(width = NULL, solidHeader = TRUE, title = "Data",
             
             p("We can also use t-tests to test if the mean of two subsets of data have the same mean. Here we are going to investigate this."),
             
             selectInput("chosenTestData", label = "Choose a dataset:", choices = availableData)
             
         ),
         box(width = NULL, title = "T-Test",
             
             p("Fit a two-sample t-test. First of all choose the variable in the data to test and then the variable that should be used to split the data"),
             
             uiOutput("columnTestChoices"),
             
             uiOutput("columnTestSplitChoices")
             
         )
  ),
  
  column(width = 9,
         box(plotOutput("testPlot", height = 600), width = NULL),
         br(),
         valueBoxOutput("mean1Box", width = 4),
         valueBoxOutput("mean2Box", width = 4),
         valueBoxOutput("pvalue2Box", width = 4)
         
  )
)