data=binary
View(data)
str(data)
xtabs(~admit+rank,data=data)
data$rank=as.factor(data$rank)
data$admit=as.factor(data$admit)
str(data)
pairs.panels(data[-1])
data %>%
  ggplot(aes(x=admit,y=gre,fill=admit))+geom_boxplot()+ggtitle("BOX PLOT")
data %>%
  ggplot(aes(x=gre,fill=admit))+geom_density(alpha=0.8,color='red')+ggtitle("DENSITY PLOT")
set.seed(1234)
pd=sample(2,nrow(data),replace = T,prob = c(0.8,0.2))
train= data[pd==1,]
test=data[pd==2,]
#naive base model
model=naive_bayes(admit~.,data = train)
model
train %>%
  filter(admit=="0")%>%
  summarise(mean(gre),sd(gre))
train %>%
  filter(admit=="1")%>%
  summarise(mean(gre),sd(gre))
plot(model)
p=predict(model,train,type = 'prob')
head(cbind(p,train))
p1=predict(model,train)
(tab1= table(p1,train$admit))
1-sum(diag(tab1))/sum(tab1)
View(train)
p2=predict(model,test)
(tab1= table(p2,test$admit))
1-sum(diag(tab1))/sum(tab1)
