install.packages("mapdata")
library(mapdata)

state_data <- ggplot2::map_data("state")

California <- subset(state_data, region == "california")

load("C:/Users/Hamil/OneDrive/Desktop/wind_turbines.rda")
wind_ca <- subset(wind_turbines, t_state == "CA")

library(ggplot2)

ggplot() +
  geom_polygon(data = California, aes(x = long, y = lat, group = group), 
               fill = "blue", color = "black")

ggplot() +
  geom_polygon(data = California, aes(x = long, y = lat, group = group), 
               fill = "blue", color = "black") +
  geom_point(data = wind_ca, aes(x = xlong, y = ylat, size = t_cap), 
             color = "red") +
  guides(fill = "none")

