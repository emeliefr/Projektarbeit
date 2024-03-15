library(tidyverse)
library(sf)
library(ggplot2)

usa_states <- st_read("/Users/emeliefroehlich/Downloads/tl_2020_us_state/tl_2020_us_state.shp")
population_states <- read_csv("/Users/emeliefroehlich/Downloads/NST-EST2023-POPCHG2020_2023.csv")
ufo_sightings <- read.csv("/Users/emeliefroehlich/Downloads/places.csv")
bigfoot_sightings <- read.csv("/Users/emeliefroehlich/Downloads/bfro_locations.csv")

-----------

names(usa_states)[5] <- "STATE"

population_states <- population_states %>%
  filter(STATE != c("00", "72"))

usa_states <- usa_states %>%
  filter(as.numeric(STATE) <= 56)


usa_states <- left_join(usa_states, population_states, 
                          by = "STATE")

------------
#ufos 
  
ggplot() +
  geom_sf(data = usa_states, aes(
    fill = ESTIMATESBASE2020
  ),
  color = "grey",
  size = 0.2) +
  scale_fill_gradient(name = "Population Density",
                      low = "#ffe6ab",
                      high = "#fc97c2")+
  theme_void()+
  theme(legend.position = "bottom")+
  geom_point(
    data = ufo_sightings,
    mapping = aes(
      x = longitude,
      y = latitude),
    size = 0.1,
    color = "blue",
    alpha = .1,
  ) +
  coord_sf(xlim = c(-125, -65), ylim = c(25, 50))

ggsave("ufo_population.png", dpi = 300)
dev.off()

#bigfoot

ggplot() +
  geom_sf(data = usa_states, aes(
    fill = ESTIMATESBASE2020
  ),
  color = "grey",
  size = 0.2) +
  scale_fill_gradient(name = "Population Density",
                      low = "#ffe6ab",
                      high = "#fc97c2")+
  theme_void()+
  theme(legend.position = "bottom")+
  geom_point(
    data = bigfoot_sightings,
    mapping = aes(
      x = longitude,
      y = latitude),
    size = 0.1,
    color = "red",
    alpha = .1,
  ) +
  coord_sf(xlim = c(-125, -65), ylim = c(25, 50))

ggsave("bigfoot_pop.png", dpi = 300)
dev.off()


