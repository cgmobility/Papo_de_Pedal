rm(list = ls())

if('LDA' %in% installed.packages() == FALSE){
  remotes::install_github('cgmobility/LDA')
}

library(LDA)
library(htmltools)
library(htmlwidgets)

wd()

head_tags <- tags$head(
  tags$meta(charset = "utf-8"),
  tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),
  tags$title("Papo de Pedal"),
  tags$link(href = 'https://fonts.googleapis.com/css?family=Montserrat',rel = 'stylesheet'),
  tags$style(HTML("
    body { font-family: Montserrat, Roboto, Arial, sans-serif; margin: 0; }
  "))
)

body_tags <- tags$body(
  tags$div(
    style = 'width: 100%; background-color: #58B3A6; height: 20px;'
  ),
  tags$div(
    style = 'width: 100%; height:60px; background-color: white; display: flex;',
    tags$div(
      style = 'margin-left:auto;margin-right:auto;margin-top:auto; margin-bottom:auto;',
      tags$a(
        style  = 'color: #58B3A6;font-size: large; font-weight:bold;
        margin-left:10px;margin-right:10px;',
        'Início',
        href = 'https://www.home'
      ),
      tags$a(
        style  = 'color: black;font-size: large;margin-left:10px;margin-right:10px;
        text-decoration:none;',
        'Sobre o projeto',
        href = 'https://www.sobre'
      ),
      tags$a(
        style  = 'color: black;font-size: large;margin-left:10px;margin-right:10px;
        text-decoration:none;',
        'Fale conosco',
        href = 'https://www.fale'
      ),
      tags$a(
        style  = 'color: black;font-size: large;margin-left:10px;margin-right:10px;
        text-decoration:none;',
        'Solicite o Papo de Pedal',
        href = 'https://www.solicite'
      )
    )
  ),
  tags$div(
    
  )
)

page <- tags$html(lang = "pt-BR", head_tags, body_tags)

save_html(page, file = '../home/index.html')

shell.exec(normalizePath(paste0(getwd(),'/../home/index.html')))
