library(ggmap)
library(tidyverse)
library(tidygeocoder)
library(ggplot2)

ufo_sightings <- read.csv("/Users/emeliefroehlich/Downloads/places.csv")
bigfoot_sightings <- read.csv("/Users/emeliefroehlich/Downloads/bfro_locations.csv")

sbbox <- make_bbox(
  lon = c(-125.0, -70.0),
  lat = c(25.0, 50.0),
  f = .1
)


register_stadiamaps(key = "191d2aad-e831-4e98-978c-8e1ae4907ed1")

map.us <- get_map(
  location = sbbox,
  source = "stadia",
  color = "color",
  maptype = "stamen_terrain"
)

map.us = ggmap(map.us)

# both sightings

map.us +
  geom_point(
    data = ufo_sightings,
    mapping = aes(
      x = longitude,
      y = latitude),
    size = 0.1,
    color = "blue",
    alpha = .1,
  )+ 
  geom_point(
    data = bigfoot_sightings,
    mapping = aes(
      x = longitude,
      y = latitude),
    size = 0.1,
    color = "red",
    alpha = .1,
  ) +
  labs(
    title = "UFO and Bigfoot Sightings",
  )

ggsave("both_sightings.png", dpi = 300)
dev.off()

# bigfoot sighting

map.us +
  geom_point(
    data = bigfoot_sightings,
    mapping = aes(
      x = longitude,
      y = latitude),
    size = 0.1,
    color = "red",
    alpha = .1,
  ) +
  labs(
    title = "Bigfoot Sightings",
    subtitle = "1921-2023"
  )
ggsave("bigfoot.png", dpi = 300)
dev.off()

# ufo sighting

map.us +
  geom_point(
    data = ufo_sightings,
    mapping = aes(
      x = longitude,
      y = latitude),
    size = 0.1,
    color = "blue",
    alpha = .1,
  ) +
  labs(
    title = "UFO Sightings",
    subtitle = "1925-2023"
  )
ggsave("ufo.png", dpi = 300)
dev.off()

