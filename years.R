library(ggplot2)
library(lubridate)
library(ggplot2)

ufo_sightings <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-06-25/ufo_sightings.csv")
bigfoot_sightings <- read.csv("/Users/emeliefroehlich/Downloads/bfro_locations.csv")


ufo_sightings$date_time <- as.POSIXct(ufo_sightings$date_time, format = "%d/%m/%Y %H:%M", tz = "UTC")

years <- format(ufo_sightings$date_time, "%Y")

year_counts <- table(years)

ufo_data <- data.frame(Year = as.numeric(names(year_counts)), Sightings = as.numeric(year_counts))



# ufos per year

ggplot(ufo_data, aes(
  x = Year,
  y = Sightings)) +
  geom_line() +
  labs(x = "Year", y = "Number of UFO Sightings", title = "UFO Sightings over the Years") +
  scale_x_continuous(breaks = seq(min(ufo_data$Year), max(ufo_data$Year) + 10, by = 10))
  
  
  
  

