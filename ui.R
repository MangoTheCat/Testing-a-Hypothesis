dashboardPage( 
  
  # Dashboard header
  dashboardHeader(title = "Testing a Hypothesis"),
  
  #Dashboard sidebar, currently disabbled
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data Types", tabName = "data", icon = icon("file")),
      menuItem("Distributions", tabName = "dist", icon = icon("signal")),
      menuItem("Hypothesis Testing", icon = icon("pencil"),
      menuSubItem("One-Sample Test", tabName = "oneSamp"),
      menuSubItem("Two-Sample Test", tabName = "twoSamp"),
      menuSubItem("Test for Normality", tabName = "normal")),
      menuItem("Linear Model", tabName = "model", icon = icon("line-chart"))
    )
    ),
  
  #Body
  dashboardBody(
    
    tabItems(
    #First tab
    tabItem("data", 
    
            source("./tabs/dataTab.R", local = TRUE)$value
    
    ), # end data item
    
    # Second menu tab
     tabItem("dist", 
            
             source("./tabs/distTab.R", local = TRUE)$value
            
    ), # End data tab
    
    # third menu tab
    tabItem("oneSamp", 
            
            source("./tabs/oneSampleTab.R", local = TRUE)$value
            
    ), # End test tab
    
    # third menu tab
    tabItem("twoSamp", 
           
            source("./tabs/testTab.R", local = TRUE)$value
            
    ), # End test tab
    
    # third menu tab
    tabItem("normal", 
            
            source("./tabs/normalTestTab.R", local = TRUE)$value
            
    ), # End test tab
    
    # fourth menu tab
    tabItem("model", 
            
            source("./tabs/modTab.R", local = TRUE)$value
            
    ) # End test tab
    
    
  ) # end tab items
  
  
  ) # end dash body
)