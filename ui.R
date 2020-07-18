library(shiny)

# Define UI for application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict the miles per gallon for a car"),
  
  # Sidebar
  sidebarLayout(
    sidebarPanel(
      helpText("This simple application predicts the mpg for a car based on specified parameters."),
      
      h3(helpText("Please choose:")),
      
      selectInput("cylinders", label = h4("cylinders"),
                  choices = list("3" = "3", "4" = "4", "5" = "5",
                                 "6" = "6", "7" = "7", "8" = "8")),
      
      numericInput("horsepower", label = h4("horsepower"), step = 5, value = 40),
      
      numericInput("acceleration", label = h4("acceleration"), step = 1, value = 8)
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h4("Predicted miles per gallon:"),
       h3(textOutput("result"))
    )
  )
))
