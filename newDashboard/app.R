#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

userint <- dashboardPage(
  dashboardHeader(title = "Dan's Data Dashboard"),
  dashboardSidebar(),
  dashboardBody(
    #assign plots to a row/column
    fluidRow(
      box(plotOutput("plotone", height = 500)),
      
      box(title = "Slider!", sliderInput("slider", "Number of Observations:", 0, 100, 10)
      )
    )
  )
)

server <- function(input, output){ 
  set.seed(122)
  histdata <- rnorm(500)
  output$plotone <- renderPlot({
    Data <- histdata[seq_len(input$slider)]
    hist(Data, title = "Interactive Histogram")
  })
}

shinyApp(ui = userint, server = server)

