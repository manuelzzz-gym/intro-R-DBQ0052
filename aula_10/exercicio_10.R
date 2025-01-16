# Exercício 9 - apply, lapply, sapply ----------------------------------------------------------

# Abaixo, algumas funções da família dos apply():

# -- apply(): Aplica uma função às "margens" de um array ou matriz e retorna um vetor, uma matriz ou uma lista de valores.
#         apply(X, MARGIN, FUN, ...)

# -- lapply(): Aplica uma função a uma lista e sempre retorna uma nova lista de mesmo tamanho da lista de entrada.
# SINTAXE:
#         lapply(X, FUN, ...)

# -- sapply(): Aplica uma função a uma lista e tenta retornar um objeto o mais simplificado possível.
# SINTAXE:
#         sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)



# Questão 1 ---------------------------------------------------------------

# Todas as questões do bloco 1 podem ser resolvidas com a função apply().
set.seed(1)
mt <- matrix(rnorm(50), 5, 10)

# Calcule a média das colunas da matriz mt.
apply(mt, 2, mean)

# Retorne os menores e maiores valores de cada coluna da matriz mt.
apply(mt, 2, range)

# Calcule o somatório de cada linha da matriz mt.
apply(mt, 1, sum)

# Calcule o produtório de cada linha da matriz mt.
apply(mt, 1, prod)

# Questão 2 ---------------------------------------------------------------

# Refaça a questão 1 do exercício anterior (exercício 8), usando as funções de loop aprendidas na aula. 

# Crie uma função chamada 'describe()' para descrever alguns parâmetros das colunas 
# numéricas de um dataframe. A função irá retornar um outro dataframe contendo
# a média, os valores mínimo e máximo, o número de ocorrências únicas de cada valor, 
# e o número de NAs de cada coluna.

# Exemplo:
# Input:
# > describe(airquality)

# Obs.: Com o output desta maneira:

# Ozone  Solar.R      Wind     Temp    Month      Day
# media     42.12931 185.9315  9.957516 77.88235 6.993464 15.80392
# minimo     1.00000   7.0000  1.700000 56.00000 5.000000  1.00000
# maximo   168.00000 334.0000 20.700000 97.00000 9.000000 31.00000
# n_unique  68.00000 118.0000 31.000000 40.00000 5.000000 31.00000
# n_nas     37.00000   7.0000  0.000000  0.00000 0.000000  0.00000

describe <- function(df) {
  t(
    data.frame(
      media = sapply(df, mean),
      minimo = sapply(df, min),
      maximo = sapply(df, max),
      n_unique = sapply(df, function(x) length(unique(x))),
      n_nas = sapply(df, function(x) sum(is.na(x))),
      colnames = rownames(df)
    )
  )
}

describe(airquality)
