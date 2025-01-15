
# Exercício 9 -------------------------------------------------------------

# Questão 1 ---------------------------------------------------------------

# Crie uma função chamada 'describe()' para descrever alguns parâmetros das colunas 
# numéricas de um dataframe. A função irá retornar um outro dataframe contendo
# a média, os valores mínimo e máximo, o número de ocorrências únicas de cada valor, 
# e o número de NAs de cada coluna. 

# Exemplo:
# Input:
# > describe(airquality)

describe <- function(dataFrame) {
  result <- data.frame(media = numeric(0), min = numeric(0), max = numeric(0), n_unique = numeric(0), n_nas = numeric(0))

  for (col in names(dataFrame)) {
    if (is.numeric(dataFrame[[col]]) | is.integer(dataFrame[[col]])) {
      media <- mean(dataFrame[[col]], na.rm = TRUE)
      min <- min(dataFrame[[col]], na.rm = TRUE)
      max <- max(dataFrame[[col]], na.rm = TRUE)
      n_unique <- length(unique(dataFrame[[col]]))
      n_nas <- sum(is.na(dataFrame[[col]]))
      
      result <- rbind(result, data.frame(media = media, min = min, max = max, n_unique = n_unique, n_nas = n_nas))
    }
  }
  
  rownames(result) <- names(dataFrame)[sapply(dataFrame, is.numeric) | sapply(dataFrame, is.integer)]
  
  return(result)
}

describe(airquality)

# Output:
#             media   min  max    n_unique n_nas
# Ozone    42.129310  1.0 168.0       68    37
# Solar.R 185.931507  7.0 334.0      118     7
# Wind      9.957516  1.7  20.7       31     0
# Temp     77.882353 56.0  97.0       40     0
# Month     6.993464  5.0   9.0        5     0
# Day      15.803922  1.0  31.0       31     0



# Questão 2 ---------------------------------------------------------------

# Crie uma função que retorne uma lista de tamanho 2, contendo uma matriz em cada posição. 

# A primeira matriz da lista é uma matriz quadrada (o número de linhas é igual ao número de colunas) 
# com cada posição da matriz sendo um número inteiro sorteado de 1 a 1000 (use a função 'sample()'). 

# A segunda matriz terá as mesmas dimensões da primeira, mas irá atribuir 
# a cada posição o valor 0, se aquela posição na primeira matriz for par, ou 1, se aquela posição na primeria 
# matriz for ímpar.

# A função terá um único argumento, que determinará as dimensões da matriz.

# Input:
# > faz_matriz(n = 2)

faz_matriz <- function(n) {
  matriz1 <- matrix(sample(1:1000, n^2, replace = TRUE), nrow = n, ncol = n)
  matriz2 <- matrix(ifelse(matriz1 %% 2 == 0, 0, 1), nrow = n, ncol = n)
  
  return(list(matriz1 = matriz1, matriz2 = matriz2))   
}

faz_matriz(2)

# Output:
# $matriz1
#      [,1] [,2]
# [1,]  354  121
# [2,]  580  422
# 
# $matriz2
#       [,1] [,2]
# [1,]    0    1
# [2,]    0    0
