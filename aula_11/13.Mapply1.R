# tapply aplica uma funcao por um fator
# ele faz o particionamento do dado com base nesse 

dt<-data.frame(nome=c("carlos", "jorge", "maria", "denise", "claudia"),
               peso=c(75, 87, 50, 67, 60), genero=c("m", "m", "f", "f", "f"),
               stringsAsFactors = F)

dt$genero<-as.factor(dt$genero)

tapply(X = dt$peso, INDEX = dt$genero , FUN = mean)

# Ex.3: Verifique a media de ozonio por mes no dataset airquality

tapply(airquality$Ozone, airquality$Month, mean)
# Retorna os valores como NA

tapply(airquality$Ozone, airquality$Month, mean, na.rm=T)
# Desconsidera os NA's apesar do parâmetro ter sido passado para a função tapply

# mapply
# multivariada que aceiata argumentos variaveis para uma funcao

str(mapply)

# os argumentos "x" e "y" variam
mapply(function(x,y){x^y}, x=c(2, 3), y=c(3, 4))

# aqui somente o argumento "x" varia
mapply(function(x,y){x^y}, x=c(2, 3), y=c(4))

# construindo uma lista
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep, 1:4, 4:1)


noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}

noise(5, 1, 2)

noise(1:5, 1:5, 2)

list(noise(1, 1, 2), noise(2, 2, 2),
     noise(3, 3, 2), noise(4, 4, 2),
     noise(5, 5, 2))

mapply(rnorm, 1:5, 1:5, 2)


# Crie uma matriz 4x4
Q1 <- matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)
Q1

# Ex.: 1. Crie a mesma matrix acima usando `mapply()`

Q2 <- matrix(mapply(rep, 1:4, 4),4,4)
Q2

Q1
Q2

#####################################################################
# Aggregate
mtcars<-mtcars

help("aggregate")

# USO: aggregate(objeto, list('fator de agrupamento'), funcao)
agg_max <- aggregate(mtcars$mpg, list(mtcars$cyl), max)

# Com formula:
agg_max2 <- aggregate(mpg ~ cyl, data = mtcars, FUN = max)

# Abordagens diferentes para o mesmo resultado:
agg_max
agg_max2

# Eh equivalente ao tapply 
tap_max <- tapply(mtcars$mpg, INDEX = mtcars$cyl, max)

# O aggregate retorna um dataframe, enquanto o tapply retorna um array.
class(agg_max)
class(tap_max)

# Ex. 2: verifique a media das colunas "conc" e "density" 
#        usando a coluna "run" como indexador 

DNase <- as.data.frame(DNase)
aggregate(DNase[, c("conc", "density")], list(DNase$Run), mean)
# Poderia ser c(2:3) ao inves de c("conc", "density")

# o tapply aplica uma funcao em um vetor e nao em dataframes
tapply(DNase, DNase$Run, mean)
tapply(DNase$conc, DNase$Run, mean)
