#robotstxt - to get permission, connectivity, etc.....
#rvest - to take the HTML scrapper point
library(robotstxt)
library(rvest)

#scrapping websites
url <- "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"

#allowability
path = paths_allowed(url)

#HTML elements from website
web <- read_html(url)

#segregating names
name <- web %>% html_nodes(".lister-item-header a") %>%html_text()
View(name)

#segregating year
year <- web %>% html_nodes(".text-muted.unbold") %>%html_text()
View(year)

#segregating duration
duration <- web %>% html_nodes(".runtime") %>%html_text()
View(duration)

#segregating rating
rating <- web %>% html_nodes(".ratings-imdb-rating strong") %>%html_text()
View(rating)

#creating dataframe
imdb <- data.frame(name, year, duration, rating)
View(imdb)

#saving data
write.csv(imdb,"mov.csv")
