library(palmerpenguins)
library(tidyverse)


library(palmerpenguins)
library(tidyverse)



           
#start by specifying the working directory 
#insert your own file path before "/PenguinAssesment
setwd("/PenguinAssesment")


#let us also specify the location of some of the functions we will be using
#as beforore, insert your own file path before "/PenguinAssesment 
source("PenguinAssesment/functions/functions.R")


##let us load in some more packages
library(palmerpenguins)
library(tidyverse)
library(janitor)
library(dplyr)
library(tidyr)
library(ragg)
library(svglite)


#loading in the raw penguin data
penguins_raw <- read.csv("data_raw/penguins_raw.csv")

#cleaning data, and saving it in our working directory 
penguins_clean <- cleaning1(penguins_raw)
write.csv(penguins_clean, "data_clean/penguins_clean.csv")

#I am interesting in the relationship between the body mass of a penguin, and the length of its flippers
#To investigate this, I plan to run a linear regression model with body mass as the explanatory variable, and flipper length as the response variable
flipper_mod1 <- lm(flipper_length_mm ~ body_mass_g, penguins_clean)

#Let us have a look at some of the properties of our model 
summary(flipper_mod1)
anova(flipper_mod1)

#plotting output from linear regression 

#The actual penguin data has been superimposed on the output line, which is blue
#The equation is shown in the top left, and the grey region around the bar indicates the 95% confidence interval
plot_flipper_output(flipper_mod1)


#lets also save our plot as a .png file in our directory 
save_as_png(flipper_mod1, "figures/flipper_lm_output", 
                      size = 25, res = 600, scaling = 1.3)





         







