library(jsonlite)
library(tidyverse)
library(tidytext)
library(widyr)

speeches <- fromJSON("speeches.json")
bigrams <- speeches %>% 
  unnest_tokens(bigram, text, token = "ngrams", n = 2) %>% 
  separate(bigram, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>% 
  filter(!word2 %in% stop_words$word)

words <- speeches %>% 
  unnest_tokens(word, text) %>% 
  filter(!word %in% stop_words$word)

words %>% 
  pairwise_count(word, speaker, sort = TRUE)

bigrams %>%
  # group_by(speaker) %>% 
  count(word1, word2, sort = TRUE)
