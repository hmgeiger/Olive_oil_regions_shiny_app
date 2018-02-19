library(shiny)

shinyServer(function(input, output) {
	library(ggplot2)
	predicted_region <- reactive({as.vector(predict(modFit,newdata=data.frame(Eicosenoic = input$Eicosenoic,Linoleic = input$Linoleic)))})
	output$predicted_region <- renderText({print(paste0("Predicted region of your olive oil: ",predicted_region()))})
	their_olive_oil_dat <- reactive({reactive_data_frame <- data.frame(Eicosenoic = input$Eicosenoic,Linoleic = input$Linoleic,Region = "Your olive oil");reactive_data_frame})
	their_olive_oil_vs_others <- reactive({final_ggplot <- plot_without_their_olive_oil + geom_point(data=their_olive_oil_dat(),aes(Eicosenoic,Linoleic,colour=Region),size=3);final_ggplot})
	output$their_olive_oil_vs_others <- renderPlot({print(their_olive_oil_vs_others())})
})
