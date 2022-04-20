
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

#vetor de paises
paises <- c("Brasil", "Estados Unidos", "Alemanha", "Reino Unido", "Espanha")

# grafico de pizza
pie(fatias, labels = paises, main = "Leitura de Livros Por Pessoa/Ano")

########### Pie Chart 3D (grafico de pizza 3D) #####################

# criacao de vetor
fatias <- c(4, 12, 14, 16, 8)

#vetor de paises
paises <- c("Brasil", "Estados Unidos", "Alemanha", "Reino Unido", "Espanha")

# grafico de pizza 3d 
pie3D(fatias, labels = paises, explode = 0.1, main = "Leitura de Livros Por Pessoa/Ano")

###########  Line Chart (grafico de linha) #####################

# criacao de vetor carros e caminhoes 
carros <- c(1, 3, 6, 4, 9)
caminhoes <- c(2, 5, 4, 5, 12) 

# grafico line chart

plot(carros, type = "o", col = "blue", ylim = c(0,12))
lines(caminhoes, type = "o", pch = 22, lty = 2, col = "red")
title(main = "ProduÃ§Ã£o de VeÃ­culos", col.main = "red", font.main = 4)

########### Boxplot #####################

# conjunto de dados do R (mpg)
View(mpg)

# grafico Boxplot
ggplot(mpg, aes(x = reorder(class, hwy), y = hwy, fill = class)) + 
  geom_boxplot() +
  xlab("class") +
  theme(legend.position = "none")

 ###########  Scatter Plot #####################
 
  ### Criando do data.frame data
 data = data.frame(cond = rep(c("condition_1", "condition_2"), each=10), 
                  my_x = 1:100 + rnorm(100,sd=9), my_y = 1:100 + rnorm(100,sd=16))

View(data)

