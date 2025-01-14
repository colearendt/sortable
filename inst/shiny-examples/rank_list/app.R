## ---- rank-list-app -------------------------------------------------
## Example shiny app with rank list

library(shiny)
library(sortable)

ui <- fluidPage(
  fluidRow(
    column(
      width = 12,
      tags$h2("This is a rank list"),
      rank_list(
        text = "Drag the items in the correct order",
        labels = sample(c("one", "two", "three", "four", "five")),
        input_id = "rank_list_1"
      ),
      tags$p("You provided the answer"),
      verbatimTextOutput("results")
    )
  )
)

server <- function(input, output) {
  output$results <- renderPrint({
    input$rank_list_1 # This matches the input_id of the rank list
  })
}

shinyApp(ui, server)
