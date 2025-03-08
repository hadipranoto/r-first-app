library(shiny)
library(shiny.router)


source("main_handler.R")
source("../layout/main_layout.R")



router <- make_router(
  route("/", homePage()),
  route("layouting", myPlotLayout(),myPlotHandler()),
  route("slide",getSliderLayout(), mainHandler())
)


#shinny app wont go from this ui since it run from it
ui <- fluidPage(
  titlePanel("R Data Science"),
  
  #link bar 
  tags$ul(
    tags$li(a(href = route_link("/"), "Dashboard")),
    tags$li(a(href = route_link("/layouting"), "Building UI")),
    tags$li(a(href = route_link("/slide"), "Slider"))
  ),
  #container for each ui provided in router
  router$ui
)


server <- function(input, output, session) {
  router$server(input, output, session)
}


shinyApp(ui = ui, server = server)

# Send to the terminal with Ctrl + Alt + Enter:
#R -e 'library(shiny); runApp("appdir", port = 9999, launch.browser = FALSE)'
# Then show in the viewer with Ctrl + Enter
#rstudioapi::viewer("http://127.0.0.1:9999")
