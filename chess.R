library(tidyverse)
library(sqldf)
df <- read_lines("data.txt", skip = 5)
df <- str_split(df, " ", 18, TRUE)
df <- as_tibble(df)
df <- subset(df, select = -c(V17))
colnames(df) <- c("number", "date", "result", "white_rating", "black_rating", "total_moves", "date_missing", "result_missing", "white_rating_missing", "black_rating_missing", "event_date_missing", "different_start_position", "different_start_position2", "result_not_properly_provided", "out_of_year_range", "bad_length", "moves")
df <- df[df$total_moves != 0,]
df <- df %>% mutate(
	date_missing = case_when(date_missing == "date_false" ~ FALSE, date_missing == "date_true" ~ TRUE, TRUE ~ NA),
	result_missing = case_when(result_missing == "result_false" ~ FALSE, result_missing == "result_true" ~ TRUE, TRUE ~ NA),
	white_rating_missing = case_when(white_rating_missing == "welo_false" ~ FALSE, white_rating_missing == "welo_true" ~ TRUE, TRUE ~ NA),
	black_rating_missing = case_when(black_rating_missing == "belo_false" ~ FALSE, black_rating_missing == "belo_true" ~ TRUE, TRUE ~ NA),
	event_date_missing = case_when(event_date_missing == "edate_false" ~ FALSE, event_date_missing == "edate_true" ~ TRUE, TRUE ~ NA),
	different_start_position = case_when(different_start_position == "setup_false" ~ FALSE, different_start_position == "setup_true" ~ TRUE, TRUE ~ NA),
	different_start_position2 = case_when(different_start_position2 == "fen_false" ~ FALSE, different_start_position2 == "fen_true" ~ TRUE, TRUE ~ NA),
	result_not_properly_provided = case_when(result_not_properly_provided == "result2_false" ~ FALSE, result_not_properly_provided == "result2_true" ~ TRUE, TRUE ~ NA),
	out_of_year_range = case_when(out_of_year_range == "oyrange_false" ~ FALSE, out_of_year_range == "oyrange_true" ~ TRUE, TRUE ~ NA),
	bad_length = case_when(bad_length == "blen_false" ~ FALSE, bad_length == "blen_true" ~ TRUE, TRUE ~ NA))