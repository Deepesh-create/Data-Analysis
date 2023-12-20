data<-iris

set.seed(555)

data <- sample(2,nrow(iris) , replace  = TRUE , prob = c(0.6,0.4))
train <- iris[data == 1 , ]
test <- iris[data== 2 , ]

model <- lda(Species~.,train)

p <- predict(model , train)
p1 <- predict(model , train)$class
tab <- table(predicted = p1 , actual = train$Species)

sum(diag(tab))/sum(tab)
