

# get current data formatted for joining to reference condition data

library(dplyr)
library(readr)

# read in combine data that has all of the current data from the ArcGIS combine of LANDFIRE Existing Vegetation Cover/Height/Type plus succession classes (a.k.a. seral states) and Biophysical Settings (historical ecosystems)

combine200s <- read_csv("rawData/combine200s.csv")
View(combine200s)

BpSscl <- combine200s %>%
  group_by(BPS_MODEL, LABEL) %>%
  summarize(count = sum(COUNT))

## need percents of s-classes per BpS

options(scipen = 999)       

current <- group_by(BpSscl, BPS_MODEL) %>% 
              mutate(percent = (count/sum(count))*100)

# cleanup columns-rename and drop
names(current)[names(current) == "percent"] <- "curPercent"

current <- subset(current, select = -c(count))


#write.csv(current, file = "current.csv")
