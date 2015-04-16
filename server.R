library(shiny)
data(mtcars)
mtcars$carnames<-row.names(mtcars)

shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "Automatic Transmission" = mtcars[mtcars[,"am"]==1 & mtcars[,"cyl"]==input$cylinders,],
           "Manual Transmission" = mtcars[mtcars[,"am"]==0 & mtcars[,"cyl"]==input$cylinders,]
    )
  })  
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()    
    summary(dataset$mpg)
  })
  
  # Generate the Standard deviation of the dataset
  output$sd <- renderPrint({
    dataset <- datasetInput()    
    sd(dataset$mpg)
  })
  
  output$view<- renderTable({
    datasetInput()    
  })
  
  output$plot <- renderPlot({
    # draw histogram with the specified number of bins
    dataset <- datasetInput() 
    barplot( 
      height=dataset$mpg,
      names.arg=dataset$carnames, 
      xlab="Model Name", 
      ylab="Miles Per Gallon", 
      axis.lty=1,
      col = c(3,5),
      main="MPG by Model",
      border = "dark blue"
    )
  })
  
  
})