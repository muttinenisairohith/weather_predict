#----------- loading dataset ----------------------------------
data <- read.csv("~/chandu/data_weather_prediction_ml/pre_data1.csv")
plot(data$Temp.)
library(caTools)
split <- sample.split(data, SplitRatio=0.8)
split
training <- subset(data,split=="TRUE")
testing <- subset(data,split=="FALSE")
#-------lm for temperature overall-----------
model <- lm(Temp. ~. , data = training)
summary(model)
res <- predict(model,testing)
actuals_preds <- data.frame(cbind(actuals=testing$Temp., predicteds=res)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)
plot(res)
plot(testing$Temp.)
#-------random forest for UV radiation ----------------------
library(randomForest)
model.uv <- randomForest(UV.Rad. ~ date + Time ,data=training,ntree = 500, mtry = 6, importance = TRUE)
print (model.uv)
predTrain <- predict(model.uv, testing, type = "class")
actuals_preds <- data.frame(cbind(actuals=testing$UV.Rad., predicteds=predTrain)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)  #87% accuracy
plot(predTrain)
plot(testing$UV.Rad.)
#-------random forest for Rain --------------------------------
model.rain <- randomForest(Rain ~ date + Time ,data=training,ntree = 500, mtry = 6, importance = TRUE)
print (model.rain)
predTrain <- predict(model.rain, testing, type = "class")
actuals_preds <- data.frame(cbind(actuals=testing$Rain, predicteds=predTrain)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)  #79% accuracy
plot(predTrain)
plot(testing$Rain)
#--------random forest for Temp ----------------------------------
model.temp <- randomForest(Temp. ~ date + Time ,data=training,ntree = 500, mtry = 6, importance = TRUE)
print (model.temp)
predTrain <- predict(model.temp, testing, type = "class")
actuals_preds <- data.frame(cbind(actuals=testing$Temp., predicteds=predTrain)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)  #98% accuracy
plot(predTrain)
plot(testing$Temp.)
#--------- random forest for RH --------------------------------------
model.rh <- randomForest(RH ~ date + Time ,data=training,ntree = 500, mtry = 6, importance = TRUE)
print (model.rh)
predTrain <- predict(model.rh, testing, type = "class")
actuals_preds <- data.frame(cbind(actuals=testing$RH, predicteds=predTrain)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)  #97.9% accuracy
plot(predTrain)
plot(testing$RH)
#--------- random forest for wind speed -----------------------------------
model.windspeed <- randomForest(Wind.Speed ~. ,data=training,ntree = 500, mtry = 6, importance = TRUE)
print (model.windspeed)
predTrain <- predict(model.windspeed, testing)
actuals_preds <- data.frame(cbind(actuals=testing$Wind.Speed, predicteds=predTrain)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)  #13.9% accuracy
plot(predTrain)
plot(testing$Wind.Speed)
#---------- random forest for Wind.Direction ---------------------------------
model.winddirection <- randomForest(Wind.Direction ~ date + Time ,data=training,ntree = 500, mtry = 6, importance = TRUE)
print (model.winddirection)
predTrain <- predict(model.winddirection, testing, type = "class")
actuals_preds <- data.frame(cbind(actuals=testing$Wind.Direction, predicteds=predTrain)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)  #71.7% accuracy
plot(predTrain)
plot(testing$Wind.Direction)
#---------- random forest for Solar radiation ---------------------------------
model.solrad <- randomForest(Sol..Rad. ~ date + Time ,data=training,ntree = 500, mtry = 6, importance = TRUE)
print (model.solrad)
predTrain <- predict(model.solrad, testing, type = "class")
actuals_preds <- data.frame(cbind(actuals=testing$Sol..Rad., predicteds=predTrain)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)  #93.9% accuracy
plot(predTrain)
plot(testing$Sol..Rad.)
#----------- random forest for atmospheric pressure ------------------------
model.atmpressure <- randomForest(Atm..Press. ~ date + Time ,data=training,ntree = 500, mtry = 6, importance = TRUE)
print (model.atmpressure)
predTrain <- predict(model.atmpressure, testing, type = "class")
actuals_preds <- data.frame(cbind(actuals=testing$Atm..Press., predicteds=predTrain)) 
correlation_accuracy <- cor(actuals_preds)
print(correlation_accuracy)  #98.8% accuracy
plot(predTrain)
plot(testing$Atm..Press.)
#----------- random forest for