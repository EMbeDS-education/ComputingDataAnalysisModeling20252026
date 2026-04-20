
library(betareg)
library(DHARMa)

# load data
data("GasolineYield", package = "betareg")

#data info
#yield: Proportion of crude oil converted to gasoline after distillation and fractionation (response variable)
#gravity: Crude oil gravity in degrees API (American Petroleum Institute scale)
#pressure: Vapor pressure of crude oil in pounds per square inch (psi)
#temp10: emperature in degrees Fahrenheit at which crude oil has vaporized
#temp: Temperature in degrees Fahrenheit at which all gasoline has vaporized (end point).
#batch: Batch indicator distinguishing the 10 different crude oils used in the experiment.

#beta regression model
mb1 <- betareg(yield ~ batch + temp, data = GasolineYield)

#model summary
summary(mb1)

#model check
plot(mb1)

#obtaining exponentiated coefficients
exp(coef(mb1))

#example of interpretation of the coef for Temperature, for each unit increase of temperature the odds for crude oil increase by 1%
#the value of phi is high, thus the variance is low


##now work on the data about FoodExpenditure

data("FoodExpenditure")
