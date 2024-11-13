
# Exercício - Regras de Escopo ----------------------------

# Questão 1 ---------------------------------------------------------------

# Um ambiente no R pode ser entendido como uma coleção de objetos (funções evariáveis, por exemplo) 
# que existe assim que iniciamos nossa sessão no R. 

# O ambiente de mais alto nível disponível é o ambiente global, chamado R_GlobalEnv, ele também pode ser referenciado
# como .GlobalEnv nos códigos em R que escrevemos.

# Vimos na aula que podemos usar a 'função ls()' para mostrar os objetos do ambiente atual.

ls()

# Igual ao comando de terminal `ls` que lista os diretórios que existem em seguida ao específicado

# Além disso, podemos usar a função 'environment()', que irá nos retornar o ambiente atual.
# Se rodarmos a função environment() no ambiente global, a função retornará que o ambiente atual
# é o próprio ambiente global. 

environment()

# Crie uma função chamada de 'f1' que possua uma outra função 'f2', esta definida dentro do escopo de 'f1'.

# 1. A função interna ('f2') deve fazer duas coisas:
# - Imprimir no console o ambiente atual com a função 'environment()'
# - Imprimir os objetos pertencentes ao seu escopo com a função 'ls()'.

# 2. A função externa ('f1') deve fazer 3 coisas:
# - Deve chamar a função 'f2'
# - Imprimir no console o ambiente atual com a função 'environment()'
# - Imprimir os objetos pertencentes ao seu escopo com a função 'ls()'.

f1<- function(){
  f2<- function(){
    print(environment())
    print(ls())
  }
  f2()
  print(environment())
  print(ls())
}

# Uma vez definidas estas funções, chame a função externa e responda: os ambientes exibidos são os mesmos? Justifique.
f1()
# Não, os ambientes exibidos não são os mesmos. O ambiente exibido pela função 'f2' é o ambiente de "dentro" de 'f1',
# Percebemos isso pois a função 'f2' não exibe a função 'f1' em seu escopo, enquanto a função 'f1' exibe a função 'f2' em seu escopo.
# Também notamos que 'f2' não está no mesmo escopo pois não pode ser chamada do ambiente global
f2()

# Questão 2 ---------------------------------------------------------------

# Com base nas regras de escopo do R, justifique o resultado das chamadas das funções abaixo:

# Ex.:1

x <- 12
f1 <- function(y) {
  x <- 10
  f2 <- function() {
    print(x + y)
  }
  f2()
}

f1(4)

# O resultado da chamada da função 'f1' é 14. Isso ocorre pois a função 'f2' é chamada dentro da função 'f1',

# Ex.:2
z <- 10

f3 <- function(x, y) {
  x * y * z
}

f3(1, 2)

# O resultado da chamada da função 'f3' é 20. Isso ocorre pois a função 'f3' não possui uma variável 'z' definida em seu escopo
# e portanto, o R vai atrás da variável definida em um escopo mais alto (no caso, encontra o z = 10 anteriormente definido)