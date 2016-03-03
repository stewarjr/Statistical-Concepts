library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Confidence Intervals"),
    
    # Sidebar with a slider input for the number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("conf.lvl",
                        "Confidence level:",
                        min = 1,
                        max = 99,
                        value = 95),
            sliderInput("pop.mean",
                        "Population mean:",
                        min = -20,
                        max = 100,
                        value = 50),
            sliderInput("pop.var",
                        "Population variance:",
                        min = 1,
                        max = 100,
                        value = 10),
            sliderInput("n",
                        "Sample size (n):",
                        min = 2,
                        max = 100,
                        value = 30)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("confPlot")
        )
    )
))
