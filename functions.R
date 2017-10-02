sigmoid <- function(x) {
  1 / (1 + exp(-x))
}

w_estimate <- function(b, X) {
  sigmoid(drop(X %*% b))
}
  
negll <- function(b, y, X, m, lambda) {
  w <- w_estimate(b, X)
  -sum(y * log(w) + (m - y) * log(1 - w)) + lambda*sum(abs(b))
}

gradll <- function(b, y, X, m, lambda) {
  w <- w_estimate(b, X)
  ll_part <- drop(crossprod(X, y - m * w))
  penaly_part <- lambda * sign(b)
  ll_part + penaly_part
}
