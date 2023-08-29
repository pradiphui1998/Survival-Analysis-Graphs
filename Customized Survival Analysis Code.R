library(haven) #For importing STATA files.
library(survival)

url <- "http://web1.sph.emory.edu/dkleinb/allDatasets/surv2datasets/addicts.dta"

addicts <- data.frame(read_dta(url))

addicts$id <- as.numeric(addicts$id)
addicts$clinic <- as.factor(addicts$clinic)
addicts$status <- as.numeric(addicts$status)
addicts$survt <- as.numeric(addicts$survt)
addicts$prison <- as.numeric(addicts$prison)
addicts$dose <- as.numeric(addicts$dose)





library(ggplot2)
library(ggfortify)

model_fit <- survfit(Surv(survt, status) ~ clinic, data = addicts)

autoplot(model_fit) + 
  labs(x = "\n Survival Time (Days) ", y = "Survival Probabilities \n", 
       title = "Survival Times Of \n Methadone Patients \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="#FF7A33", size = 12),
        axis.title.y = element_text(face="bold", colour="#FF7A33", size = 12),
        legend.title = element_text(face="bold", size = 10))
