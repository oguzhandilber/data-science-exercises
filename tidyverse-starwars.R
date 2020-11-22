# Title     : TODO
# Objective : TODO
# Created by: Oğuz
# Created on: 20.11.2020
installed.packages("tidyverse")
library(tidyverse)
starwars

#1
library(tidyverse)
starwars


 starwars %>%
  group_by(homeworld) %>%
  summarize(n_distinct(species)) %>%
  arrange(desc(homeworld))

#2
starwars %>%
  group_by(lengths(films),name)  %>%
  summarize(films)  %>%
  arrange(desc(films))

#3
starwars %>%
  group_by(species) %>%
  summarise(avg = mean(mass, na.rm=TRUE)) %>%
  arrange(avg)

starwars %>%
  group_by(species) %>%
  summarise(avg = mean(height, na.rm=TRUE)) %>%
  arrange(avg)

#4
starwars_new_character <- add_row(starwars,name ="Oguzhansolo", height = 1.80, mass= 74, hair_color=" black", skin_color= "brown", eye_color= "brown",
                            birth_year = 1999, sex =" male", gender = "masculine" , homeworld="Earth",species="HUman",
                            films=NA, vehicles=NA, starships=NA)

   view(starwars_new_character)


#5


dataset_bmi<- data.frame(starwars,bmi = starwars$mass/(starwars$height/100)^2) #I used this dataset in 7th question

new_dataset<-dataset_bmi %>%
  select(bmi,name,mass,height,species,hair_color,skin_color,eye_color,sex,gender)
#6



new_dataset <-new_dataset %>%
    mutate(underweight = (bmi < 18.5),
           healty = (18.5 < bmi) & (bmi < 24.99),
           overweight =(25.0 < bmi) & (bmi < 29.99),
           obese = (bmi > 30)) %>%
  select(species,underweight,healty,overweight,obese)


speciesweight <- new_dataset %>% group_by(species,underweight,healty,overweight,obese) %>% tally() #Counts for species whether they are underweight or healthy etc.

#7

ggplot(data= dataset_bmi,mapping = aes(x=gender, y=bmi,color=gender)) +
  geom_boxplot()


