
#install.packages("plotrix")
#install.packages("treemap")
library(plotrix)
library(ggplot2)
library(treemap)
getwd()

##### Barplot (criacao de grafico de barras) ##### 

################## Dados ########################
    ### criacao de vetor (vetor_total_resultados)
vetor_total_resultados = c(3, 12, 5, 18, 45) 
#nomeacao do vetor 
names(vetor_total_resultados) = c("A", "B", "C", "D", "E") 
# imprimindo o resultado
vetor_total_resultados 

    ### Criando do data.frame dados
dados = data.frame(group = c("A ","B ","C ","D ") , value = c(33,62,56,67))
View(dados)

    #### conjunto de dados do R (mtcars)
View(mtcars)


### tBarplo (grafico de barras dos dados vetor_total_resultados) ###
barplot(vetor_total_resultados)
# colocando cores na barra
barplot(vetor_total_resultados, col = c(1,2,3,4,5))


### Barplo (grafico de baras dos dados mtcars) com cores e legenda ###
ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl) )) +  
  geom_bar( ) +
  scale_fill_manual(values = c("red", "green", "blue"))


### Barplot (grafico de barras com data.frame dados ) com coes e legenda 
ggplot(dados, aes(x = group, y = value ,fill = group )) + 
  geom_bar(width = 0.85, stat = "identity")


# Salvando o grafico em disco
png("barplot.png", width = 480, height = 480 ) 
barplot(vetor_total_resultados, 
        col = rgb(0.5,0.1,0.6,0.6), 
        xlab = "Categorias", 
        ylab = "Valores", 
        main = "Barplot em R", 
        ylim = c(0,60) )
dev.off()


########### Pie Chart (grafico de pizza)#####################

# criacao do vetor fatias

fatias <- c(4, 12, 14, 16, 8)