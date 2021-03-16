library(shiny)
library(shiny.router)


source("main.R")
source("../layout/dashboard.R")
source("../layout/main_layout.R")

router <- make_router(
  route("/", home_page()),
  route("settings", settings_page()),
  route("contact",get_main_layout(), mainHandler())
)


#shinny app wont go from this ui since it run from it
ui <- fluidPage(
  titlePanel("Welcome back~!"),
  
  #link bar 
  tags$ul(
    tags$li(a(href = route_link("/"), "Dashboard")),
    tags$li(a(href = route_link("settings"), "Settings")),
    tags$li(a(href = route_link("contact"), "Contact"))
  ),
  #container for each ui provided in router
  router$ui
)


server <- function(input, output, session) {
  router$server(input, output, session)
}


shinyApp(ui = ui, server = server)