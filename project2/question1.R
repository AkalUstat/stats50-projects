library(readxl)
file_path <- "./project2/AmericanRiver-Sp2024.xlsx"

# Read the first range of cells
range1 <- read_excel(file_path, range = "D12:D27", col_names = FALSE)

# Read the second range of cells
range2 <- read_excel(file_path, range = "D31:D44", col_names = FALSE)

# Read the third range of cells
range3 <- read_excel(file_path, range = "D48:D59", col_names = FALSE)

dissolved_oxygen <- rbind(range1, range2, range3)
d_oxygen_num <- c(as.numeric(unlist(dissolved_oxygen)))

hist(
    d_oxygen_num,
     main = "Histogram for Sample Measurements",
     xlab = "Measurements of D O2",
)

boxplot(
  x = d_oxygen_num,
  main = "Boxplot for Sample Measurements",
  ylab = expression(hat(p), "value")
)

qqnorm(d_oxygen_num)
qqline(d_oxygen_num, col = "red")


sample_mean = mean(d_oxygen_num)
median = median(d_oxygen_num)
std_dev = sd(d_oxygen_num)
ks.test(d_oxygen_num, 'pnorm', sample_mean, std_dev)
