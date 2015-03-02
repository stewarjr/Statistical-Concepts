set.seed(88)

height.male <- rnorm(100, mean=72, sd=5)
height.female <- rnorm(100, mean=70, sd=5)

height <- c(height.male, height.female)
group <- rep(c("Male", "Female"), each=100)

data <- data.frame(group, height)

with(data, hist(height[group=="Male"], col="cyan", xlab="Height",
                main="Height Distribution by gender", breaks=10,
                density=TRUE, ylim=c(0, 20)))
with(data, hist(height[group=="Female"], col="red", breaks=10, add=TRUE,
                density=TRUE))
legend("topright", c("Male", "Female"), lty=1, col=c("cyan", "red"), cex=.7)

with(data, plot(density(height[group=="Male"]), col="cyan", xlab="Height",
                main="Height Distribution by gender"))
with(data, lines(density(height[group=="Female"]), col="red"))
legend("topright", c("Male", "Female"), lty=1, col=c("cyan", "red"), cex=.7)

male.mean <- with(data, mean(height[group=="Male"]))
female.mean <- with(data, mean(height[group=="Female"]))

diff.mean <- male.mean - female.mean

meandiffs <- rep(0, 5000)
for (i in 1:length(meandiffs)) {
    shuffle <- sample(height)
    assign.male <- shuffle[1:100]
    assign.female <- shuffle[101:200]
    meandiffs[i] <- mean(assign.male) - mean(assign.female)
}

hist(meandiffs, col="cyan", xlim=c(-3.5, 3.5))
abline(v=c(-abs(diff.mean), abs(diff.mean)), col="orange", lwd=2)

p.value <- 2*sum(meandiffs <= -abs(diff.mean))/length(meandiffs)

t.test(height ~ group, data=data)$p.value