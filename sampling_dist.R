population <- rep(c(1, 5), each=500)

hist(population)

sampmeans <- NULL
for (i in 1:300) {
    x <- sample(population, 30)
    sampmeans[i] <- mean(x)
}

hist(sampmeans)

population <- rep(c(1, 2, 3, 4, 5), times=c(1000, 500, 250, 125, 63))

hist(population)

sampmeans <- NULL
for (i in 1:300) {
    x <- sample(population, 30)
    sampmeans[i] <- mean(x)
}

hist(sampmeans)