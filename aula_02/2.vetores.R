
######################################
##             Vectors              ##
######################################

#funcao c() : concatenate
number<-c(1, 2, 3, 4, 5)
letter<-c("x", "y", "z", "w", "j")
logical<- c(TRUE, FALSE, FALSE, TRUE, FALSE)
seq<-1:10 # função que recebe argumentos tais que a:b (in range a until b)
complexo<-16i

# A classe da cada objeto pode ser acessada pela funcao class()

# EXp 1: aplique a cada um dos objetos acima a funcao class()

# funcao vector(): cria vetores
a<-vector(mode = "integer", length = 10)
b<-vector("logical", 10)
c<-numeric(10)
d<-character(10)# os vetores sao criados com valores padrao de cada classe

x<-1                          # numeros sao salvos como numeric
class(x)
x<-1L                         # para explicitar integer, usa-se L

# EXp 2: crie o vetor "alfa" contendo as 5 primeiras consoantes do alfabeto
alfa<-c("b", "c", "d", "f", "g")
class(alfa)

# EXp 3: crie um integer "primos" com os 5 primeiros numeros primos
primos<-c(2L, 3L, 5L, 7L, 11L)
class(primos)

# hierarquia de classes
x<-c(1, 2, 3)                 # numeric
y<-c("1", "2", "3")           # character


x<-c(TRUE, FALSE, FALSE)      # logical
y<-c("TRUE", "FALSE", "FALSE")# character

# Ex.4: verifique a classe de cada ojeto
a<-c(1, "a", TRUE)
b<-c(1, "a")
c<-c(1, T, F)
d<-c("a", T)
class(a)
class(c)
sum(logical)           # Podemos somar vetores logicos

# OBS. vetores comportam somente uma classe de elementos


# Coercao de objetos usando funcoes do tipo as.algumacoisa()
x<-0:10
x<-as.character(x)
class(x)
x

a<-as.numeric(x)
a
class(a)

b<-as.character(x)
b
class(b)

c<-as.logical(x)
c
class(c)

#Ex.5: verifique se "x" e "a" sao iguais
class(a)
class(x)
class(a) == class(x)

#Ex.6: tente converter os vetores (a, b, c) em numeric
a<-as.numeric(a)
b<-as.numeric(b)
c<-as.numeric(c)
class(a)
class(b)
class(c)

#Ex.7: crie um vetor de caracteres de "a" ate "d" e o converta em numerico
caractesesAD<-c("a","b","c","d")
caractesesAD
caractesesAD<-as.numeric(caractesesAD)
caractesesAD

#vetores de NA
x<-c(1, 2, 3, NA)
y<-c("a", "b", "c", NA)

is.na(x)

w<-rep(NA, 10)
w
class(w)
z<-rep(NA_integer_, 10)
z
class(z)

a <- c(1, 3, NA, 7, 9)
sum(a)
sum(a, na.rm=TRUE)


#objetos possuem atributos: classe, tamanho, dimensoes, names, etc
x<-1:5
x
length(x)
dim(x)
attributes(x)
names(x)<-c("a", "b", "c", "d", "e")
x
attributes(x)


######################################
##              factor              ##
######################################

#fatores sao vetores categoricos, possuem o atributo level

x<-factor(c("s", "n", "n", "s", "s"))
z<-factor(c("alto", "baixo", "medio"))



######################################
##    Trabalhando com vetores       ##
######################################
##  Operacoes vetorizadas
x<-1:5
y<-6:10
x+y               #ocorre a soma dos valores de ambos os vetores

x*2               #podemos multiplicar um vetor por um numero
x^2

z<-c(x,y)
z+x
w<-1:3
w+x

x
z
y

l<-c(T, T, F, T, F, F)
l/2

## para acessar vetores, usamos [ ]
letter<-c("x", "y", "z", "w", "j")
letter[2]               #acessa o segundo elemento do vetor
letter[2:4]             #podemos usar sequencia de valores
letter[c(1, 4)]         #usamos a funcao c() para valores nao contiguos
letter[-2]              #usamos numeros negativos para excluir um ou mais valores
letter[c(-2, -5)]

set.seed(1)
s<-sample(-1000:1000, 200)
idx<-c(1, 4)            #podemos criar indices numericos
letter[idx]

x<-1:10                 
x[x>7]                  #podemos usar "<", "==", ">=", etc.

letter[letter>"k"]      #tambem eh possivel para caracteres
letter[letter<"k"]
letter=="z"

# Ex. 8: crie um vetor de 1 até 10 e substitua o valor da oitava posição pelo valor da primeira posição. 
x<-1:10
x[8]<-x[1]
x

# funcoes para identificar valores extremos
set.seed(1)
s<-sample(-1000:1000, 200)

which.max(s)            # procura a posicao do maior valor
max(s)                  # imprime o maior valor 
range(s)
s

s>0                     # cria um vetor logico
which(s>0)              # cria um vetor com as posicoes que satisfazem o comando

#Ex.9: quantos valores de s sao maiores que 0?
length(s[s>0])

#Ex.10: faca um vetor contendo os valores de S maiores do que 0.
maioresQueZero<-s[s>0]
maioresQueZero

#funcoes de ordenamento
x<-c(3, 8, 2, 1, 5, 9, 7, 7, 3)
x      
sort(x)                 #ordena um vetor
sort(x, decreasing = T)
order(x)                #pega a ordem de cada elemento para torna-lo crescente
sample(x)               #randomiza
unique(x)               #elimina as replicatas
duplicated(x)           #logico

#Ex.11: quantos duplicados existem em x?
sum(duplicated(x))

#trabalhando com strings em vertores

x<-20:30
y<-1:4
append(x, y, after = 3)              #adiciona valores a um vetor em uma posicao especihfica

x<-paste("dt", 1:10, sep = "")       #cola dois vetores.Obs:Converte em character  
x


x <- c("16_24cat", "25_34cat", "35_44catch", "45_54Cat", "55_104fat")
grep("cat", x)
grep("cat", x, value = T)
grep("cat", x, ignore.case = T, value = T)
grep("cat", x, ignore.case = F, value = T)

#identificando expressoes regulares em um string

grep("cat", x)                      #identifica regex por posicao
grep("cat", x, value = T)           #value = T traz os valores
grep("cat$", x, ignore.case = T)    #$ identifica final do string 
grepl("cat$", x, ignore.case = T)   #grepl retorna um logical
strsplit(x, split = "_")            #separa o string e gera uma lista

sapply(strsplit(x, split = "_"), "[", 2)

# exemplos de metacharacter

# *: matches at least 0 times.
# +: matches at least 1 times.
# ?: matches at most 1 times.
# {n}: matches exactly n times.
# {n,}: matches at least n times.
# {n,m}: matches between n and m times.
#^: matches the start of the string.
#$: matches the end of the string.


strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")

grep("acb", strings)
grep("ac*b", strings)
grep("ac+b", strings)
grep("ac?b", strings)
grep("ac{2}b", strings)
grep("ac{2,}b", strings)
grep("ac{2,3}b", strings)

