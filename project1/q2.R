library(readxl)
data <- read_excel(
  "./project1/Data_Project1.xlsx",
  sheet = "Oxygen",
  col_names = FALSE
)
measurements <- data[,1]
measurements_as_numeric <- c(as.numeric(unlist(measurements)))

hist(measurements_as_numeric,
     main = "Histogram for Oxygen Measurements",
     xlab = "Oxygen Measurements",
)
boxplot(
  x = measurements_as_numeric,
  main = "Boxplot for Oxygen Measurements"
)

qqnorm(measurements_as_numeric)
qqline(measurements_as_numeric, col = "red")

mean_msmt <- mean(measurements_as_numeric)
sigma_msmt <- sd(measurements_as_numeric)
std_error = sigma_msmt / sqrt(length(measurements_as_numeric))

mean_msmt
sigma_msmt
std_error
