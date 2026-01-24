rm(list = ls())
library(LDA)
library(rmarkdown)

wd()


path <- paste0(Sys.getenv('papo_pedal_project_path'),
               'Edicao 270325/result/pesquisa_papo_pedal.rds')
edicao <- "Edição 27/03/2025"

rmarkdown::render(
  input = 'relatorios_por_edicao.Rmd',
  params = list(file_path = path,title = edicao),
  output_dir = '../edicoes/20250327/',
  output_file = '20250327.html'
)

