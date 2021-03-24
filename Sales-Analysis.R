# Title     : TODO
# Objective : TODO
# Created by: Oğuz
# Created on: 17.12.2020


set.seed(2017556019)

library(tidyverse)


data <- read_csv("assignment2_data.csv")
newdata<-data[sample(nrow(data),size=100),ncol=5]


#1
newdata %>%
group_by(Color) %>%
summarise(avg_sales = mean(Sales))
#2
newdata %>%
group_by(Region) %>%
summarise(avg_sales = mean(Sales))

#3
newdata %>%
group_by(Date) %>%
summarise(maxsales=max(Sales)) %>%
arrange(desc(maxsales))%>%
  head(5)


newdata %>%
group_by(Color,Sales) %>%
summarise(max(Sales)) %>%
arrange(desc(Sales))%>%
  head(5)

newdata %>%
group_by(Region,Sales) %>%
summarise(max(Sales)) %>%
arrange(desc(Sales))%>%
  head(5)

#4
df <- newdata %>%
separate(Date,into = c("Day","Month","Year"),sep = "-")

df %>%
group_by(Month) %>%
summarise(Sales = mean(Sales)) %>%
arrange(desc(Sales)) %>%
head(1)

#5
ggplot(data= df,mapping = aes(x=Year, y=Sales)) +
  geom_bar(stat = "identity", width = 0.3, fill="Red")



