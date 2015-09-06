library(shiny)

shinyUI(fluidPage(

  titlePanel("Health Index Simulator"),
  br(),
  br(),

  # 1st part, upload data
  h4("STEP 1: Upload Your Data"),
  fluidRow(
    column(4, fileInput("file", label = h5("File Input:"))),
    column(4, radioButtons("header", 
                        choices = list("header" = 1, "no header" = 0), 
                        selected = 1, label = h5("CSV Header:"))),
    column(4, radioButtons("separator",
                           choices = list("comma" = 1, "semicolon" = 2, "tab" = 3),
                           selected = 1, label = h5("Separator Type:")))
  ),
  br(),
  
  # 2nd part, build health index
  h4("STEP 2: Build Health Index"),
  br(),
  fluidRow(
    column(4, radioButtons("kernel",
                           choices = list("linear" = 1, "Gaussian" = 2, "polynomial" = 3),
                           selected = 1, label = h5("Kernel Type:"))),
    column(8, tabsetPanel(position = "above",
                          tabPanel("HI", plotOutput("hi")),
                          tabPanel("Feature", plotOutput("feature"))))
  ),
  
  # 3rd part, accuracy
  h4("STEP 3: Analyze Classification Accuracy"),
  fluidRow(
    column(4, radioButtons("rule",
                           choices = list("single outlier" = 1, "double outliers" = 2, "variation outlier" = 3),
                           selected = 1, label = h5("Rule Type:"))),
    column(8, tabsetPanel(position = "above",
                          tabPanel("ROC", plotOutput("roc")),
                          tabPanel("Data", tableOutput("data"))))
  )
))