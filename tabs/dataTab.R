# First Row

fluidRow(
  
 column(width = 3, 
    
    box(width = NULL, solidHeader = TRUE, title = "Data",
      p("We have seen a number of different data types can exist in our data. Using the selection box below, take a look at some of the data sets and identify the types of data in each."),
    
      selectInput("chosenData", label = "Choose a dataset:", choices = availableData)
    )
    ),
  
  column(width = 9, 
         box(dataTableOutput("selectedDataView"), width = NULL)
         )
  
)
