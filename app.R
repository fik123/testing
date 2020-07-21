library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Hello"),
  sidebarPanel(
    helpText(),
    
    fileInput("file1", "Choose CSV File",
              accept = c(
                "text/csv",
                "text/comma-separated-values,text/plain",
                ".csv")
    )
  ),
  mainPanel(
    
    tableOutput("contents")
    
  )
  
)
server <-
  function(input,output){
    
    
    output$contents <- renderTable({
      
      inFile <- input$file1
      
      if (is.null(inFile))
        return(NULL)
      
      read.csv(inFile$datapath, header = FALSE)
    })
  }




# Run the application 
shinyApp(ui = ui, server = server)