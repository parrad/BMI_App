# This is the user-interface definition of a Shiny web application.
# With this application one can find the Body Mass Index and the classification.
#

library(shiny)

shinyUI
(
  pageWithSidebar
  (
    headerPanel("Body Mass Index - Calculator & Classifier"),
    sidebarPanel
    (
      h4('This application calculates your Body Mass Index and show the result of the classification.'),
      h4('Please provide the following details.'),
      sliderInput("weight", 'Weight in Kilograms', 0, min=0, max=200, step=0.25),
      sliderInput("height", 'Height in Metres', 0, min=0, max=3, step=0.01),
      submitButton("Submit")
    ),
    mainPanel
    (
      h4('Your Body Mass Index is '),
      verbatimTextOutput("obmivalue"),
      h4('And you are classifed as '),
      verbatimTextOutput("obmiclass")
    )
  )
)
