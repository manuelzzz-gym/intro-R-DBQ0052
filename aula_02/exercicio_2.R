
# Exercício 2 - Vetores ---------------------------------------------------

## Questão 1. Considere os seguintes elementos: 1, 4, 5, "a", 10L e TRUE

# a) Crie um vetor com os elementos acima.
vetorA<-c(1, 4, 5, "a", 10L, TRUE)


# b) Verifique a classe do vetor criado. Se houve coerção implícita, explique. 
class(vetorA)

# O tipo do vetor é "character" pois o vetor possui elementos de diferentes classes.
# Dessa maneira o R converte todos os elementos para o tipo mais genérico, que é o "character".

## Questão 2. Considere as operações vetorizadas a) e b):

# a)
c(1, 3, 5) + c(2, 4, 6)

# b)
c(1, 3, 5) + c(2, 4, 6, 8)

## Explique o que ocorre em cada uma das operações acima. 

# no caso a, os vetores possuem o mesmo tamanho,
# logo, a operação é realizada a operação de soma elemento a elemento.

# no caso b, os vetores possuem tamanhos diferentes,
# então, o R recicla o vetor menor para que ele tenha o mesmo tamanho do vetor maior,
# e depois realiza a operação de soma elemento a elemento.


## Questão 3. Considere o seguinte vetor:

x <- c(-1, 45, -6, 88, 30, 4)

# a) Obtenha um outro vetor a partir deste que contenha apenas os elementos da posição 2 e da última posição.
y<-x[c(2, length(x))]

# b) Obtenha um outro vetor a partir de x que contenha todos os elementos, exceto o 3º elemento. 
z<-x[-3]

# c) Atribua um nome para cada um dos elementos do vetor x.
names(x)<-c("a", "b", "c", "d", "e", "f")

# d) Obtenha a posição do valor máximo contido no vetor x.
which.max(x)
x[which.max(x)]
x

# e) Obtenha um outro vetor a partir de x com todos os valores positivos. 
alfa<-x[x>0]
alfa
