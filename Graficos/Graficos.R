
#install.packages("plotrix")
#install.packages("treemap")
library(plotrix)
library(ggplot2)
library(treemap)
getwd()

##### Barplot (criacao de grafico de barras) ##### 

################## Dados ########################
    ### criacao de vetor 
vetor_total_resultados = c(3, 12, 5, 18, 45) 
#nomeacao do vetor 
names(vetor_total_resultados) = c("A", "B", "C", "D", "E") 
# imprimindo o resultado
vetor_total_resultados 
    #### conjunto de dados do R
View(mtcars)


### grafico de barras dos dados vetor_total_resultados ###
barplot(vetor_total_resultados)
# colocando cores na barra
barplot(vetor_total_resultados, col = c(1,2,3,4,5))


### Barplot (grafico de baras dos dados mtcars) com cores e legenda ###
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl) )) +  
  geom_bar( ) +
  scale_fill_manual(values = c("red", "green", "blue"))

# Salvando o grafico em disco
png("barplot.png", width = 480, height = 480 ) 
barplot(vetor_total_resultados, 
        col = rgb(0.5,0.1,0.6,0.6), 
        xlab = "Categorias", 
        ylab = "Valores", 
        main = "Barplot em R", 
        ylim = c(0,60) )
dev.off()