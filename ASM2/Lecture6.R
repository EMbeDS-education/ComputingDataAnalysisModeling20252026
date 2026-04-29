#load packages
library(censReg)
library(AER)

library(mfx)
library(dplyr)
library(knitr)
library(marginaleffects)

#load data
data( "Affairs", package = "AER" )

#adapt the model (the option 'left=', or 'right=' could be used to indicate value for censoring)
mt1 <- censReg(affairs ~ age+yearsmarried + religiousness + occupation + rating, data = Affairs)

#have a look at estimates (on the latent variable, so they could be interpreted as "propensions")
summary(mt1)

margEff(mt1) %>% kable()

margmt1 <- margEff(mt1)

summary(margmt1)

mt1a <- tobit( affairs ~ age + yearsmarried + religiousness + occupation + rating, data = Affairs)

res <- residuals(mt1a)

#qqplot per la normalità
qqnorm(res)

#residuals plot for homoskedasticity
qqline(res)


#now work on charity data

#load data
charitable 