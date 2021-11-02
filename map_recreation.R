# nhgis0001_shape.zip from https://data2.nhgis.org/main

# read data from an NHGIS extract
library(ipumsr)
library(sf)
shape_file <- read_nhgis_sf(data_file = here::here("nhgis0002_csv.zip"),
                            shape_file = here::here("nhgis0001_shape.zip"))

# read in shape file
library(sf)
library(tidyverse)

southern_states <- shape_file %>% 
  filter(STATENAM %in% c("Maryland", "West Virginia",
                         "Virginia", "Kentucky",
                         "Missouri", "Tennessee",
                         "Arkansas", "Louisiana",
                         "Alabama", "Georgia",
                         "North Carolina",
                         "South Carolina",
                         "Florida", "Texas",
                         "Oklahama", "Mississippi"))


# https://tech.popdata.org/ipumsr/articles/ipums-nhgis.html
plot <- ggplot(data = southern_states, aes(fill = AGU001)) +
  geom_sf() +
  scale_fill_continuous("") +
  labs(
    title = "Total Number of Slaves",
    subtitle = "1860 Census"
  )
print(plot)
