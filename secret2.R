
#alternative to pivot long
library(readr)
refCon200 <- read_csv("rawData/refCon200.csv")
View(refCon200)

library(tidyverse)
install.packages("reshape2")
library(reshape2)
library('dplyr')

refconlong <- melt(refCon200, id.vars = c("Model_Code", "BpS_Name", "BpS_Code"))
  
  
# rename columns
# "variable" to "sclass"
# "value" to "refPercent"


names(refconlong)[names(refconlong) == "variable"] <- "sclass"
names(refconlong)[names(refconlong) == "value"] <- "refPercent"
names(refconlong)[names(refconlong) == "Model_Code"] <- "BPS_MODEL"
names(refconlong)[names(refconlong) == "sclass"] <- "LABEL"

# drop some columns
refconlong <- subset(refconlong, select = -c(BpS_Code))
