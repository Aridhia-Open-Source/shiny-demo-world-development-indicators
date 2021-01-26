documentation_tab <- function() {
  tabPanel("Help",
           dashboardPage(
                     dashboardHeader(title = paste0("World Development Indicators RShiny mini-app"),
                                     titleWidth = 450),
                     
                     dashboardSidebar(
                       p("This is the Help Tab, it will provide enough information to use the app",
                         class = "form-group shiny-input-container"),
                       width = 300
                     ),
                     
                     dashboardBody(
                       tags$head(tags$style(HTML("
                       .skin-yellow .main-header .logo {
                       background-color: #f39c12;
                       }
                       .skin-yellow .main-header .logo:hover {
                       background-color: #f39c12;
                       }"))),
                       
                       p("This RShiny mini-app allows you to visualize the changes from the 1960 to 2012 in life expectency of countries with different incomes."),
                       p("The graph will be displayed on the main panel on the 'App' tab, be aware that it can take a moment to load. Once you see the graph you can:"),
                       tags$ol(
                         tags$li("Hover over the data points, this will display more information, such as country, population, year, life expectancy, region and income group."),
                         tags$li("Move the slide input under the graph to display a different year"),
                         tags$li("Click on 'Play' to start the authomatic motion of the slider input, this will animate the graph and you will see the changes of life-expectancy year by year."),
                         tags$li("Click on a region of the legend to omit it from the graph, if you double-click you will only see that region displayed")
                       ),
                       h3("Walkthrough video"),
                       tags$video(src="world_development.mp4", type = "video/mp4", width="100%", height = "350", frameborder = "0", controls = NA),
                       p(class = "nb", "NB: This mini-app is for provided for demonstration purposes, is unsupported and is utilised at user's 
                       risk. If you plan to use this mini-app to inform your study, please review the code and ensure you are 
                       comfortable with the calculations made before proceeding. ")
                     ),
                     skin = "yellow"
                     ))
}