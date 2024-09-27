
## Questão 1 ----

# José e Paulo adoram jogar basquete nas suas horas livres. Eles mantém uma
# competição entre si e por isso decidiram registrar todos os pontos que eles
# marcam durante as partidas.
# Até agora foram 8 partidas e José fez 8, 10, 12, 9, 15, 16, 11, 7 cestas.
# Paulo fez 5, 11, 13, 14, 23, 14, 9, 10 cestas.

# 1. Rode as linhas abaixo ára criar dois objetos que contendo o número de cestas que cada um fez:
José<-c(8, 10, 12, 9, 15, 16, 11, 7)
Paulo<-c(5, 11, 13, 14, 23, 14, 9, 10)

# 2. Verifique a classe de cada um dos objetos:
class(José)
class(Paulo)

# 3. Com a utilização da ajuda do R, procure por uma função que possibilite o cálculo de médias.
# Com ela, calcule as médias de cestas dos dois jogadores e atribua estes valores
# a objetos diferentes:
media_jose<-mean(José)
media_paulo<-mean(Paulo)

# 4. Compare os valores das médias calculadas usando os operadores lógicos ">" e "<".
# Quem teve um desempenho médio melhor?
if (media_jose == media_paulo) {
  print("José e Paulo tiveram o mesmo desempenho médio.")
} else if (media_jose > media_paulo) {
  print("José teve um desempenho médio melhor.")
} else if (media_jose < media_paulo) {
  print("Paulo teve um desempenho médio melhor.")
}
