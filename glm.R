mydata <- read.csv("C:\\Users\\HP\\Desktop\\Admission_Predict.csv" , header = T)

install.packages("caTools")
library(caTools)

split <- sample.split(mydata , SplitRatio = .8)

test2 <- subset(mydata , split == "FALSE")
train2 <- subset(mydata , split == "TRUE")

mydata$Admit = as.factor(mydata$Admit)
mydata$rank = as.factor(mydata$rank)

model <- glm(Admit~gpa+rank , data = train2 , family = "binomial")

res <- predict(model , test2 , type = "response")

conmat <- table(actual_value = test2$Admit , predicted_value = res>0.5)

percentage = (conmat[[1,1]]+conmat[[2,2]])/sum(conmat)

percentage
