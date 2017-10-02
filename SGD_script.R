N <- 100
P <- 2
X <- matrix(rnorm(N * P), ncol = P)
y <- rbinom(N, 1, prob = .6)
beta = rep(0, P)
m = 1
lambda = 0.1
step <- 1 / N

# Initial Iteration (GUESS)
# betas = array(NA, dim=c(iter, ncol(X)))
# betas[1,] = beta
# ll = array(NA, dim = iter)
# ll[1] = Negll(betas[1,], y, X, m)

# Iterations
for (i in 2:iter){
  r <- sample(nrow(X), 1) # Draw a random sample with replacement
  grad <- gradll(beta, y[r], X[r, , drop = FALSE], m, lambda)
  beta <- beta - step * grad
}
