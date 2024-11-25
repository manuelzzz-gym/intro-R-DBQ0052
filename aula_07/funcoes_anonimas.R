
# Funções anônimas --------------------------------------------------------

# f1
f1 <- function() {
  3
}
f1()
# f1(2)

# Função anônima de f1
(function() {
  3
}) ()
(function(x = 1) {
  x + 2
})(3)

# f2
f2 <- function(x, y) {
  x + y
}
f2(2, 4)

# Função anônima de f2

(function(x, y) {
  x + y
}) (x = 2, y = 4)

environment(function(x, y) {
  x + y
})

airquality

# Função anônima para calculo de média definida dentro do sapply
sapply(airquality, function(x) {
  mean(x, na.rm = T)
})

# Função sendo definida e passada como argumento do sapply
calc_media <- function(x) {
  mean(x, na.rm = T)
}
sapply(airquality, calc_media)

# Porque usar ou não uma função anônima dentro do sapply:
# 
# Prós:
# De uma maneira geral, uma determinada economia de tempo e espaço
# Na prática, é mais fácil usar uma função anônima e economizar um objeto a ser criado
# 
# Contras: 
# Não é possível reutilizar e nem debugar a função
# Dessa forma, se vou usar uma função mais de uma vez, não faz sentido defini-la em múltiplos lugares
