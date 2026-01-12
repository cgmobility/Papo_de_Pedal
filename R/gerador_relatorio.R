
library(LDA)
library(rmarkdown)

wd()

path <- 'I:/.shortcut-targets-by-id/15QBAXOC5TdfNgOtQZh2jvqN37NjxkSM0/@BICI/06_Eixo Dados/Projetos/Papo de pedal/Edicao 270325/result/pesquisa_papo_pedal.rds'
edicao <- "Edição 27/03/2025"

rmarkdown::render(
  input = 'relatorios_por_edicao.Rmd',
  params = list(file_path = path,title = edicao),
  output_dir = '../edicoes/20250327/',
  output_file = '20250327.html'
)
