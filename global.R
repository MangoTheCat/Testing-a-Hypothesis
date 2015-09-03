require(shiny)
require(shinydashboard)
require(ggplot2)

options(warn = -1)

theme_set(theme_bw(base_size = 14))

availableData <- gsub("\\..*", "", list.files("./Data", pattern = "\\.rds") )

source("./server/utils.R", local = TRUE)
source("./server/multiPlot.R")
source("./server/showMod.R")

