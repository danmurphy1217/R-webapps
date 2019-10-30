#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
# https://rstudio.github.io/shinydashboard/structure.html
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)


header <- dashboardHeader(
    title = "Dan's Dashboard",
    dropdownMenu(type = "notifications",
                 notificationItem(
                     text = "Welcome to my data dashboard",
                     icon("users")
                 ),
                 notificationItem(
                     text= "I hope you enjoy my site!",
                     icon("users"),
                     status = "warning"
                 )
         ),
    dropdownMenu( type = "tasks", badgeStatus = "success",
                  taskItem(value = 100, color = "green", "Register & Log In"),
                  taskItem(value = 75, color = "yellow", "Finalize Dashboard Header"),
                  taskItem(value = 50, color = "orange", "Finalize dashboard sidebar"),
                  taskItem(value = 2.5, color = "red", "Finalize Dashboard Body")
                 
    )
)

sidebar <- dashboardSidebar(
    
)

body <- dashboardBody(
    
)

userint <- dashboardPage(header, sidebar, body)


server <- function(input, output){ 
    set.seed(122)
    histdata <- rnorm(500)
    output$plotone <- renderPlot({
        Data <- histdata[seq_len(input$slider)]
        hist(Data, title = "Interactive Histogram")
    })
}

shinyApp(ui = userint, server = server)
