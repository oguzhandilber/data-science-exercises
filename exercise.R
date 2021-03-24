# Created by: Oğuz
# Created on: 7.01.2021

#1

input<-c(3,5,7,9,15,17)

is_prime <- function(n){
  if(sum(n %% (1:n) == 0) > 2){
    FALSE
  }
  else{
    TRUE
  }
}

apply <- sapply(input,is_prime)
apply


#2

library(dplyr)
library(tidyverse)
set.seed(2017556019)


new_sentences<-sample(sentences,5,)
new_sentences
memo<-str_c(new_sentences,sep = ".",collapse = " ")

new<-str_replace_all(memo,"\\.","")

df <- new %>%
  str_split(" ",simplify = FALSE)

sorted<-sort(df[[1]])

newdata<-c()

for (i in 1:length(sorted)) {
newdata[i]<-str_length(sorted[i])
}

mydata<- tibble(
  kelime = sorted,
  sayi = newdata,
)

a<-mydata %>%
  group_by(kelime) %>%
  arrange(sayi)

myvector<-c()

myvector<-a$kelime

lastvector<-myvector %>% str_c(collapse = " ")
lastvector
