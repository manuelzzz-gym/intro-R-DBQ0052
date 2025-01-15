######################################
##        funcoes de loop           ##
######################################
#apply
set.seed(1)
m<-matrix(rnorm(100), 10, 10)

test<-apply(m, 2, range) #executa uma funcao em uma dimensao de array. 2=coluna
test
test1<-apply(m, 1, range) #1=linha
test1

#Ex.1:Calcule a media das colunas de uma matrix
#     usando apply  e retornando os valores em um vetor
set.seed(1)
mt<-matrix(rnorm(100*100), 100, 100)

# Observe a performance de funcao que usa o for loop para computar 
# uma estatistica aplicada as colunas:
getcolmed1<-function(nr=100,nc=100){
  mt<-matrix(rnorm(nr*nc), nr, nc)
  md<-NULL
  for(i in 1:ncol(mt)){
    md<-c(md,mean(mt[,i]))
  }
  md
}
system.time(res<-getcolmed1(nc=100))

# Agora observe a performance da mesma operacao usando a funcao 'apply':
getcolmed2<-function(nr=100,nc=100){
  mt<-matrix(rnorm(nr*nc),nr,nc)
  apply(mt,2,mean)
}
system.time(res<-getcolmed2(nc=100))

#Ex.2: Compare a performance, aumentando o numero de colunas para 100000.
system.time(res<-getcolmed1(nc=100000))
system.time(res<-getcolmed2(nc=100000))

#Ex.3: Faca uma funcao "maxCars" para identificar qual carro tem o valor maximo de cada caracteristica
#     no dataset mtcars usando apply
#     e mostre o nome do carro junto ao seu valor maximo

mtcars<-mtcars

maxCars<-function(data){
  apply(data, 2, (x){
    nm<-rownames(data)[which.max(x)]
    c(nm, x[nm])
  })
}
maxCars(mtcars)

#lapply e sapply
m<-matrix(rnorm(100), 10, 10)
x<-sort(m[,1])
y<-1:20
ls<-list(m, x, y)

ex1<-lapply(ls, mean) #lapply aplica uma funcao em uma lista e retorna uma lista
ex1
ex2<-sapply(ls, mean) #sapply retorna o objeto mais simples possivel
ex2

class(ex1)
class(ex2)

dt<-as.data.frame(m) 
sapply(dt, max)        #pode ser aplicado a data.frame
dt

## funcoes anonimas
x <- list(a=matrix(1:4,2,2), b=matrix(1:6,3,2))     #podemos definir a funcao

lapply(x, function(x) x[1,2]^3)

cars<-mtcars                        #podemos definir a funcao 
sapply(cars, function(i){
      max(i)+min(i)
})


#####   split  ###########

x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3,10)                            #gl() cria fatores
split(x, f)                              #funcao split divide um data.frame por um fator

lapply(split(x, f), mean)

airquality<-airquality

s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c("Ozone","Solar.R","Wind")]))  #retorna uma lista

sapply(s, function(x) colMeans(x[, c("Ozone","Solar.R","Wind")]))  #retorna uma matrix

sapply(s, function(x) colMeans(x[, c("Ozone","Solar.R","Wind")], na.rm = TRUE)) 
