setwd("C:/Users/david/Desktop/R_Project")
library("ggplot2")
library("dplyr")
library("utils")

#Read the census file
census <- read.csv("C:/Users/david/Desktop/R_Project/Cleaned up Input file.csv")

#View the file
head(census)

#Create dataframe from Utah Population and Years
Utahpopdata <- filter(
  .data = census,
  Geographic.Area == "Utah")

yearheaders <- c("2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018")

Utah <- data.frame(print(Utahpopdata),yearheaders)

#Plot the Utah data
plot(Utah)

#Gain Statistical Descriptors of Utah data
summary(utah)
 
#Find regression line and add to plot
regression <- lm(
  formula = utahpop ~ year,
  data = Utah)
summary(regression)

lines(utah$year,
      fitted(regression),
      col = "red")

#Create data frame with years 2019-2025
PredictYears <- data.frame(
  year = c(2019, 2020, 2021, 2022, 2023, 2024, 2025))

#Predict 5 more years of the population
predict(regression, newdata = PredictYears)
