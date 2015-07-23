# ui.R
library(shiny)

shinyUI(navbarPage("Tooth Length Predictor",
                   tabPanel("Predictor Tool",
                            sidebarLayout(
                              sidebarPanel(
                                h3("Attributes:"),
                                sliderInput("dose", "Dose in milligrams", 0.5,  min=0, max=3, step=0.01),
                                radioButtons("supp", "Supplement type (VC or OJ)", c("VC" = "VC", "OJ" = "OJ")),
                                submitButton("Submit")
                              ),
                              
                              mainPanel(
                                p("A ShinyApp to predict the tooth length."),

                                h4("User Guide:"),
                                tags$ul(
                                  tags$li("Input the dose and supplement type."),
                                  tags$li("Click the Submit button.")
                                ),
                                
                                p("Please note that it takes a few seconds for the server.R to complete its process using the 'caret' pacakage and determine the best model."),
                                
                                h4("Predicted Length"),
                                verbatimTextOutput("len")
                              )
                            )),
                   tabPanel("Project Information",
                            mainPanel(
                              h4("Coursera - Developing Data Products: Course Project"),
                              p("As part of the Coursera project 'Developing Data Products', it is required to produce a ShinyApp.  This app reused a previous course project completed within the Data Science specialisation, 'Statiscal Inference', related to effect of Vitamin C on Tooth growth based on supplement type (via orange juice or ascorbic acid) and dose given to guinea pigs. The methodology and tools from 'Practical Machine Learning' were then used to enhance the model and predictions mechanism.")
                            ))
))

