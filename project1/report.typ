#set text(
  font: "New Computer Modern"
)

#set page(
  paper: "us-letter",
  margin: 1in
)

#set par(
  justify: true
)

#align(center)[
  = Project 1 \
  Akal Ustat Singh \
  STATS 50-05, Spring 2025
]

For the purposes of this project, I have used the R programming  language. The exact code is attached as an appendix to this document.

== 1. Binomial $hat(p)$ Estimation

  #box[$p tilde.eq 0.677 minus.plus 0.033$]


  We are given the number of success from 200 numbers from a $X tilde "Bin"(40, p)$ population.
  For each number, we are also given the sample proportions $hat(p) = X/n$. Given this information. we need
  to:
    - (a) describe the shape of the $hat(p)$ values using both summary measures and visual evidence
    - (b) estimate the standard error for $hat(p)$ values.

  Let us first analyze the shape and summary measures of $hat(p)$.

  === a. Summary Measures
  We can evaluate the mean and median numerically.

  Since we can estimate X using $overline(X) = X_1 + X_2 + ... + X_200$ and all values $hat(p_i) = X_i/n = X/40$,
  $mu_(hat(p)) = 1/200 sum_(k=1)^200 hat(p_k) tilde.eq 0.676625 tilde.eq 0.677$. Since $E[hat(p)] = p$, we can say that $p tilde.eq 0.677$.

  Additionally, the standard deviation can be computed $sigma_(hat(p)) tilde.eq sqrt(1/200 dot.op hat(p)(1-hat(p))) tilde.eq 0.03307594 tilde.eq 0.033$.

  $M_hat(p) tilde.eq 0.675$ (since $M_(hat(p)) gt mu_(hat(p))$, the data is left-skewed), range = $0.325$, and IQR = $0.1$.

  === b. Visual Evidence
  #figure(
    image("binomHist.png", height:35%),
    caption: [
      The Histogram of the $hat(p)$ values of 200 random numbers from the population $X tilde "Bin"(40,p).$
    ],
  )

  As we can see in the histogram (and using the mean and median calculated before), the data is left-skewed. This is further shown using the box plot below:

  #figure(
    image("binomBoxPlot.png", height:35%),
    caption: [
      The boxplot of the $hat(p)$ values of 200 random numbers from the population $X tilde "Bin"(40,p).$
    ],
  )

== 2. Oxygen Concetration Levels

=== a. Visual Plots

 #figure(
    image("OxygenHist.png", height:35%),
    caption: [
      Histogram of the Oxygen level data.
    ],
  )
   #figure(
    image("OxygenBox.png", height:35%),
    caption: [
     Boxplot of the Oxygen level data.
    ],
  )
   #figure(
    image("OxygenNorm.png", height:35%),
    caption: [
      Normality Plot of the Oxygen level data.
    ],
  )

  As visible from the Normality plot, the data is approximately normal. However,
  the deviations at the tails, especially visible at the upper tail, indicate slight skewness.
  This is supported by the number of outliers visible in the boxplot and and the very
  slight skew in the histogram.

  === b. Mean and Std. Dev.

  Letting the population $overline(X) = X_1 + X_2 + ... + X_130$, we can caluclate the mean, standard deviation, and standard error.

  Doing the calculations in the R programming language, we have the following result:

  $mu_(overline(X)) tilde.eq 9.003598 tilde.eq 9.00 "mg/L"$.

  $sigma_(overline(X)) = tilde.eq 2.414338 tilde.eq 2.41 "mg/L"$.

  $"Standard error" tilde.eq 0.2117514 tilde.eq 0.21 "mg/L"$. 

  Given this information, we can conclude that the average oxygen concentration in
  the river is above 5 mg/L. Firstly, the estimated mean is about 9mg/L, and furthermore,
  since the standard deviation is approximately 2.41 mg, 5 mg/L is above 1 standard deviation
  from the mean (close to 1.5).

  #pagebreak()

  #align(center)[
  = Appendix A: R Code for Q1 \
  Akal Ustat Singh \
  STATS 50-05, Spring 2025
]

```r
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
```

#align(center)[
  = Appendix B: R Code for Q2 \
  Akal Ustat Singh \
  STATS 50-05, Spring 2025
]
```r
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
std_error <- sigma_msmt / sqrt(length(measurements_as_numeric))
```
