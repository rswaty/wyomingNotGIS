
#merge refconlong and current together 

# what about a simple "bind" from dplyr?
library(tidyverse)

# first change column name of one to match the other


inner <- inner_join(refconlong, current)
innerOther <- inner_join(current, refconlong)

left <- left_join(current, refconlong)
#close!





