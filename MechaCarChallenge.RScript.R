# Deliverable 1 

library(dplyr)

mechacarmpg <- read.csv(file='./Desktop/Bootcamp/Module_15/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacarmpg)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacarmpg))

lm(mpg ~ vehicle_length + ground_clearance, data=mechacarmpg)
summary(lm(mpg ~ vehicle_length + ground_clearance, data=mechacarmpg)) 

# Deliverable 2 

mechacarsuspension <- read.csv(file='./Desktop/Bootcamp/Module_15/Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

total_summary <- mechacarsuspension %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          Std_Dev_PSI=sd(PSI),
                                          Num_Coil=n(), .groups = 'keep') 

lot_summary <- mechacarsuspension  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         Std_Dev_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep') 


# Deliverable 3

t.test(mechacarsuspension$PSI,mu=1500)

t.test(subset(mechacarsuspension, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(mechacarsuspension, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(mechacarsuspension, Manufacturing_Lot=="Lot3")$PSI, mu=1500)

