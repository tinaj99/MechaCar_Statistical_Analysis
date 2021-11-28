library(tidyverse)
library(dplyr)

# Deliverable 1
mecha_data <- read.csv ("MechaCar_mpg.csv")
susp_data <- read.csv("Suspension_Coil.csv")


# run a linear regression and a summary

model = lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_data)

summary (model)

# Deliverable 2
# Use summarize() function to get the mean, median, variance and SD of the suspension coil's PSI column

total_summary <- susp_data %>% summarize(Mean_PSI = mean(PSI), median_PSI = median(PSI), variance_PSI = var(PSI), sd_PSI = sd(PSI), .groups = 'keep') #create summary table

lot_summary <- susp_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI = mean(PSI), median_PSI = median(PSI), variance_PSI = var(PSI), sd_PSI = sd(PSI), .groups = 'keep') #create summary table

# Deliverable 3
# Using your knowledge of R, perform t-tests to determine if all manufacturing lots 
# and each lot individually are statistically different from the population mean of 
# 1,500 pounds per square inch.

# Run a t.test for the data across all Lots
t.test(log10(susp_data$PSI), mu=log10(1500)) #compare sample versus population mean of 1500

# Then use subset() to subset for each Manufacturing_Lot (there are 3 lots)
t.test(subset(log10(susp_data$PSI), susp_data$Manufacturing_Lot== 'Lot1'), mu=log10(1500))

t.test(subset(log10(susp_data$PSI), susp_data$Manufacturing_Lot== 'Lot2'), mu=log10(1500))

t.test(subset(log10(susp_data$PSI), susp_data$Manufacturing_Lot== 'Lot3'), mu=log10(1500))




