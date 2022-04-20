

# Carregando o dataset
Vendas<-read.csv("Vendas.csv",dec = ",",fileEncoding ="windows-1252") 
usuarios<-read.table("Usuarios.csv", dec = ".",sep =",
                ", h=T,fileEncoding ="windows-1252")


                ###########  Medidas de Dispersao  ###########
#######################################################################

# Resumo dos dados
## visualizacao das primeiras linhas da tabela
head(vendas)
# Ultimas linhas da tabela
tail(vendas)
# visualisacao dos dados
view(vendas)
#Resumo dos dados 
str(vendas)
# sumario da tabela
summary(vendas$Valor)
summary(vendas$Custo)

#Calculo de Varianca
var(Vendas$Valor)

#Calculo de desvio padrao
sd(Vendas$Valor)


#coeficiente de variacao 
CV<-(sd(Vendas$Valor)/media)*100

                  ###########  Frequencia ###########
#######################################################################


#tabela de frequencia absoluta 
freq<-table(usuarios$grau_instrucao)
View(freq)

#tabela de frequencia relativa
freq_rel<-prop.table(freq)
View(freq_rel)

#porcentagem da frequencia 
freq_rel_p<-100*freq_rel
View(freq_rel_p)


# Adiciona linhas de total
View(freq)
freq <- c(freq, sum(freq))
View(freq)
names(freq)[4] <- "Total"
View(freq)

# Tabela final como todos os valores

# Calculamos frequência relativa e frequência proporcional
freq_rel <- c(freq_rel, sum(freq_rel))
p_freq_rel <- c(freq_rel_p, sum(freq_rel_p))

# Tabela final com todos os vetores
# ligacao entre colunas
tabela_final <- cbind(freq, 
                      freq_rel = round(freq_rel, digits = 2), 
                      freq_rel_p = round(freq_rel_p, digits = 2))
View(tabela_final)








