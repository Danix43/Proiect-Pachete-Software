data <- online_advertising_performance_data

model <- lm(data$revenue ~ data$clicks + data$cost, data = data)
summary(model)
