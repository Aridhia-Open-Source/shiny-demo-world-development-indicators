

sidebar <- dashboardSidebar(
  p("\"Improving health is central to the Millennium Development Goals,
    and the public sector is the main provider of health care in developing countries.
    To reduce inequities, many countries have emphasized primary health care, including
    immunization, sanitation, access to safe drinking water, and safe motherhood initiatives.
    Data here cover health systems, disease prevention, reproductive health, nutrition,
    and population dynamics. Data are from the United Nations Population Division,
    World Health Organization, United Nations Children's Fund, the Joint United Nations
    Programme on HIV/AIDS, and various other sources.\"", 
    
    class = "form-group shiny-input-container"
  ),
  HTML("<p class = 'form-group shiny-input-container'><b> Dataset: </b>
       Health World Development Indicators</p>"),
  HTML("<p class = 'form-group shiny-input-container'><b> Source: </b>
       <a href = 'http://data.worldbank.org/' target='_blank'>World Bank</a></p>"),
  width = 300
)

body <- dashboardBody(
  tags$head(tags$style(HTML("
    .skin-yellow .main-header .logo {
      background-color: #f39c12;
    }
    .skin-yellow .main-header .logo:hover {
      background-color: #f39c12;
    }
  "))),
  
  htmlOutput("gvis_out")
)

dashboardPage(
  dashboardHeader(title = paste0("World Development Indicators (Health)"),
                  titleWidth = 450),
  sidebar,
  body,
  skin = "yellow"
)
