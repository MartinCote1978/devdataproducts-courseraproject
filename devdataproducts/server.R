## server.R
library(shiny)

# Loading libraries
library(lattice) # Required by 'caret'
library(ggplot2) # Required by 'caret'
library(caret)
library(randomForest)

# Loading data
attach(ToothGrowth)

# Setting the pseudo-random numbers
set.seed(1206)

# Training the model:
# Determining the best predictions model using a 'random forest' method with 5 folds.
ctrl = trainControl(method="cv", number=5, allowParallel=TRUE)
modelFit <- train(len ~ ., data=ToothGrowth, method="rf", trControl=ctrl) # Using 'random forest'

# Server function:
shinyServer(function(input, output) {
  output$len <- renderText({
    supp <- input$supp
    dose <- input$dose

    newdata <- data.frame(
      supp = supp, dose = dose
    )
    prediction <- predict(modelFit,newdata=newdata)
    prediction
  })
})