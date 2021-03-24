# Title     : TODO
# Objective : TODO
# Created by: Oğuz
# Created on: 17.12.2020
library(tidyverse)

set.seed(2017556019)
stringr::words
#1
newdata <- sample(stringr::words,100)
newdata

#2 
witha <- str_subset(newdata,"^a",negate = FALSE)
withae <- str_subset(witha,"e$",negate = FALSE)

#3
sum( str_count(newdata, "[aeiou]") >3)

#4
df <-str_length(newdata)

mydata<- tibble(
   word = newdata,
   length = df,
 )

 mydata %>%
   group_by(word) %>%
   arrange(desc(length)) %>%
   head(5)

#5
find<-c("age","any","day","exp","her","pro")
find_match<-str_c(find,collapse = "|")
has_find<-str_subset(newdata,find_match)
matches<-str_extract(has_find,find_match)
head(has_find)





