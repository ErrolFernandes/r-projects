library('party')
library('rpart')
library('rpart.plot')
library('caret')
library('ROCR')
library('randomForest')
set.seed(46)
wineData = wine
quality=wine$quality
View(wine)
str(wineData)
sum(is.na(wineData))
hist(quality,main = "Wine Quality",col = "red")
treel=rpart(quality)
rpart.plot(treel)
rpart.plot(treel, extra1)
rpart.plot(treel, extra-2)
qualityFactor <- ifelse(wineData$quality >= 6, "high", "low")
wineData <- data.frame(wineData, qualityFactor)
table(wineData$qualityFactor)
wineData <- wineData[, -13]
wineData <- wineData[, -1]
index <- sample(2, nrow(wineData), replace=TRUE, prob = c(0.60, 0.40))
trainingData <- wineData[index==1, ]
validationData <- wineData[index==2, ]
control <- rpart.control(minsplit = 5L, maxdepth = 5L, minbucket = 5, cp = 0.002, maxsurrogate = 4)
rPartModel <- rpart(qualityFactor~., trainingData, method = "class", control = control)
predict_rpart <- predict(rPartModel, validationData[, -13], type = "class")
prp(rPartModel, type=2, extra=3, tweak=0.8, main = "The Quality of Wine", compress=TRUE)
prediction <- predict(rPartModel, validationData[, -13], type = "class")
misclassificationError <- mean(prediction != validationData$qualityFactor)
misclassificationError


