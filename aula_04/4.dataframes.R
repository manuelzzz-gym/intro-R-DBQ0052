######################################
##            data.frame            ##
######################################

#foramdo por vetores de mesmo tamanho, organizados como colunas

number<-c(1, 2, 3, 4, 5)
letter<-c("x", "y", "z", "w", "j")
logical<- c(TRUE, FALSE, FALSE, TRUE, FALSE)
seq<-1:10

dt<-data.frame(number, letter, logical)
class(dt)
dt$letter                     #usamos $ para acessar as colunas de um data.frame
class(dt$letter)              #vetores de caracter sao interpretados como fatores

dt<-data.frame(number, letter, logical, stringsAsFactors = F) #stringsAsFactors = F
dt$letter
class(dt$letter)

attributes(dt)                #data.frames possuem colnames e rownames
colnames(dt)
row.names(dt)

dt[5,2]                       #acessamos data.frames da mesma forma que matrizes

######################################
##    Trabalhando com data.frames   ##
######################################

#para acessar data.frames usamos [], [[]] ou $

dt<-data.frame(number=c(1, 2, 3, 4, 5), 
               letter = c("x", "y", "z", "w", "j"),
               logical = c(TRUE, FALSE, FALSE, TRUE, FALSE))

dt[[1]]              # [[ ]] acessa cada coluna por posicao
dt[,1]               # [ ] acessa as coordenadas [linha, coluna]
dt$number            # $ acessa cada coluna por nome


cars<-mtcars        #carrega o data.frame mtcars
head(cars)          #mostra as 6 primeiras linhas
tail(cars)          #mostra as 6 ultimas linhas

#Ex.1: faca um data.frame somente com as informacoes dos carros com mais de 100hp
               
carros100hp<-cars[cars$hp>100,]  #usamos o $ para acessar a coluna hp
carros100hp

#data.frames possuem colnames e rownames
colnames(dt)
row.names(dt)

#podemos alterar colanmes e rownames
row.names(dt)<-c("a", "b", "c", "d", "e")
colnames(dt)[2]<-"letras"     #alteramos unicamente a posicao 2

#podemos alterar valores especificos de um data.frame
dt[3,1]<-"10"
dt$logical<-as.numeric(dt$logical)
dt$letras<-NA

#Podemos verificar as ocorrencias de um data.frame em outro

biometria<-data.frame(nomes=c("Carlos", "Roberto", "Olivio", "Joel"),
                      altura=c(180, 187, 155, 168),
                      peso=c(80, 90, 98, 64))
esportes<-data.frame(nomes=c("Carlos", "Roberto", "Olivio", "Jomar"),
                     esportes=c("futebol", "remo", "sumo", "maratona"))

biometria$nomes%in%esportes$nomes         #constroi um logico 
idx<-biometria$nomes%in%esportes$nomes    #pode ser usado como indice
x<-biometria[idx,]                        

#ordenando data.frames por uma coluna
biometria<-biometria[with(biometria, order(altura)), ]

#Ex.2: ordene o data.frame cars com a coluna "mpg" em ordem crescente
carsOrdenado<-cars[with(cars, order(mpg)),]
carsOrdenado

#unindo data.frames com a funcao merge()

unido<-merge(biometria, esportes, by="nomes")   #OBS.:Independe da ordem dos data.frames!
#A busca eh feita pelo nome, nao pela ordem!
#O resultado sempre virah em ordem alfabetica!

unido<-merge(biometria, esportes, by="nomes", all.x=T)#com todos presentos no primeiro
unido<-merge(biometria, esportes, by="nomes", all.y=T)#com todos presentos no segundo
unido<-merge(biometria, esportes, by="nomes", all=T)#com todos presentos
#OBS.: nesse caso, as informacoes faltantes sao preenchidas por NA!


