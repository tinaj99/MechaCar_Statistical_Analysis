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

# Run a t.test on all population
#t.test(log10(susp_data$PSI),mu=mean(log10(population_table$Miles_Driven))) #compare sample versus population means
t.test(susp_data$PSI, mu=1500) #compare sample versus population means

# Then use subset() to subset for each Manufacturing_Lot (there are 3 lots)
suspension_data <- read.csv("Suspension_Coil.csv",stringsAsFactors = F, check.names = F)

