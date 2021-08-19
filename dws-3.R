groceries
library(arules)
library(ggplot2)

apriori(groceries,parameter = list(support=0.002,confidence=0.5,minlen =5))-> rule1
plot(rule1)
inspect(head(sort(rule1,by="lift"),15))
plot(rule1,method = "grouped")

apriori(groceries,parameter = list(support=0.004,confidence=0.4,minlen =3))-> rule2
plot(rule2)
inspect(rule2,method = "grouped")
inspect(head(rule2,10))
inspect(head(sort(rule2,by="support"),10))

apriori(groceries,parameter = list(support=0.006,confidence=0.3,minlen= 4))-> rule3
inspect(head(rule3,15))
inspect(head(sort(rule3,by="coverage"),12))
plot(rule3,method = "grouped")

apriori(groceries,parameter = list(support=0.07,confidence=0.4,minlen = 4))-> rule4
inspect(head(rule4,5))
inspect(rule4,method = "grouped")
inspect(head(sort(rule4,by="confidence"),20))
plot(rule4,method = "grouped",25)
