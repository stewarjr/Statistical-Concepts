library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
    
    output$confPlot <- renderPlot({
        
        # Creating a population to sample from
        population <- rnorm(10000,
                            mean=input$pop.mean,
                            sd=sqrt(input$pop.var))
        # Want 100 confidence intervals total
        samps <- replicate(100, sample(population, input$n))
        samp_means <- apply(samps, 2, mean)
        se_mean <- apply(samps, 2, FUN=function(x) sd(x)/sqrt(input$n)) *
            abs(qt((1 - input$conf.lvl / 100) / 2, df=input$n - 1))
        conf_data <- data.frame(samp_means,
                                LL=samp_means - se_mean,
                                UL=samp_means + se_mean)
        conf_data$Capture = factor(
            ifelse(input$pop.mean < conf_data$LL |
                       input$pop.mean > conf_data$UL,
                   1, 2), levels=1:2)
        
        ggplot(conf_data, aes(1:100, samp_means, col=Capture)) +
            ylim(floor(min(conf_data$LL)) - 1,
                 ceiling(max(conf_data$UL)) + 1) +
            geom_hline(yintercept=input$pop.mean, col="darkblue", lwd=0.8) +
            geom_pointrange(aes(ymin=LL, ymax=UL)) +
            scale_color_manual(values=rainbow(2)) +
            coord_flip() +
            xlab("Sample number") +
            ylab("Sample mean") +
            guides(colour = FALSE) +
            theme_bw()
    })
})
