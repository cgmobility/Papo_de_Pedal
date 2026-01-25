rm(list = ls())

if('LDA' %in% installed.packages() == FALSE){
  remotes::install_github('cgmobility/LDA')
}

library(LDA)
library(htmltools)
library(htmlwidgets)

wd()

descriptions <- list.files(
  path = Sys.getenv('papo_pedal_project_path'),
  pattern = 'description.txt',
  full.names = T,recursive = T
) %>% lapply(fread) %>% bind_rows()

lbl_edition <- function(date){
  dt <- as.POSIXct(as.character(date),format = '%Y%m%d')
  paste0(
    'Edição ',
    sprintf('%02d',lubridate::day(dt)),'/',
    sprintf('%02d',lubridate::month(dt)),'/',
    lubridate::year(dt)
  ) %>% return()
}

list_options <- function(editions_date){
  tibble(
    id = c('resumo',editions_date),
    lbl = c('Resumo',lbl_edition(editions_date))
  ) %>% apply(1, function(x){
    tags$option(
      value = x['id'],
      x['lbl']
    )
  })
}



head_tags <- tags$head(
  tags$meta(charset = "utf-8"),
  tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),
  tags$title("Papo de Pedal"),
  tags$link(href = 'https://fonts.googleapis.com/css?family=Montserrat',rel = 'stylesheet'),
  tags$style(HTML("
    body { font-family: Montserrat, Roboto, Arial, sans-serif; margin: 0; }
  ")),
  tags$link(rel = "stylesheet", href = "../css/style.css"),
  tags$link(rel = "shortcut icon",href = "../css/ico_bora_de_bike.png",
            type = "image/png")
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
    style = 'position:relative;display:inline-block;',
    tags$img(
      src = 'image15.jpg',style = 'width:100%;display:block;'
    ),
    tags$div(
      style = 'position: absolute;inset:0;background: #00000060;',
      tags$h1(
        'Papo de Pedal',
        style = 'margin-left:5%;color:white;font-size:4vw;width:30%;'
      ),
      tags$h3(
        'Portal de dados e resultados',
        style = 'margin-left:5%;color:white;width:30%;font-size:3vw'
      )
    ),
    tags$div(
      style = 'position: absolute;top:10%;right:4%;display:flex;align-items:center;
      gap:12px;',
      tags$img(
        src = 'image12.png',style = 'height:40px;display:block;'
      ),
      tags$img(
        src = 'image7.png',style = 'height:40px;display:block;'
      ),
      tags$img(
        src = 'image6.png',style = 'height:40px;display:block;'
      )
    )
  ),
  tags$div(
    class = 'result-container',
    style = 'display:flex;',
    tags$div(
      class = 'graphs_container',
      style = 'position:relative;width:100%;z-index:50;min-height:100vh;',
      tags$iframe(
        src = '../edicoes/resumo/resumo.html',
        id = 'results_frame',
        style = 'width:100%;min-height:200vh;height:auto;'
      )
    ),
    tags$div(
      class = 'select-container',
      style = 'width:30%;margin-left:6px;position:absolute;z-index:100;',
      tags$label("Edição:", `for` = "filtro",
                 style = 'width:100%;display:block;margin-bottom:5px;'),
      tags$select(
        id = "filtro",
        class = "multi-select",
        list_options(descriptions$data)
      ),
      tags$button('Filtrar',id = 'filtro_btn',
                  class = 'btn-padrao',onclick = 'runfilter()',
                  style = 'width:40%;'),
      tags$link(rel = "stylesheet", href = "../css/filtro.css"),
      tags$script(src = '../js/filtro.js')
    )
  )
)

page <- tags$html(lang = "pt-BR", head_tags, body_tags)


save_html(page, file = '../home/index.html')


