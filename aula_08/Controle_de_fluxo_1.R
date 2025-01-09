

# Tema: IF, IF-ELSE, IFELSE e ELSE IF na linguagem R #
#

# 1. Introdução ao conceito de condicionais
# Explicação teórica:
# - As estruturas condicionais permitem que um programa execute ações diferentes
#   dependendo se uma condição é verdadeira (TRUE) ou falsa (FALSE).
# - No R, temos algumas formas principais de trabalhar com condicionais:
#   1. `if`: Avalia uma única condição.
#   2. `if-else`: Avalia uma condição e fornece uma alternativa se a condição for falsa.
#   3. `ifelse`: Permite avaliação de forma vetorizada e o encadeamento de condições.
#   4. 'else if': Encadeia avaliações lógicas


#############################################
# 2. IF: Trabalhando com condições simples  #
#############################################

# Sintaxe básica:
# if (condição) {
#   # Código a ser executado se a condição for verdadeira
# }

# Exemplo prático:
numero <- 7

if (numero > 5) {
  print("O número é maior que 5.")
}

#
# O que acontece se `numero` for menor ou igual a 5?
# Experimente mudar o valor de 'numero' para 3 e execute novamente.

##############################################
# 3. IF-ELSE: Adicionando alternativas       #
##############################################

# Sintaxe básica:
# if (condição) {
#   # Código para condição verdadeira
# } else {
#   # Código para condição falsa
# }

# Exemplo prático:
numero <- 10

if (numero > 5) {
  print("O número é maior que 5.")
} else {
  print("O número é menor ou igual a 5.")
}

# Atividade:
# - Crie uma função que recebe um número e retorna uma mensagem informando se é par ou ímpar.
# - Dica: O operador %% é usado para obter o resto da divisão.

par_ou_impar <- function(number) {
  if (number %% 2 == 0) {
    return("O número é par.")
  }
  return("O número é ímpar.")
}

parOuImpar(2)
parOuImpar(3)

# Explicação adicional:
# - O `if-else` é útil para lidar com situações onde há duas opções claras:
#   verdadeiro ou falso.

##############################################
# 4. IFELSE: Avaliação vetorizada            #
##############################################

# Sintaxe básica:
# ifelse(condição, valor_se_verdadeiro, valor_se_falso)

# Exemplo prático:
numeros <- c(3, 6, 2, 8, 1)

resultado <- ifelse(numeros > 5, "Maior que 5", "Menor ou igual a 5")
print(resultado)

# Atividade:
# - Execute o vetor numeros (1 a 10).
# - Crie uma função utilizando o `ifelse` para classificá-los
#   como "Par" ou "Ímpar".

numeros <- 1:10

classificar_numeros <- function(numeros) {
  ifelse(numeros %% 2 == 0, "Par", "Ímpar")
}
classificar_numeros(numeros)

# Comparação entre `if` e `ifelse`:
# - `if` e `if-else` avaliam apenas uma única condição.
# - `ifelse` permite avaliar condições em um vetor de uma vez.

################################################################
# 5. ELSE IF e IFELSE: Trabalhando com múltiplas condições     #
################################################################

# Sintaxe básica:
# if (condição) {
#   # Código para condição verdadeira
# } else if (outra condição){
#   # se outra condição for verdadeira, faça isso
# } else {
#   #se nenhuma condição não for verdadeira, faça isso
#}

# Exemplo prático else if:
numeros <- 3

if (numero > 0) {
  print("O número é positivo.")
} else if (numero < 0) {
  print("O número é negativo.")
} else {
  print("O número é zero.")
}

# Também é possível encadear condições utilizando o ifelse em vetores:

notas <- c(95, 80, 72, 60, 45, 50, 85, 90, 67, 77)

avaliar_notas <- function(notas) {
  ifelse(notas >= 70,
         "Aprovado",
         ifelse(notas >= 50, "Recuperação", "Reprovado"))
}

avaliacao <- avaliar_notas(notas)
print(data.frame(Notas = notas, Situacao = avaliacao))

# Atividade:
# - Crie uma função que receba um número e classifique-o com os seguintes critérios
#   Baixo < 40, Médio >= 40 e < 70, Alto >= 70.


classificar_numero <- function(numero) {
  if (numero < 40) {
    return("Baixo")
  } else if (numero < 70) {
    return("Médio")
  } else {
    return("Alto")
  }
}

numeros <- 39:71
classificados <- sapply(numeros, classificar_numero)
print(data.frame(Numeros = numeros, Classificacao = classificados))
