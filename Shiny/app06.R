ui <- fluidPage(
  #失敗,たぶんリポジトリのディレクトリ構造が干渉してる
  # theme = "shiny_css/test_shiny_css.css",
  #失敗,たぶん上と同じ理由
    # tags$head(
    #   tags$link(rel = "stylesheet", type = "text/css", href = "shiny_css/test_shiny_css.css")
    # ),
  #これはうまくいく。パスはRmd起点にしてある。
  #includeCSS("www/shiny_css/test_shiny_css.css"),
  
  headerPanel("numericInput&sliderInput"),
  fluidRow(
    column(6,
           numericInput("test_num", "数字を入力してね", value = NA, min = 0, max = 20)),
    column(6,
            sliderInput("test_slide", "スライドしよう", min = 0, max = 100, value = 20))
  ),
  dataTableOutput("test_table")
)

server <- function(input, output) {
  check_var <- reactive(data.frame(num = input$test_num, slide = input$test_slide))
	DT <- reactiveValues(table_1 = NA)
  observe({DT$table_1 <- as.data.frame(check_var())})
  output$test_table <- renderDataTable(DT$table_1)
}

shinyApp(ui = ui, server = server)