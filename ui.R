library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Predict region for Italian olive oil based on its chemical composition"),
        sidebarPanel(
        sliderInput("Eicosenoic",
                "Eicosenoic fatty acid percent (%):",
                min = .01,max = .60,step = .01,value = .05),
        sliderInput("Linoleic",
                "Linoleic fatty acid percent (%):",
                min = 4.2,max = 15.0,step = .10,value = 10.00),
	submitButton(text = "Submit")
        ),
        mainPanel(
                verbatimTextOutput("predicted_region"),
		#tableOutput("their_olive_oil_dat")
		plotOutput("their_olive_oil_vs_others")
        )
))
