
# Exercício 4 - Dataframes ------------------------------------------------

# Questão 1 ---------------------------------------------------------------

## Crie os dataframes abaixo:

peso <- data.frame("Nome" = c("Bruno", "Dionisio","Eduardo", "Ana", "Silvia", "Elizete", "Renata", "Arlete", "Lucas"),
                   "Peso" = c(73, 68, 65, 73, 60, 65, 70, 83, 68), stringsAsFactors = F)

altura <- data.frame("Nome" = c("Davi", "Kevin","Eduardo","Lucas", "Antonio", "Moises", "Dionisio", "Ana", "Renata"),
                     "Altura" = c(150, 193, 152, 175, 191, 173, 180, 163, 178), stringsAsFactors = F)

idade <- data.frame("Nome" = c("Eloise", "Ana","Flavia","Dayse", "Eduardo", "Silvia", "Dionisio", "Renata", "Bruno"),
                    "Idade" = c(24, 27, 30, 21, 37, 18, 43, 26, 47), stringsAsFactors = F)

profissao <- data.frame("Nome" = c("Dionisio", "Renata","Ana","Flavia", "Thais", "Daniel", "Fernanda", "Bárbara", "Henrique"),
                        "Profissao" = c("Programador", "Pesquisadora", "Advogada", "Farmaceutica", "Bombeira Civil", "Cabelereiro",
                                        "Cozinheira", "Estiliesta", "Professor"), stringsAsFactors = F)

# No dataframe peso, verifique quantos valores iguais de peso existem.
peso$Peso[duplicated(peso$Peso)]

# No dataframe altura, verifique quantas e quais pessoas têm entre 163cm e 180cm.
altura$Altura[altura$Altura >= 163 & altura$Altura <= 180]

# Ordene o dataframe idade de forma descrescente.
alturaOrdenada<-altura[with(altura, order(-Altura)),]
alturaOrdenada

# Ordene o dataframe profissao lexicograficamente.
profissaoOrdenada<-profissao[with(profissao, order(Profissao)),]
profissaoOrdenada

# Verifique quais informações de Dionisio estão presentes nos 4 dataframes. 

# Cheguei a resposta com duas formas diferentes de fazer

# 1) com merge:
informacoesDionisioMerge<-merge(altura[altura$Nome=="Dionisio",],merge(merge(idade[idade$Nome=="Dionisio",],profissao[profissao$Nome=="Dionisio"]),merge(peso[peso$Nome=="Dionisio",],profissao[profissao$Nome=="Dionisio",],by="Nome")))
informacoesDionisioMerge

# 2) criando um novo data.frame()
nome <- "Dionisio"

informacoesDionisioDataFrame <- data.frame(
  Nome = nome,
  Altura = altura$Altura[altura$Nome == nome],
  Idade = idade$Idade[idade$Nome == nome],
  Peso = peso$Peso[peso$Nome == nome],
  Profissao = profissao$Profissao[profissao$Nome == nome]
)
informacoesDionisioDataFrame

# Altere a profissão da Renata para "Cientista"
profissao$Profissao[profissao$Nome == "Renata"] <- "Cientista"
profissao

# Retorne quantas pessoas possuem todas as informações (Peso, Altura, Idade e Profissão) e armazene em um novo dataframe
informacoesCompletas <- merge(merge(merge(peso,altura),idade),profissao)
informacoesCompletas

# Questão 2 ---------------------------------------------------------------

## Com os seguintes dataframes, responda: 

amostra1 <- data.frame("genero" = c("Prevotella", "Prevotella", "Prevotella", "Streptococcus","Neisseria", "Neisseria", 
                                    "Lactobacillus", "Bacteroides", "Anaerosporomusa"),
                       "especie" = c("Prevotella_copri", "Prevotella_denticola", "Prevotella_ruminicola", "Streptococcus_infantarius", 
                                     "Neisseria_gonorrhoeae", "Neisseria_meningitidis", "Lactobacillus_iners", "Bacteroides_xylanisolvens",
                                     "Anaerosporomusa_subterranea"), stringsAsFactors = F)

amostra2 <- data.frame("genero" = c("Prevotella", "Prevotella", "Streptococcus", "Streptococcus", "Neisseria", "Neisseria", "Bacteroides", 
                                    "Fusobacterium", "Pseudoalteromonas", "Achromobacter", "Aggregatibacte"),
                       "especie" = c("Prevotella_denticola", "Prevotella_ruminicola", "Streptococcus_infantarius", "Streptococcus_equi", 
                                     "Neisseria_gonorrhoeae", "Neisseria_meningitidis", "Bacteroides_xylanisolvens", "Fusobacterium_nucleatum", 
                                     "Pseudoalteromonas_sp._S558", "Achromobacter_sp._KAs_3-5", "Aggregatibacter_actinomycetemcomitans"), stringsAsFactors = F)

# Quantas espécies da amostra 1 também estão presentes na amostra 2?
especiesComunsUmParaDois <- intersect(amostra1$especie, amostra2$especie)
especiesComunsUmParaDois

# Quantas espécies da amostra 2 também estão presentes na amostra 1?
especiesComunsDoisParaUm <- intersect(amostra2$especie, amostra1$especie)
especiesComunsDoisParaUm

# Quais as posições e os valores dessas espécies?
posicoesEspeciesComunsUmParaDois <- which(amostra1$especie %in% especiesComunsUmParaDois)
posicoesEspeciesComunsUmParaDois


# Questão 3 ---------------------------------------------------------------

# Considere o dataframe abaixo:

df <- data.frame(col1 = 1:3, col2 = 2:4, col3 = 3:5)

# Faça a seleção dos elementos do dataframe utilizando duas abordagens diferentes: a 
# abordagem utilizada na indexação de matrizes e a abordagem para indexação de listas.

# 1) Selecione a primeira coluna
df[,1]


# 2) 3º elemento da 2ª coluna
df[3,2]


