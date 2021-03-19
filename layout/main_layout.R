library(shiny)

# Define UI for app that draws a histogram ----
getSliderLayout <- function() {
  return (fluidPage(
    # App title ----
    titlePanel("Slider Input"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(# Sidebar panel for inputs ----
                  sidebarPanel(
                    # Input: Slider for the number of bins ----
                    sliderInput(
                      inputId = "bins",
                      label = "Number of bins:",
                      min = 1,
                      max = 50,
                      value = 30
                    )
                    
                  ),
                  
                  # Main panel for displaying outputs ----
                  mainPanel(# Output: Histogram ----
                            plotOutput(outputId = "distPlot")))
  ))
}





homePage <- function() {
  return (div(titlePanel("Dashboard"),
              p("This is a dashboard page")))
  
}


myPlotLayout <- function() {
  return(
    
    fluidPage(
      titlePanel("Building UI with handler"),
      sidebarLayout(
        sidebarPanel(textInput("find_keywords",h3("Find a name"), placeholder ="Say something.." ),
                     actionButton("find_something", "Find"),
                     h4("Others"),
                     actionButton("download_to_csv", "Download Data mpg"),
                     br(),
                     actionButton("read_csv", "Preview CSV"),
                     br(),
                     actionButton("show_plot", "Show Plot"),
                     br(),
                     actionButton("clear_plot", "Clear Plot"),
                     
                     ),
        mainPanel(# Output: Histogram ----
                  textOutput("show_keywords"),
                  plotOutput(outputId = "my_plot"))
        
      )
      
    )
    
    
  )
  
}
