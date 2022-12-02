#robotstxt - to get permission, connectivity, etc.....
#rvest - to take the HTML scrapper point
library(robotstxt)
library(rvest)

#scrapping websites
url <- "https://www.carwale.com/new/best-cars-under-5-lakh/"

#allowability
path = paths_allowed(url)

#HTML elements from website
web <- read_html(url)

#segregating name
name <- web %>% html_nodes(".o-jjpuv.o-cVMLxW") %>%html_text()
View(name)

#segregating showroom price
sprice <- web %>% html_nodes(".o-esPpgS.o-cKuOoN") %>%html_text()
View(sprice)

#segregating price
price <- web %>% html_nodes(".o-cyHybq") %>%html_text()
View(price)

#segregating offer
brand <- web %>% html_nodes(".o-OAYdd:nth-child(4) .o-fzpihx , .o-OAYdd:nth-child(2) .o-fzpihx , .o-OAYdd:nth-child(16) .o-fzpihx , .o-OAYdd:nth-child(3) .o-fzpihx , .o-OAYdd:nth-child(1) .o-fzpihx") %>%html_text()
View(brand)

#creating dataframe
carwale <- data.frame(name, sprice ,price, brand)
View(carwale)

#saving data
write.csv(carwale,"mov.csv")
