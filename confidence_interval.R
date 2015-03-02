set.seed(1234)

pop.mean <- 50
population <- rnorm(10000, mean=pop.mean, sd=10)

n <- 30
samp <- sample(population, n)
ci.int <- t.test(samp, mu=50)$conf.int

plot(ci.int, c(1, 1), type="l", xlab="Sample mean", ylab="Sample number",
     xlim=c(40, 60), ylim=c(0, 101))

abline(v=pop.mean, col="blue", lwd=2)

for (i in 2:100) {
    samp <- sample(population, n)
    ci.int <- t.test(samp, mu=pop.mean)$conf.int
    if (pop.mean < ci.int[1] | pop.mean > ci.int[2]) {
        lines(ci.int, c(i, i), col="red")
    } else {
        lines(ci.int, c(i, i))
    }
}

conf.ints <- function(mu, sd, n, confidence=0.95) {
    population <- rnorm(10000, mean=mu, sd=sd)
    plot(c(mu-sd, mu+sd), c(0, 101), type="n", xlab="Sample mean",
         ylab="Sample number")
    abline(v=mu, lwd=2, col="blue")
    for (i in 1:100) {
        samp <- sample(population, n)
        ci.int <- t.test(samp, mu=mu, conf.level=confidence)$conf.int
        color <- ifelse(mu < ci.int[1] | mu > ci.int[2], 2, 1)
        lines(ci.int, c(i, i), col=color)
    }
}