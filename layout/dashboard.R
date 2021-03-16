library(shiny)

home_page <- function() {
  return (div(titlePanel("Dashboard"),
              p("This is a dashboard page")))
  
}


settings_page <- function() {
  return(div(titlePanel("Settings"),
             p("This is a settings page")))
  
}
contact_page <- function() {
  return (div(titlePanel("Contact"),
              p("This is a contact page")))
  
}