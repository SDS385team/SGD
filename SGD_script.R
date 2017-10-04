N <- 100
P <- 150
X <- matrix(rnorm(N * P), ncol = P)
beta_true <- rnorm(P)
y <- rbinom(N, 1, w_estimate(beta_true, X))
batch_size <- nrow(X)

m = 1
lambda = 0.1
step <- 1 / N 
iter = 10000

# Initial Iteration (GUESS)
# betas = array(NA, dim=c(iter, ncol(X)))
# betas[1,] = beta
# ll = array(NA, dim = iter)
# ll[1] = Negll(betas[1,], y, X, m)

# Iterations
beta = rep(0, P)
ll <- negll(beta, y, X, m, lambda)
for (i in 2:iter){
  r <- sample(nrow(X), batch_size) # Draw a random sample with replacement
  grad <- gradll(beta, y[r], X[r, , drop = FALSE], m, lambda)
  beta <- beta - step * grad / batch_size
  ll <- c(ll, negll(beta, y, X, m, lambda))
}
plot(ll, type = "l")

res = glm.fit(X,y, family = binomial())
betas_reales = res$coefficient
print(betas_reales)
negll(betas_reales, y, X, m, lambda)

negll(beta, y, X, m, lambda)



Rcpp::sourceCpp("CPPtest.cpp")

sum_ints <- function(n) {
  suma <- 0
  for (i in 1:n) {
    suma <- suma + i
  }
  suma
}

timesTwo(c(1,2,3))
sumVectors(1:10, 1:10)


library(microbenchmark)
microbenchmark(
  sumInts(1000),
  sum_ints(1000)
)

