data <- read.csv("/home/deepesh/Desktop/housing.csv")

set.seed(1234)
row <- sample(nrow(data))
data <- data[row,]
split <- nrow(data)*0.8
train <- data[1:split,]
test <- data[split+1:nrow(data),]
