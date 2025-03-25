library(readxl)
data = read_excel("./project1/Data_Project1.xlsx", sheet="binom", col_names = FALSE)
successes = data[, 1]
proportions = data[, 2]
proportions_as_numeric = c(as.numeric(unlist(proportions)))

break_intervals <- seq(floor(min(proportions)), ceiling(max(proportions)), by = 0.04)

hist(proportions_as_numeric,
     breaks = break_intervals,
     main="Histogram for Sample Proportions",
     xlab = "Sample Proportions",
     xlim=c(0.5, 0.86),
     ylim=c(0, 60)
     )


