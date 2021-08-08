#A. import MechaCar dataset
MpgCar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MpgCar) 

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MpgCar)) 

#Correlation matrix for MechaCar dataset
#convert data frame into numeric matrix
MCar_matrix <- as.matrix(MpgCar[,c("vehicle_length","vehicle_weight","spoiler_angle","ground_clearance","AWD", "mpg")]) #convert data frame into numeric matrix
cor(MCar_matrix)

#B. Import Suspension_Coil dataset
SCoil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#Create summary table with multiple columns
summarize_Scoil <- SCoil%>%summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD= sd(PSI), .groups = 'keep') 
#Create summary table with multiple columns
summarize_Scoil2 <- SCoil %>% group_by(Manufacturing_Lot)%>%summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD= sd(PSI), .groups = 'keep') 


#C. T-Test
# Test statistically different from the miles driven in sample vs population data
t.test(SCoil$PSI, mu=1500) #compare sample versus population means

filter_SCoil1 <- subset(SCoil, Manufacturing_Lot == "Lot1") #filter by Lot1
filter_SCoil2 <- subset(SCoil, Manufacturing_Lot == "Lot2") #filter by Lot2
filter_SCoil3 <- subset(SCoil, Manufacturing_Lot == "Lot3") #filter by Lot2

t.test(filter_SCoil1$PSI, mu=1500) #compare the mean difference lot1 vs population mean
t.test(filter_SCoil2$PSI, mu=1500) #compare the mean difference lot2 vs population mean
t.test(filter_SCoil3$PSI, mu=1500) #compare the mean difference lot3 vs population mean
