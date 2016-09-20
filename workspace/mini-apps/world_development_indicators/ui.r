xap.require("ggvis",
            "shinydashboard",
            "dplyr",
            "shiny")

#Define list for drop down menu
indicators_table <- data.frame(read.csv("indicator_names.csv", stringsAsFactors = FALSE))
indicators_table <- indicators_table[!duplicated(indicators_table),]
indicators <- indicators_table$Indicator.Code
names(indicators) <- indicators_table$Indicator.Name
indicators <- indicators[sort(names(indicators))] 

sidebar <- dashboardSidebar(
  
  sidebarMenu(
    br(),
    selectInput('xcol',
      h4('X Variable'),
      choices = indicators,
      selected = indicators[45],
      selectize = FALSE
    ),
    selectInput('ycol',
      h4('Y Variable'),
      choices = indicators,
      selected=indicators[28],
      selectize = FALSE
    )
  ),
  p("\"Improving health is central to the Millennium Development Goals,
    and the public sector is the main provider of health care in developing countries.
    To reduce inequities, many countries have emphasized primary health care, including
    immunization, sanitation, access to safe drinking water, and safe motherhood initiatives.
    Data here cover health systems, disease prevention, reproductive health, nutrition,
    and population dynamics. Data are from the United Nations Population Division,
    World Health Organization, United Nations Children's Fund, the Joint United Nations
    Programme on HIV/AIDS, and various other sources.\"", 
    
    class="form-group shiny-input-container"
  ),
  HTML("<p class = 'form-group shiny-input-container'><b> Dataset: </b>
       Health World Development Indicators</p>"),
  HTML("<p class = 'form-group shiny-input-container'><b> Source: </b>
       <a href = 'http://data.worldbank.org/' target='_blank'>World Bank</a></p>"),
  width = 300
)

body <- dashboardBody(
  tags$head(
    includeScript("google_gauge.js"),
    includeScript("google_motionchart.js")
  ),
  
  htmlOutput("view"),
  tags$head(tags$style(HTML('
    .skin-yellow .main-header .logo {
      background-color: #f39c12;
    }
    .skin-yellow .main-header .logo:hover {
      background-color: #f39c12;
    }
  '))),
  
  HTML('<div id="chart_div"></div>') ,
  tags$script(
    '
    Shiny.addCustomMessageHandler("myCallbackHandler", function(msg) {
      drawChart(msg["Idvar"], msg["Timevar"], msg["Xvar"], msg["Yvar"],
                msg["Colorvar"], msg["Sizevar"]); 
    });
    '
  )
)

dashboardPage(
  dashboardHeader(title = paste0("World Development Indicators (Health)"),
                  titleWidth = 450),
  sidebar,
  body,
  skin = "yellow"
)