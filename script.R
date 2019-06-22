library(jsonlite)
library(tidyverse)

speeches <- fromJSON("speeches.json")
speeches %>%
  ggplot(aes(reorder(speaker, readability), readability)) +
  geom_col() +
  coord_flip()
