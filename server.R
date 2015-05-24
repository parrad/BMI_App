# This is the user-interface definition of a Shiny web application.
# With this application one can find the Body Mass Index and the classification.
#

library(shiny)

bmi.value <- function(weight, height) 
{
  if(height > 0)
    weight / (height * height)
}

bmi.class <- function(bmi) 
{
  bmi.df <- read.csv("BMI.csv")
  bmi.df.filtered <- subset(bmi.df, Min <= bmi & Max > bmi, select = c(Classification))
  as.character(bmi.df.filtered$Classification)
}

shinyServer
(
  function(input, output)
  {
    output$obmivalue <- renderText({bmi.value(input$weight, input$height)})
    output$obmiclass <- renderText({bmi.class(bmi.value(input$weight, input$height))})
  }
)
