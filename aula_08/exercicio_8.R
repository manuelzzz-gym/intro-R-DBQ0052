
# Exercício 7 -------------------------------------------------------------


# Questão 1 ---------------------------------------------------------------

# Crie uma função que receba os valores de a, b e c de um polinômio de 2 grau e verifique
# se este polinômio possui: (i) duas raízes reais distintas (ii) duas raízes reais iguais ou
# (iii) não possui raízes reais. A função também deve imprimir as raízes do polinômio, se existirem.

# Exemplo:
# > calc_raizes(1, -2, -3)
# O polinômio possui duas raízes reais diferentes.
# Raízes: 3 -1

# > calc_raizes(1, 2, 3)
# O polinômio não possui raízes reais.

# > calc_raizes(1, 8, 16)
# O polinômio possui duas raízes reais iguais.
# Raiz: -4

calc_raizes <- function(a, b, c) {
  delta <- b^2 - 4*a*c
  if (delta > 0) {
    x1 <- (-b + sqrt(delta)) / (2*a)
    x2 <- (-b - sqrt(delta)) / (2*a)
    
    cat("O polinômio possui duas raízes reais diferentes.\n")
    cat("Raízes:", x1, x2)
  } else if (delta == 0) {
    x <- -b / (2*a)
    
    cat("O polinômio possui duas raízes reais iguais.\n")
    cat("Raiz:", x)
  } else {
    cat("O polinômio não possui raízes reais.")
  }
}

calc_raizes(1, -2, -3)
calc_raizes(1, 2, 3)
calc_raizes(1, 8, 16)

# # Questão 2 -------------------------------------------------------------

# Uma empresa decidiu aumentar o salário dos seus empregados, de acordo 
# com a tabela abaixo:

######################################
# Salário           Taxa de reajuste
######################################
# 0 - 400.00            15%
# 400.01 - 800.00       12%
# 800.01 - 1200.00      10%
# 1200.01 - 2000.00     7%
# Acima de 2000.00      4%
######################################

# Escreva uma função que receba como argumento o salário do empregado e imprima 
# o novo salário, o reajuste ganho (em reais) e o aumento percentual obtido com
# relação ao salário anterior.

# Exemplo:
# > calc_salario(salario = 400)
# O novo salário é 460 reais.
# O reajuste foi de 60 reais, correspondendo a 15 % de reajuste.

calc_salario <- function(salario) {
  if (salario <= 400) {
    reajuste <- salario * 0.15
  } else if (salario <= 800) {
    reajuste <- salario * 0.12
  } else if (salario <= 1200) {
    reajuste <- salario * 0.10
  } else if (salario <= 2000) {
    reajuste <- salario * 0.07
  } else {
    reajuste <- salario * 0.04
  }
  
  novo_salario <- salario + reajuste
  aumento_percentual <- (reajuste / salario) * 100
  
  cat("O novo salário é", novo_salario, "reais.\n")
  cat("O reajuste foi de", reajuste, "reais, correspondendo a", aumento_percentual, "% de reajuste.")
}

calc_salario(salario = 400)

# Questão 3 ---------------------------------------------------------------

# Explique o resultado da operação abaixo:
x <- 1:10
if (length(x)) "A" else "B"

# Questão 4 ---------------------------------------------------------------

# Considere novamente o vetor x:
x <- 1:10

# Agora, veja as seguintes expressões:
if(x > 5) {
  print("Maior que 5")
} else {
  print("Menor que 5")
}

ifelse(x > 5, "Maior que 5", "Menor que 5")

# Qual das duas expressões permite uma avaliação vetorizada da condição x > 5?
# E em relação à expressão que não permite, como ela avalia a condição?



# Questão 5 ---------------------------------------------------------------

# Crie uma função que calcule e imprima a soma dos objetos de um vetor passado por parâmetro.
# Sua funcao deve verificar se os objetos passados sao do tipo 'numeric'. Caso não sejam, deve
# retornar a mensagem personalizada "A classe dos objetos a, b, c, d,... deve ser numeric".
#
# Input:
# > person_soma(1, 2, 98, -6, "1", "a", T)
# Output:
# [1] "A classe dos objetos deve ser numeric"
#
# Input: 
# > person_soma(1,2,3,4)
# Output:
# [1] 27
# [1] "A soma é positiva"
# 
# Input: 
# > person_soma(-3,-5,-8,3)
# Output: 
# [1] -8
# [1] "A soma é negativa"
#
# Input: 
# > person_soma(-8,8,-16,16)
# Output:
# [1] 0
# [1] "A soma é neutra"

person_soma <- function(...) {
  args <- list(...)
  if (!all(sapply(args, is.numeric))) {
    cat("A classe dos objetos deve ser numeric\n")
  } else {
    soma <- sum(unlist(args))
    cat(soma, "\n")
    
    if (soma > 0) {
      cat("A soma é positiva\n")
    } else if (soma < 0) {
      cat("A soma é negativa\n")
    } else {
      cat("A soma é neutra\n")
    }
  }
}

person_soma(1, 2, 98, -6, "1", "a", T)

person_soma(1, 2, 3, 4)

person_soma(-3, -5, -8, 3)
