library(tidyverse)
library(dplyr)
library(data.table)

diamonds

diamonds%>%
  select(carat,cut,price)%>%
  filter(cut == "Premium")%>%
  filter(price > 7000 & price < 10000)%>%
  arrange(desc(carat))%>%
  slice(1:20)

# convert into Data.table
as.data.table(diamonds) -> diamonds_dt

diamonds_dt[, .(carat, cut, price)] -> d1

d1[cut == "Premium" & price > 7000 & price < 10000] -> d2

d2[order(-carat)] -> result

result[1:20]
