#install.packages("ggplot2")
library(ggplot2)

# Carregando o dataset
Vendas<-read.csv("Vendas.csv",dec = ",",fileEncoding ="windows-1252") 
usuarios<-read.table("Usuarios.csv", dec = ".",sep =",
                ", h=T,fileEncoding ="windows-1252")