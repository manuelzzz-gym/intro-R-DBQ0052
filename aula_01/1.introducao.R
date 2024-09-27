
######################################
##        Operacoes simples         ##
######################################

# Aritmetica basica
2+5         #adicao                     
5-2         #subtracao
2*5         #multiplicacao
8/2         #divisao
2^5         #exponenciacao

# Avaliacao logica
3==5	      #igual
3!=5	      #diferente
3>5	        #maior que
3<5	        #menor que
3>=5	      #maior ou igual
3<=5	      #menor ou igual



# Operacoes concatenadas
((2+5-3)*10)^4/7^4


######################################
##            Variaveis             ##
######################################

x<-1        # A seta "<-" representa o simbolo de atribuicao
x           # Ao escrever o nome do objeto, seu valor sera impresso
class(x)
is.numeric(x)
length(x)

y<-"gol do gremio!"
y

#Os resultados da operacao podem ser salvos em objetos
x<-2+5                                  
y=5-2
2*5->w
z<-8/2

(((x-y)*w)^z)/(x^z)


######################################
##             Funcoes              ##
######################################

# Chamadas pelo nome
sum(1,3,5)

# Podem receber argumentos
a<-rep("Aluno",times=3)
a


######################################
##              Ajuda               ##
######################################

help(sum)         #acessa a documentacao do R
?sd               
??plot


######################################
##    Diretorio de trabalho         ##
######################################

getwd()           #verifica o diretorio de trabalho
setwd()           #seta o dieorio de trabalho
list.files()      #lista os arquivos presentes no diretorio de trabalho
load()            #carrega um arquivo binario do diretorio para o ambiente
save()            #salva um arquivo no diretorio de trabalho
