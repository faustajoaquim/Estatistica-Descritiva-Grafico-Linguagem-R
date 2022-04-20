#install.packages("ggplot2")
library(ggplot2)

# Carregando o dataset
Vendas<-read.csv("Vendas.csv",dec = ",",fileEncoding ="windows-1252") 


                ###########  Medida de Posicao ###########
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

# Calculo da Media 
Vendas$Valor<-as.numeric(Vendas$Valor) 
mediaValor<-mean(Vendas$Valor)
mediaCusto<-mean(vendas$Custo)

# Calculo da Media Ponderada
weighted.mean(vendas$Valor, w = vendas$Custo)

# Calculo da Mediana
medianaValor<-median(Vendas$Valor) 
medianaCusto<-median(vendas$Custo)

# Calculo da Moda
#Para o calculo da moda é necessario  criar uma funcao uma vez que o R
#nao contem funcao para o calculo da moda 

moda<-function(v){
  valor_unico<-unique(v)
  valor_unico[which.max(tabulate(match(v, valor_unico)))]
}

resultado_moda_Vendas<-moda(Vendas$Valor)
print(resultado_moda) 

resultado_moda_custo <- moda(vendas$Custo)
print(resultado_custo)

#grafico de media de valor por estado 
ggplot(Vendas)+
  stat_summary(aes(x=Estado,
                   y=Valor),
               fun=mean,# media
               geom = "bar",#grafico de barra
               fill="lightgreen",# cor do grafico
               col="grey50")+ #cor do grafico
  labs(title = "Média de Valor por Estado")


 ###########  Medida de Posicao Relativa ###########
#######################################################################

# Medidas de tendencia central
#  sumario de uma coluna
summary(Vendas$Valor)

# filtrando sumario de duas colunas
summary(Vendas[c('Valor','Custo')])

# calculo de quartil da variavel valor
quantile(Vendas$Valor)

# calculo de percentil da variavel valor
quantile(Vendas$Valor, porbs=c(0.01, 0.99))

# calculo de porcentagem da variavel valor
quantile(Vendas$Valor, seq(from=0,to=1, by=0.20))

# diferenca entre Q3 e Q1
IQR(Vendas$Valor)

# intervalo de valor minimo ao maximo
range(Vendas$Valor)

# difenca entre os valors 
diff(range (Vendas$Valor))