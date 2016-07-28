library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Confidence Intervals"),

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
        
        mainPanel(
            plotOutput("confPlot")
        )
    )
))
