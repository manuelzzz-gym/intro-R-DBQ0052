

# Exercício 11 ------------------ MAPPLY & TAPPLY----------------------------------

# Questão 1 -----------------------------------------------------------------------

# Com base no conjunto de dados airquality, responda às questões:
data("airquality", package = "datasets")
airquality
typeof(airquality)

# Calcule a média da concentração de ozônio por mês.
tapply(airquality$Ozone, airquality$Month, mean, na.rm = TRUE)

# Calcule a média da radiação solar por mês.
tapply(airquality$solar.R, airquality$Month, mean, na.rm = TRUE)

# Calcule o desvio padrão da temperatura por mês.
tapply(airquality$Temp, airquality$Month, sd, na.rm = TRUE)

# Questão 2 ---------------------------------------------------------------

# A função 'mapply()' pode ser útil para nomear e criar vários arquivos de forma programática. 
# Use a função 'mapply()' para combinar as strings contidas nos vetores abaixo:
v1 <- c("arq1", "arq2", "arq3", "arq4")
v2 <- c("analise1", "analise2", "analise3", "analise4")

# com o seguinte separador
v3 <- "_"

# E com a extensão abaixo:
v4 <- (".txt")

# Output: arq1_analise1.txt, arq2_analise2.txt, ...
mapply(paste, v1, v3, v2, v3, v4, sep = "")
