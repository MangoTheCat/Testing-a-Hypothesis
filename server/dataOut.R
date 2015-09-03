# Data outputs
output$selectedDataView <- renderDataTable(viewerData(), 
                                           options = list(pageLength = 15,
                                                                        lengthMenu = c(5, 15, 25, 50)))
