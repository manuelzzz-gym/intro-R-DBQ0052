
# Funções II ----------------------------

# Questão 1 ---------------------------------------------------------------

# Leia o arquivo network.txt. Ele será usado nas questões 1 a 3. 
# Este conjunto de dados representa uma rede de interação entre proteínas, cujos nomes
# aparecem nas colunas 'node1*' e 'node2*'. As demais colunas representam scores usados para
# inferir a força da interação. A coluna combined_score representa o score combinado destas 
# diferentes fontes e representa a confiança total para cada interação. 

# Como este arquivo representa uma rede, cada linha do dataframe lido será uma interação entre 
# duas proteínas. Ou seja, os nós da rede estão representados nas colunas node1* e node2* e as 
# arestas são as interações entre node1* e node2*.
network <- read.table("./aula_07/exercicio_7/network.txt", sep = " ", stringsAsFactors = F, header = T)

# Crie a função 'filtrar_rede' para selecionar as interações da rede com score combinado maior que 0.700. 

# Input: dataframe da rede 'network'.
# Output: dataframe filtrado com as interações maiores que 0.700 e contendo apenas 3 colunas (node1, node2 e combined_score)
# > nrow(filtrar_rede(network = network))
# [1] 948

filtrar_rede <- function(network){
  network <- network[network$combined_score > 0.700, c("node1", "node2", "combined_score")]
  return(network)
}

filtrar_rede(network = network)
nrow(filtrar_rede(network = network))

# Questão 2 ---------------------------------------------------------------

# Crie a função 'vizinhos' que calcule a conectividade (quantidade de interações) de um determinado nó da rede e 
# quais são os nós que se conectam com ele. 

# Input: dois argumentos: nome da proteína e o dataframe onde será feita a operação
# Output: Imprimir no console a conectividade do nó escolhido e quais são seus vizinhos.
# > vizinhos(symbol = "NGF", network = network)
# O gene  NGF tem  16 vizinhos
# PIK3R1 CASP6 IKBKB NTRK1 NFKBIA PIK3CB NFKB1 PIK3R2 BAD PIK3CA CASP3 MYD88 CHUK RELA IRAK1 IKBKG

vizinhos <- function(symbol, network){
  n_vizinhos <- nrow(network[network$node1 == symbol | network$node2 == symbol,])
  vizinhos <- unique(c(network$node1[network$node2 == symbol], network$node2[network$node1 == symbol]))
  cat("O gene ", symbol, " tem ", n_vizinhos, " vizinhos\n")
  cat(paste(vizinhos, collapse = " "))
}

vizinhos(symbol = "NGF", network = network)
vizinhos(symbol = "PIK3R1", network = network)
vizinhos(symbol = "NFKBIA", network = network)

# Questão 3 ---------------------------------------------------------------

# Importe o arquivo 'COGs.RData', disponível no sigaa, que foi usado na 
# aula de Importação e Exportação de dados. 
# Use o dataframe 'cog.human.data'
load("./aula_07/exercicio_7/COGs.RData")

# Faça uma função que retorne o número de grupos de ortólogos (identificadores da coluna cog_id)
# de uma determinada espécie (coluna spp_id)

# Input: dois argumentos - identificador da espécie e o dataframe
# Output: número de COGs do organismo
# > contar_cogs(spp = 3702, df = cog.human.data)
# [1] 4367

contar_cogs <- function(spp, df){
  nrow(df[df$ssp_id == spp,])
}

contar_cogs(spp = 3702, df = cog.human.data)
contar_cogs(spp = 51453, df = cog.human.data)
contar_cogs(spp = 9606, df = cog.human.data)

# Questão 4 ---------------------------------------------------------------

# Considere o dataset 'attitude'. Escreva uma função que receba como argumento o nome de uma
# das colunas e retorne um dataframe contendo o valor da média, mediana, soma das observações,
# e quantidade de valores faltantes (NA) na coluna:

# Input: estatisticas(attitude, "rating")
# Output: dataframe com os resultados

# > estatisticas(attitude, "rating")
# media mediana soma n_na
# 1 64.63333    65.5 1939    0

estatisticas <- function(df, col){
  media <- mean(df[[col]], na.rm = T)
  mediana <- median(df[[col]], na.rm = T)
  soma <- sum(df[[col]], na.rm = T)
  n_na <- sum(is.na(df[[col]]))
  data.frame(media = media, mediana = mediana, soma = soma, n_na = n_na)
}

estatisticas(attitude, "rating")
estatisticas(airquality, "Ozone")
