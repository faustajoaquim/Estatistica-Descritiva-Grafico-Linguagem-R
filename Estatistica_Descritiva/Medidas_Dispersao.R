#install.packages("ggplot2")
library(ggplot2)

# Carregando o dataset
Vendas<-read.csv("Vendas.csv",dec = ",",fileEncoding ="windows-1252") 


                ###########  Medida de posicao ###########
#######################################################################

# Resumo dos dados
head(vendas)
tail(vendas)
view(vendas)
str(vendas)
summary(vendas$Valor)
summary(vendas$Custo)

# Calculo da Media 
Vendas$Valor<-as.numeric(Vendas$Valor) 
mediaValor<-mean(Vendas$Valor)
mediaVcusto<-mean(vendas$Custo)

# Calculo da Media Ponderada
weighted.mean(vendas$Valor, w = vendas$Custo)

# Calculo da Mediana
mediana<-median(Vendas$Valor) # calculo de mediana

