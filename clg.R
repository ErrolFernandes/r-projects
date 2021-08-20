library(ggplot2)
library(plotrix)
df=data.frame(slices=c(10,20,30,30,50),lbls=c("mysore","bangalore","hassan","mangalore","gulbarga"))
ggplot(data=df,aes(x=slices,y=lbls),)+geom_bar(stat = "identity")+coord_flip()
pie(slices,labels=lbls,main = "PIE CHART")
pie3D(slices,labels=lbls,main = "PIE CHART",col = c("red","blue","black","purple","green"))
data=mtcars
