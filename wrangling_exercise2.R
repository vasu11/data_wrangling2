
setwd("C:/Users/Vasu/data")
data <- read.csv("titanic_original.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)

install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)

data <- mutate(data, embarked = ifelse(embarked == "" | embarked == " ", "S", embarked))

mean_age <- mean(data$age, na.rm = TRUE)
data$age[which(is.na(data$age))] <- mean(data$age, na.rm = TRUE) 
data <- mutate(data, boat = ifelse(boat == "", "NA", boat))
data <- mutate(data, has_cabin_number = ifelse(cabin == "", 0, 1))

write.csv(data, "titanic_clean.csv", na="")

