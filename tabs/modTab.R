titlePanel("Linear Models")

fluidRow(
  column(width = 3,
         box(width = NULL, solidHeader = TRUE, title = "Data",
             
             p("We can use a simple linear model to explain the relationship between two variables."),
             
             selectInput("chosenModData", label = "Choose a dataset:", choices = availableData)
             
             
         ),
         box(width = NULL, title = "Model",
             
             p("Fit a linear model by first of all choosing the dependent variable and the indenpendent variable. Try changing the transform for the dependent variable to see how the fit of the mode changes."),
             
             uiOutput("dvChoices"),
             
             selectInput("transform", "Select Transform:", choices = c("None", "Square", "Log")),
             
             uiOutput("idvChoices")
             
         )
  ),
  
  column(width = 9,
         box(width = NULL, title = "Fitted Model",solidHeader = TRUE,
             plotOutput("modPlot", height = 600), collapsible = TRUE),
         
         
         box(width = NULL, title = "Model Fit", solidHeader = TRUE, 
             verbatimTextOutput("modOut"), collapsible = TRUE),
         
         tabBox(title = "Diagnostic Plots", width = NULL, id = "diagplot", 
                side = "right", selected = "Residual Against Fitted Values",
             tabPanel("Normal Q-Q Plot", plotOutput("diagPlot2", height = 600)),
             tabPanel("Residual Against Fitted Values", plotOutput("diagPlot1", height = 600)))
  )
)