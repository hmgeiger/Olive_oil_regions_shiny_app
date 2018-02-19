library(pgmm)
data(olive)

library(e1071)
library(caret)
library(dplyr)
library(ggplot2)

olive <- olive[,c("Region","Eicosenoic","Linoleic")]

olive$Region <- plyr::mapvalues(x = olive$Region,from = c("1","2","3"),to = c("Southern Italy","Sardinia","Northern Italy"))
olive$Region <- factor(olive$Region,levels = c("Southern Italy","Sardinia","Northern Italy"))

#The original data set had the percents*100. We want just the percents to match input data, so divide by 100.
#Also make the original data match the input from the sliders in precision level (round to nearest .01 for eicosenoic, .10 for linoleic).

olive$Eicosenoic <- round(olive$Eicosenoic/100,digits=2)
olive$Linoleic <- round(olive$Linoleic/100,digits=1)

modFit <- train(Region ~ .,method="rpart",data=olive)

plot_without_their_olive_oil <- ggplot() + geom_point(data=olive,aes(Eicosenoic,Linoleic,colour=Region),size=2) + scale_colour_manual(values = c("#E69F00", "#56B4E9", "#009E73","black"))
