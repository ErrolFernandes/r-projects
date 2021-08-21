data = wine
View(wine)
data$Wine = factor(data$Wine)
str(data)
set.seed(75)
pd= sample(2,nrow(data),replace = TRUE,prob = c(0.8,0.2))
train=data[pd==1,]
validate=data[pd==2,]
tree= ctree(Wine+alcohol,data=train)
tree
plot(tree)
