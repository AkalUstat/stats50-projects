library(readxl)
file_path <- "./project2/AmericanRiver-Sp2024.xlsx"

# Read the first range of cells
tap_od_range1 <- read_excel(file_path, range = "I12:I27", col_names = FALSE)

# Read the second range of cells
tap_od_range2 <- read_excel(file_path, range = "I31:I44", col_names = FALSE)

# Read the third range of cells
tap_od_range3 <- read_excel(file_path, range = "I48:I59", col_names = FALSE)

tap_od <- rbind(tap_od_range1, tap_od_range2, tap_od_range3)
tap_od_num <- c(as.numeric(unlist(tap_od)))


# Read the first range of cells
tap_temp_range1 <- read_excel(file_path, range = "G12:G27", col_names = FALSE)

# Read the second range of cells
tap_temp_range2 <- read_excel(file_path, range = "G31:G44", col_names = FALSE)

# Read the third range of cells
tap_temp_range3 <- read_excel(file_path, range = "G48:G59", col_names = FALSE)

tap_temp <- rbind(tap_temp_range1, tap_temp_range2, tap_temp_range3)
tap_temp_num <- c(as.numeric(unlist(tap_temp)))

# Read the first range of cells
river_od_range1 <- read_excel(file_path, range = "D12:D27", col_names = FALSE)

# Read the second range of cells
river_od_range2 <- read_excel(file_path, range = "D31:D44", col_names = FALSE)

# Read the third range of cells
river_od_range3 <- read_excel(file_path, range = "D48:D59", col_names = FALSE)

river_od <- rbind(river_od_range1, river_od_range2, river_od_range3)
river_od_num <- c(as.numeric(unlist(river_od)))


# Read the first range of cells
river_temp_range1 <- read_excel(file_path, range = "B12:B27", col_names = FALSE)

# Read the second range of cells
river_temp_range2 <- read_excel(file_path, range = "B31:B44", col_names = FALSE)

# Read the third range of cells
river_temp_range3 <- read_excel(file_path, range = "B48:B59", col_names = FALSE)

river_temp <- rbind(river_temp_range1, river_temp_range2, river_temp_range3)
river_temp_num <- c(as.numeric(unlist(river_temp)))

plot(x=tap_od_num, y=tap_temp_num, main="Scatterplot of Tap OD and Temp", xlab="Tap OD data", ylab="Tap Temp Data")
tap_fit <- lm(tap_temp_num ~ tap_od_num)
abline(tap_fit,col='red')

plot(x=river_od_num, y=river_temp_num, main="Scatterplot of River OD and Temp", xlab="River OD data", ylab="River Temp Data")
river_fit <- lm(river_temp_num ~ river_od_num)
abline(river_fit,col='red')

tap_cor <- cor(tap_od_num, tap_temp_num)
river_cor <-cor(river_od_num, river_temp_num)
tap_cor
river_cor


# code for 3c
# # Are the pressure measurements related to the temperature or OD measurements in the Excel Öle (river
# or tap water)? Use scatterplots, correlations etc. to support your argument.

# Read the first range of cells
river_press_range1 <- read_excel(file_path, range = "C12:C27", col_names = FALSE)

# Read the second range of cells
river_press_range2 <- read_excel(file_path, range = "C31:C44", col_names = FALSE)

# Read the third range of cells
river_press_range3 <- read_excel(file_path, range = "C48:C59", col_names = FALSE)

river_press <- rbind(river_press_range1, river_press_range2, river_press_range3)
river_press_num <- c(as.numeric(unlist(river_press)))

od_to_press_fit <- lm(river_press_num ~ river_od_num)
plot(x=river_od_num, y=river_press_num, main="Scatterplot of River OD and Pressure", xlab="River OD data", ylab="River Temp Data")
abline(lm(river_press_num ~ river_od_num),col='red')

od_to_press_fit
press_cor <- cor(river_od_num, river_press_num, use = "complete.obs")
press_cor

