

# get CURRENT data formatted for joining to reference condition data

library(dplyr)
library(readr)

#remove decimals
options(digits = 0)
#prevent scientific notation in outputs
options(scipen = 999)

# read in combine data that has all of the current data from the ArcGIS combine of LANDFIRE Existing Vegetation Cover/Height/Type plus succession classes (a.k.a. seral states) and Biophysical Settings (historical ecosystems)
 
combine200s <- read_csv("rawData/combine200s.csv")  # this is essentially the "current data"

#View(combine200s)

# need to get rid of unwanted columns and isolate the succession classes for each BpS
BpSscl <- combine200s %>%
  group_by(BPS_MODEL, LABEL) %>%
  summarize(count = sum(COUNT))

## need percents of s-classes per BpS

current <- group_by(BpSscl, BPS_MODEL) %>% 
              mutate(percent = (count/sum(count))*100)

# cleanup columns-rename and drop
names(current)[names(current) == "percent"] <- "curPercent"

current <- subset(current, select = -c(count))


#write.csv(current, file = "current.csv")
