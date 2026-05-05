library(twopartm)
library(haven)
library(dplyr)
library(ggplot2)

data<-haven::read_dta("expenditure.dta")
summary(data$toth_exp)

ggplot(data, aes(x = toth_exp)) +
  geom_histogram(
    fill = "lightgray",        
    color = "black",           
  ) +
  labs(
    title = "Distribution of Health expenditore",
    x = "US dollars",
    y = "Count"
  ) +
  theme_minimal(base_size = 10) # Clean theme
  
  
tpm1 <- tpm(toth_exp ~ age + female, data = data, link_part1 = "logit", family_part2 = Gamma(link = "log"))
summary(tpm1)
