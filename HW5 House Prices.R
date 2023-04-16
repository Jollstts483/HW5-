library(tidyr)
library(dplyr)
library(lubridate)

load("C:/Users/Hamil/OneDrive/Desktop/house_prices.rda")

house_prices %>%
  gather(key = measure, value = value, -c(house_price_index, date, state)) -> house_reshaped

#created new dataframe with measure column and value column 

library(ggplot2)

ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  scale_x_continuous(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")), labels = c("80", "00", "20")) +
  facet_wrap(~ state, scales = "free_y")

write.csv(house_prices, file = "C:/Users/Hamil/OneDrive/Desktop/house_prices.csv")

