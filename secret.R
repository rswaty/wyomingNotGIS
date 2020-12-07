
library(dplyr)

BpSscl <- combine200s %>%
  group_by(BPS_MODEL, LABEL) %>%
  summarize(count = sum(COUNT))

## need percents of s-classes per BpS

options(scipen = 999)       

wpercents <- group_by(BpSscl, BPS_MODEL) %>% 
              mutate(percent = (count/sum(count))*100)

write.csv(wpercents, file = "testPercents.csv")
