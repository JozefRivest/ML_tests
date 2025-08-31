n <- 10000
v <- rnorm(n, mean = 0, sd = 1)
w <- rnorm(n, mean = 0, sd = 1)

z <- rnorm(n, mean = 0, sd = 1)

x <- 2 * z + rnorm(n, mean = 0, sd = 1)
y <- 3 * x + 2 * v + rnorm(n, mean = 0, sd = 1)

data <- dplyr::bind_cols(y, x, z, v, w)

cor(data)

mod <- lm(y ~ x + z + w + v, data = data)
summary(mod)

grid <- 10^seq(10, -2, length = 100)

predictors <- dplyr::bind_cols(v, w, x, z)

ridge <- glmnet::glmnet(predictors, y, lambda = grid, alpha = 0)
lasso <- glmnet::glmnet(predictors, y, lambda = grid, alpha = 1)

plot(ridge)
plot(lasso)
