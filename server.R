library(shiny)
library(datasets)

# We build a linear model based on Galton data.
galtonData <- galton
fit <- lm(child ~ parent, galton)

# Define server logic required to build the output
shinyServer(function(input, output) {
        # Compute the prediction formula and assign to the output variable
        # Check if the input is correct
        output$cheight <- renderText({
                if (class(input$pheight) == "numeric" && input$pheight >= 50 && input$pheight <= 90){ 
                        sol <<- format(round(fit$coef[1] + fit$coef[2] * input$pheight,1))
                        paste(as.character(sol), " inches")
                }
                else if (class(input$pheight) == "numeric") "Parent's height is out of range!!"
                        else "Wrong Input, not numeric!!"
                })

        # Generate a plot of the data and linear model
        output$lmPlot <- renderPlot({
                plot(galtonData$parent, galtonData$child, xlab = "Parent's Height", 
                     ylab = "Child's Height", pch = 16, xlim = c(50,90), ylim = c(56, 82))
                abline(fit, col = "red", lwd = 4)
                points(input$pheight, sol, pch = 19, col = "blue", lwd = 10)
        })
})