# ============== Simulation 1 ================

##
# Here, y is function of two independent variables
##

n <- 10000

v <- rnorm(n, mean = 0, sd = 1)
w <- rnorm(n, mean = 0, sd = 1)
z <- rnorm(n, mean = 0, sd = 1)

x <- 2 * z + rnorm(n, mean = 0, sd = 1)
y <- 3 * x + 2 * v + rnorm(n, mean = 0, sd = 1)

data <- dplyr::bind_cols(y, x, z, v, w)

modelsummary::datasummary_correlation(data, output = "html")

prcomp(data[, -1])
psych::scree(cor(data[, -1]))
