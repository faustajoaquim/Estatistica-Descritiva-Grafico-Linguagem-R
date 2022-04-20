
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

# grafico Scatter Plot

ggplot(data, aes(x=my_x, y=my_y)) +
geom_point(shape=1)

# Adiciona linha de regressao
ggplot(data, aes(x=my_x, y=my_y)) +    
  geom_point(shape=1) +  
  geom_smooth(method = lm , color="red", se=FALSE) 

# Adiciona smooth (intervalo de confianca)
ggplot(data, aes(x=my_x, y=my_y)) +    
  geom_point(shape=1) +  
  geom_smooth(method=lm , color="red", se=TRUE)  

########### Treemap  #####################
 
# Dados
grupo = c(rep("grupo-1",4), rep("grupo-2",2), rep("grupo-3",3))
subgrupo = paste("subgroup", c(1,2,3,4,1,2,1,2,3), sep = "-")
valor = c(13,5,22,12,11,7,3,1,23)
dados = data.frame(grupo, subgrupo, valor)
View(dados)

# Labels (customizacao dos dados)
?treemap
treemap(dados, 
        index = c("grupo", "subgrupo"),     
        vSize = "valor", 
        type = "index",
        fontsize.labels = c(15,12),               
        fontcolor.labels = c("white", "orange"),    
        fontface.labels = c(2,1),                 
        bg.labels = 220,             
        align.labels = list(c("center", "center"), c("right", "bottom")),                                  
        overlap.labels = 0.5,           
        inflate.labels = F)


# Customizando
treemap(dados, 
        index = c("grupo", "subgrupo"), 
        vSize = "valor", 
        type = "index",
        border.col = c("black", "white"),          
        border.lwds = c(7,2))

########### Histograma  #####################

# Gerando valores para x
x <- mtcars$mpg 

# Criando o histograma (variavel numerica)
?hist
h <- hist(x, 
          breaks = 10, 
          col = "red", 
          xlab = "Milhas Por GalÃ£o", 
          main = "Histograma com Curva de DistribuiÃ§Ã£o") 

# Customizando o histograma (funcao de densidade de probabilidade)
xfit <- seq(min(x), max(x), length = 40) 
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col = "blue", lwd = 2)

# Usando o ggplot2
# dataset
dados = data.frame(value = rnorm(10000)) 
View(dados)

# Tamanho das colunas
ggplot(dados, aes(x=value)) + 
  geom_histogram(binwidth = 0.05)

# Cor uniforme
ggplot(dados, aes(x=value)) + 
  geom_histogram(binwidth = 0.2, color="white", fill=rgb(0.2,0.7,0.1,0.4) ) 

# Cor proporcional
ggplot(dados, aes(x=value)) + 
  geom_histogram(binwidth = 0.2, aes(fill = ..count..) )

