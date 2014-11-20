r<-read.csv('Dataset.csv')
str(r)
traning<-subset(r, Year < 2006)
traning
test<-subset(r,Year>=2006)
test

# Linear Regression (ALL variables)

model1 = lm(Temp ~ MEI+CO2+CH4+N2O+CFC.11+CFC.12+TSI+Aerosols, data=traning)
summary(model1)

# Sum of Squared Errors
model1$residuals
SSE = sum(model1$residuals^2)
SSE



# Linear Regression (7 variables)
model2 = lm(Temp ~ MEI+CO2+N2O+CFC.11+CFC.12+TSI+Aerosols, data=traning)
summary(model2)

# Sum of Squared Errors
SSE = sum(model2$residuals^2)
SSE

# Linear Regression (6 variables)
model3 = lm(Temp ~ MEI+CO2+CFC.11+CFC.12+TSI+Aerosols, data=traning)
summary(model3)


# Sum of Squared Errors
SSE = sum(model3$residuals^2)
SSE

# Linear Regression (5 variables)
model4 = lm(Temp ~ MEI+CFC.11+CFC.12+TSI+Aerosols, data=traning)
summary(model4)

# Sum of Squared Errors
SSE = sum(model4$residuals^2)
SSE

# Linear Regression (4 variables)
model5 = lm(Temp ~ CFC.11+CFC.12+TSI+Aerosols, data=traning)
summary(model5)

# Sum of Squared Errors
SSE = sum(model5$residuals^2)
SSE


# Correlations
cor(traning)
cor(traning$CFC.11, traning$CFC.12)
cor(traning$CH4,traning$N2O)

# test set
test<-subset(r,Year>=2006)
test
str(test)

# Make test set predictions
predictTest = predict(model1, newdata=test)
predictTest

plot(predictTest)


# Compute R-squared
SSE = sum((test$Temp - predictTest)^2)
SST = sum((test$Temp - mean(traning$Temp))^2)
1 - SSE/SST
