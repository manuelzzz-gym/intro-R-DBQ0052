######################################
##             matrix               ##
######################################

# matrizes sao vetores com o atributo dimensao
x <- 1:20
x
attributes(x)

m <- matrix(x, 4, 5)
m
attributes(m)

dim(x) <- c(4, 5)
x
identical(x, m)

#OBS.: como sao vetores, matrizes comportam somente uma classe de elementos
a <- 1:5
b <- -1:-5
c <- c(3, 6, 4, 9, 1)
a
b
c

m <- cbind(a, b, c)       #funcao cbind() concatena colunas
m1 <- rbind(a, b, c)      #funcao rbind() concatena linhas

m
m1

#Acesso a matrizes
m[1, 3]                  #endereco das duas dimencoes [linha,coluna]
m[1, ]
m[2:3, ]
m[2:3, ][1, 3]
m[1, ] <- NA
m
m[1, ] <- 1:3

######################################
##              array               ##
######################################

ar <- array(1:200, c(5, 10, 4))    #vetores multidimensionais
ar
which(ar == 180, arr.ind = TRUE)
ar[5, 10, 1]
ar[, , 1]                          #[linha, coluna, matrix]
ar[, , 4]

######################################
##              list                ##
######################################

# listas sao tipos especiais de vetores, que comportam elementos de deferentes classes

a <- c(1, 3, NA, 7, 9)
b <- matrix(1:200, 20, 10)
c <- "Gol do Gremio"
z <- factor(c("alto", "baixo", "medio"))

ls <- list(a, b, c, z)
ls                      #cada elemento da lista aparece com [[]]

######################################
##        acessando listas          ##
######################################

# se faço o acesso com colchetes simples []
# acesso a posição indicada
# se eu acesso com os colchetes duplos [[]]
# eu realizo o acesso ao objeto que está dentro daquela posição

ls[1]              #[] extrei uma lista
ls[[1]]            #[[]]extrai o objeto interno

ls[[which(ls == "Gol do Gremio", arr.ind = TRUE)]]

ls[[2]][10, 9]
ls[[1]][5]

ls1 <- vector("list", 5)   #funcao vector pode criar listas vazias
ls1

class(ls[1])
class(ls[[1]])
class(ls[[2]])
class(ls1)
class(ls1[1])
class(ls1[[1]])

ls[[c(1, 2)]]      #posicao na lista e posicao no elemento
ls[[2]][2, ]
names(ls) <- c("Arilson", "Roger", "Paulo Nunes", "Jardel")
ls$Roger
ls
ls$Jardel
ls$Arilson[2]
