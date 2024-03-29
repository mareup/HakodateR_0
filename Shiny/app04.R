ui <- fluidPage(
  titlePanel("numericInput&sliderInput"),
  fluidRow(
    column(6,
           numericInput("test_num", "数字を入力してね", value = NA, min = 0, max = 20)),
    column(6,
            sliderInput("test_slide", "スライドしよう", min = 0, max = 100, value = 20))
  ),
  textOutput("test_text")
)

server <- function(input, output) {
  #observe(list(input$test_num, input$test_slide))
  observe_test <- reactiveValues()
  observe({observe_test$num <- input$test_num; observe_test$slide <- input$test_slide})
  output$test_text <- renderText({
    paste0("入力した数字は,",
           #input$test_num,
           observe_test$num,
           "スライダーの数字は,",
           #input$test_slide
           observe_test$slide)
  })
}

shinyApp(ui = ui, server = server)
