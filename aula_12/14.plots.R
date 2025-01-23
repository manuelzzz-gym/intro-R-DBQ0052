#########################
###  Plotar um vetor  ###
#########################

notas<-c(7,9,6,10)
barplot(notas)                                 #barplot plota um grafico de barras com os valores
names(notas)<-c("Pedro","Paulo","Ana","Maria")
barplot(notas)                                 #Se houver nomes, eles serao plotados
abline(h=5,lwd = 1, col="red")                 #abline() plota uma linha. h=horizontal, v=vertical

help(barplot)
help(par)

############################
### Grafico de dispersao ###
############################

x<-seq(1, 20, 0.1)
y<-sin(x)
plot(x,y)


#gerando um modelo linear
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
x
e
y <- 0.5 + 2 * x + e
plot(x,y)                              #plot() plota scattered
model<-lm(y ~ x)                       #lm() faz um modelo linear
model
abline(model, lwd = 1.5, col="blue")
summary(model)                         #summary resume o dado

#binario
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
plot(x,y)
Nor<-rnorm(10000, mean=0, sd=1)      #distribuicao normal
plot(Nor)
barplot(Nor)
hist(Nor, 100)                       #histograma

unif<-runif(10000)                   #distribuicao uniforme
hist(unif, 100)

#############################
### Graficos com matrizes ###
#############################

mt <- matrix(1:10, 10, 10)
# mt[4, 6] <- 0
image(mt)
contour(mt)
persp(mt, expand=0.2)

# uso de uma matriz ja carregada no ambiente
dim(volcano)
contour(volcano)
persp(volcano, expand=0.2)
image(volcano)

###############################################################################################
airquality<-airquality

summary(airquality)                                                        #summary resume o dado
hist(airquality$Ozone, col = "red", xlab = "Ozone")                        #histograma de uma coluna
rug(airquality$Ozone)                                                      #plota todas as ocorrencias
abline(v=median(airquality$Ozone, na.rm = T),col="blue", lwd=4)

boxplot(airquality$Ozone ~ airquality$Month, col = "blue", xlab = "Month") #plota diversos box
title(main = "Ozone by month")                                             #coloca o titulo

with(airquality, plot(Solar.R, Ozone))                                     #dispersao entre duas colunas
with(airquality, plot(Temp, Ozone))

boxplot(airquality$Solar.R ~ airquality$Month, col = "yellow", xlab = "Month")

s <- split(airquality, airquality$Month)                  #montas data.frames por mes e coloca numa lista

summary(s[[1]])
plot(s$`5`$Ozone ~ s$`5`$Day, type="h", lwd=4 )

with(airquality, {
       plot(Temp, Ozone)
       lines(loess.smooth(Temp, Ozone))
       })

## Devices
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
