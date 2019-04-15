data <- read.csv("~/chandu/data_weather_prediction_ml/pre_data1.csv")
data <- read.table("~/chandu/data_weather_prediction_ml/pre_data1.csv")

library(caTools)
split<-sample.split(data$Rain,SplitRatio = 0.7)
split
training_data <-subset(data,split=="TRUE")
testing_data <-subset(data,split=="FALSE")
model<-lm(Rain~. ,data=training_data)
model<-lm(Rain~ Max..Temp.+Temp.+ Min..RH + Wind.Direction +Level.of.water.In.Pan + Atm..Press.+Sol..Rad. ,data=training_data)
summary(model)
predic<-predict(model,testing_data)
predic
actuals_preds <- data.frame(cbind(actuals=testing_data$Rain, predicteds=predic))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)  # 82.7%
correlation_accuracy
min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))  
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)  
#Random forest
library(randomForest)
model.forest <- randomForest(Rain~ Max..Temp.+Temp.+ Min..RH + Wind.Direction +Level.of.water.In.Pan + Atm..Press.+Sol..Rad. ,data=training_data,ntree = 500, mtry = 6, importance = TRUE)
print (model.forest)
predTrain <- predict(model.forest, testing_data, type = "class")
table(predTrain, testing_data$Rain)  
class(training_data$Rain)
