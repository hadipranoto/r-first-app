library(shiny)
library(tidyverse)


# Define server logic required to draw a histogram ----
mainHandler <- function(){
  return (
    function(input, output){
      # Histogram of the Old Faithful Geyser Data ----
      # with requested number of bins
      # This expression that generates a histogram is wrapped in a call
      # to renderPlot to indicate that:
      #
      # 1. It is "reactive" and therefore should be automatically
      #    re-executed when inputs (input$bins) change
      # 2. Its output type is a plot
      output$distPlot <- renderPlot({
        
        x    <- faithful$waiting
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        hist(x, breaks = bins, col = "#75AADB", border = "orange",
             xlab = "Waiting time to next eruption (in mins)",
             main = "Histogram of waiting times")
        
      })
    }
    
    
  )
}


myPlotHandler <- function(){
  return (
    function(input, output){
      observeEvent(input$find_something, {
        output$show_keywords <- renderText({ 
          paste("You have searched for this ","\"", input$find_keywords,"\"")
        })
      })
      
      observeEvent(input$download_to_csv,{
        #write dataframe into files 
        write.csv(mpg, "../data/raw/mpg.csv", row.names = TRUE)
      })
      
      observeEvent(input$read_csv,{
        
      })
      
      
      
      observeEvent(input$show_plot,{
        output$my_plot <- renderPlot({ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
            geom_point(mapping = aes(color = class)) + 
            geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)}
        )
      })
      observeEvent(input$clear_plot,{
        output$my_plot <- renderPlot(plot.new())
      })
      
      
      
      
    })
  
}

  
  
 
  
  
