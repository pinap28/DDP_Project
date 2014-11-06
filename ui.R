library(shiny)

# Define UI for predict child's height application
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Predict Child's Height given Parent's Height"),
        
        # Sidebar with the prediction explanation and input data
        sidebarPanel(
                #Prediction explanation
                h2("Prediction"),
                p("We are using the data from the famous 1885 study of ", 
                  span(strong("Francis Galton")), 
                  "exploring the relationship between the heights of children and the 
                  height of their parents, to build our predicting model. The variables 
                  are the height of the adult child and the midparent height, defined as 
                  the average of the height of the father and 1.08 times the height 
                  of the mother. The units are inches. The number of cases is 928, 
                  representing 928 children and their 205 parents."),
                
                #Input data
                h2("Input Data"),
                numericInput("pheight", "Parent's Height (in inches):", 70, min = 50, max = 90, 
                             step = 0.1),
                p("Predicion runs for values between 50 and 90 inches."),
                
                #Sidebar width
                width = 4
        ),
        
        mainPanel(
                h2("Child's Expected Height:"),
                tags$style(type='text/css', '#cheight {color: blue; font-size: 200%}'),
                verbatimTextOutput("cheight"),
                
                h2("Prediction, Data and Linear Model Plot:"),
                plotOutput("lmPlot"),
                width = 8
        )
))