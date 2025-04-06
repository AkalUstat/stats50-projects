library(readxl)
data <- read_excel(
  "./project1/Data_Project1.xlsx",
  sheet = "binom",
  col_names = FALSE
)
successes <- data[, 1]
proportions <- data[, 2]
proportions_as_numeric <- c(as.numeric(unlist(proportions)))

break_intervals <- seq(
  floor(
    min(
      proportions
    )
  ), ceiling(max(proportions)),
  by = 0.04
)

hist(proportions_as_numeric,
  breaks = break_intervals,
  main = "Histogram for Sample Proportions",
  xlab = "Sample Proportions",
  xlim = c(0.5, 0.86),
  ylim = c(0, 60)
)

boxplot(
  x = proportions_as_numeric, ylim = c(0.0, 0.9),
  main = "Boxplot for Sample Proportions",
  ylab = expression(hat(p), " value")
)
mean_p <- mean(proportions_as_numeric)
sigma_p <- sqrt(1 / 200 * (mean_p * (1 - mean_p)))
median_p <- median(proportions_as_numeric)
range_p <- max(proportions_as_numeric) - min(proportions_as_numeric)
iqr_p <- IQR(proportions_as_numeric)
