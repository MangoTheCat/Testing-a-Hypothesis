## Generate data sets for app 
# Data needs to be saved as an rds file
# The app will pick up the file name so name sensibly
# Make sure all data is in the correct format or the app won't work


## Mr Sundae
dates <- seq.Date(from = as.Date("2014-08-01"), to = as.Date("2015-08-25"), by = "day")

day <- ifelse(weekdays(dates) %in% c("Sunday", "Saturday"), "Weekend", "Weekday")

Season <- ifelse(months(dates) %in% month.name[4:9], "Summer", "Winter")

Weather <- sample(c("Sun", "Rain"), 390, prob = c(0.8, 0.2), replace = TRUE)

sales <- (300 + rnorm(390, 5, 10)) + 
  (ifelse(day == "Weekend", 100, 50) + rnorm(390, 50, 20)) + 
  (ifelse(Season == "Summer", 100, 0) + rnorm(390, 20, 20)) +
  rnorm(390, 100, 30)

MrSundae <- data.frame(Date = dates, Day = day, Weather = Weather, Season = Season, 
                       Sales = sales)

saveRDS(MrSundae, file = "./Data/Mr Sundae.rds")



## Miss Fuschia

library(rvest)
page <- html("http://www.brideandblossom.com/wedding-advice-and-expertise/types-of-wedding-flowers/")
flowers <- html_nodes(page, "h5") %>% html_text()
nflowers <- length(flowers)

supplier <- sample(c("A", "B"), nflowers, replace = TRUE, prob = c(0.55, 0.45))

lifetime <- ifelse(supplier =="A", 
                   sample(2:10, nflowers, replace = TRUE, c(0.05, 0.07, 0.08, 0.1, 0.15, 0.25, 0.18, 0.07, 0.05)),
                   sample(2:10, nflowers, replace = TRUE, c(0.05, 0.07, 0.18, 0.25, 0.15, 0.1, 0.08, 0.07, 0.05))
                   )

rating <- 6 + ifelse(lifetime > 6, 2, 0) + rnorm(nflowers, 1, 0.5)

flowersBought <- rpois(nflowers, lambda = ceiling(rating))

MissFuschia <- data.frame(Flowers = flowers, Supplier = supplier, 
                          Lifetime = lifetime, Rating = rating, 
                          NumberBought = flowersBought)

saveRDS(MissFuschia, file = "./Data/Miss Fuschia.rds")

## Mr T.Ractor

crop <- rep(rep(c("Wheat", "Corn"), each = 75), times = 2)

field <- rep(1:2, each = 150)

year <- rep(1:75, times = 4)

temp <- rep(runif(75, 15, 35), times = 4)
  
yield <- ifelse(crop == "Wheat", 50, 80) + rnorm(300, 10, 10) +
  ifelse(field == 1, -20, 10) + rnorm(300, 5, 10) + 
  5*log(year) + rnorm(300, 5, 10) + 
  0.5*temp
   
plot(yield, type = "l")


MrTRactor <- data.frame(Yield = yield, Crop = crop, Field = factor(field), 
                        Year = year, AverageTemp = temp)

saveRDS(MrTRactor, file = "./Data/Mr T Ractor.rds")



## Mr Claus

sampled <- sample(1:nrow(babynames), 200)

sampledData <- babynames[sampled, c("name", "sex")]

nice <- sample(c("no", "yes"), 200, replace = TRUE, prob = c(.3, .7))

value <- 20 + rnorm(200) + 
  ifelse(nice == "nice", 10, -10) + rnorm(200, 5, 3)

age <- sample(1:10, 200, replace = TRUE)

MrClaus <- data.frame(Name = sampledData$name, Sex = sampledData$sex, 
                      Age = age, Nice = nice, PresentValue = value)

saveRDS(MrClaus, file = "./Data/Mr Claus.rds")



## Miss Chop

dates <- seq.Date(from = as.Date("2014-08-01"), to = as.Date("2015-08-25"), by = "day")

day <- ifelse(weekdays(dates) %in% c("Sunday", "Saturday"), "Weekend", "Weekday")

busy <- sample(c("quiet", "busy"), 390, replace = TRUE, prob = c(0.4, 0.6))

rating <- 5 + ifelse(busy == "busy", -1, 1) + rnorm(390, 0.5) +
  ifelse(day == "Weekend", 1, 0) + rnorm(390, 0.5)

rating <- ifelse(rating > 10, 10, rating)

MissChop <- data.frame(Date = dates, Weekday = day, Busy = busy, Rating = rating)

saveRDS(MissChop, file = "./Data/Miss Chop.rds")


## Mr Fix






