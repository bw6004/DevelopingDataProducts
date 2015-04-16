library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("mtcars Exploratory Data Analysis"),
  
  # Sidebar with a radio button input for number of cylinders and deop down for transmission type
  sidebarLayout(
    sidebarPanel(
      radioButtons("cylinders",
                  "Choose number of cylinders:",
                  choices = c(4,6,8),
                  selected = 4),
      
      selectInput("dataset", "Choose transmission type:", 
                  choices = c("Automatic Transmission", "Manual Transmission"))
      ),
    
    # Show a plot of the generated distribution
    mainPanel(      
      tabsetPanel(type = "tabs",                   
                  tabPanel
                  (
                    "Miles per Gallon", 
                    br(),
                    helpText("Summary"),
                    verbatimTextOutput("summary"),
                    br(),
                    helpText("Standard Deviation"),
                    verbatimTextOutput("sd"),
                    br(),
                    helpText("Data View"),
                    tableOutput("view")
                  ), 
                  tabPanel("Plot", plotOutput("plot"))
                  
      )
    )
    ))
  )