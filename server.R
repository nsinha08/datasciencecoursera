library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)
library(ISLR)
data(Auto)

#required columns for analysis
dta <- Auto

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # Select car(s) depending on user input
    cars <- filter(dta, 
                   grepl(input$cylinders, cylinders), 
                   grepl(input$horsepower, horsepower))
    # build linear regression model
    fit <- lm(mpg~horsepower+acceleration, dta)
    # predicts the origin
    pred <- predict(fit, newdata = data.frame(cylinders = input$cylinders,
                                              horsepower = input$horsepower,
                                              acceleration = input$acceleration
                                              ))
    # Draw the plot using ggplot2
    plot <- ggplot(data=dta, aes(x=mpg, y = horsepower))+
      geom_point(aes(color = horsepower), alpha = 0.3)+
      geom_smooth(method = "lm")+
      geom_vline(xintercept = input$horsepower, color = "red")+
      geom_hline(yintercept = pred, color = "green")
    plot
  })
  output$result <- renderText({
    # Renders the text for the prediction below the graph
    diam <- filter(dta, 
                   grepl(input$cylinders, cylinders), 
                   grepl(input$horsepower, horsepower),
                   grepl(input$acceleration, acceleration))
    fit <- lm(mpg~horsepower+acceleration, dta)
    pred <- predict(fit, newdata = data.frame(cylinders = input$cylinders,
                                              horsepower = input$horsepower,
                                              acceleration = input$acceleration))
  
    res <- pred
    
    res
    
  })
  
})
