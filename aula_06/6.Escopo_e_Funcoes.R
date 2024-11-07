######################################
##              Escopo              ##
######################################

set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
lm(y ~ x) 

lm                          #funcao modelo linear
help(lm)                    #faz párte do pacote stats

lm<-x                       #atribuimos um valor a lm
lm                          
lm(y ~ x) 

lm<-function(x) {x*x}       #definimos uma nova função lm
lm                          # essa nova funcao esta no GloEnv
lm(y ~ x)
lm(x)

search()                   
stats::lm
stats::lm (y ~ x)


dt<-cars
attach(dt)                 #The database is attached to the R search path
search()

detach(dt)                 #remove it from the search()
search()

library(transcriptogramer)
search()

library(geneplast)
search()

######################################
##            Function            ##
######################################

#funcoes necessitam de argumentos
x<-1:10              
sum(x)                  #argumentos podem ter valor pre-definido
args(sum)

x<-c(x, NA)
sum(x)
sum(x, na.rm = T)

#argumentos sao reconhecidos por nome ou ordem

sum(x, T)               #aqui os argumentos foram reconhecidos por ordem
sum(na.rm = T, x)

################# Escrevendo suas proprias funcoes   ####################################

#     function(argumentos aqui!){
#           diga o que fazer aqui
#     }


f<-function(){                    #Imprime 12. Nao possui argumentos.
  12
}

f()

f1<-function(x){                   #simplesmente imprime "BU!" com qualquer argumento.
  
  "BU!!"
}



f2<-function(x, y=10){            #pode apresentar valor default
  x+y
}

f2(2)
f2(2, 4)


f3<-function(a,b) {              #quando construimos um objeto eh necessario imprimir
  res<-c()
  res[1]<-a^2
  res[2]<-b+1
  res
  #print(res)
}

f3(2, 4)

f4<-function(x,y){              #pode ler argumentos do ambiente
  x^2 + y/z
}

f4(2, 4)


#funcao dentro de funcao

make.power <-function(n) {
  pow <-function(x) {
    x^n
  }
  pow
}

cube<-make.power(3)
square<-make.power(2)



#faca uma funcao para calcular o IMC



