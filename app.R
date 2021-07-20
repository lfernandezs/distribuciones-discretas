library(shiny)
library(shinythemes)
library(ggplot2)

source('myUI.R', local = TRUE)
source('myServer.R')

shinyApp(ui = ui, server = server)
