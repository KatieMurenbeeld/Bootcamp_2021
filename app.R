#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    titlePanel("Let's make a Shiny App!"),
    
    sidebarLayout(## Lots of layout types. 
        sidebarPanel(h4("Coin properties:"), 
                     sliderInput("probSlider", h5("Probability of heads"),
                                 min = 0, max = 1, value = 0.5),
        ),
        mainPanel(h4("Results"), 
                  textOutput("prob"),
                  br(),
                  br(),
                  textOutput("numHeads"))
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$prob <- renderText({ 
        paste("You have selected", input$probSlider)
   
    })

    output$numHeads <- renderText({ 
        heads = rbinom(1,150,input$probSlider)
        paste("After 150 coin flips, we had ", heads, " total heads." )
    })
    
}


# Run the application 
shinyApp(ui = ui, server = server)
