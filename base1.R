data <- online_advertising_performance_data

# model liniar
model <- lm(revenue ~ clicks + cost, data = data)
summary(model)

# install.packages("tseries")
# library(tseries)
reziduale <- residuals(model)
jarque.bera.test(reziduale)

# install.packages("car") 
# library(car)
durbinWatsonTest(model)

# 6. Testul heteroscedasticității - Goldfeld-Quandt
#install.packages("lmtest")
#library(lmtest)
gqtest(model)

# 7. Testarea multicolinearității - VIF
vif(model)

# 8. Prognoza pentru o nouă observație
nou <- data.frame(cost = c(2.00, 2.10, 2.20, 2.30, 2.50), clicks = c(500, 550, 600, 650, 700))

# predict pentru revenue
# pe baza modelului si al valorilor introduce, functia predict genereaza valorile
predict(model, newdata = nou, interval = "confidence")
# predict(model, newdata = nou, interval = "prediction")



qqnorm(residuals(model)); qqline(residuals(model))

par(mfrow = c(2, 2))
plot(model) 
par(mfrow = c(1, 1))
