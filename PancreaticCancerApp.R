library(shiny)
library(shinythemes)
library(dplyr)
library(readr)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("flatly"),

    # Application title
    titlePanel("Pancreatic Cancer"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            textInput("Age", "Patient Age", "Age in years"),
            selectInput("Sex", "Sex", choices = c("Male", "Female")),
            textInput("Plasma", "Plasma CA19-9", "0-31000U/ml"),
            textInput("Creatinine", "Creatinine Level:", "0-5mg/ml"),
            textInput("LYVE1", "LYVE1 Level:", "0-25ng/ml"),
            textInput("REG1B", "REG1B Level:", "0-1500ng/ml"),
            textInput("TFF1", "TFF1 Level:", "0-15000ng/ml"),
            textInput("REG1A", "REG1A Level:", "0-15000ng/ml")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
