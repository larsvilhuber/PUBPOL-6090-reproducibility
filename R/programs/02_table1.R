# This file creates Table 1 in the paper.  
# Author: Lars Vilhuber 


library(dplyr)
library(knitr)
library(haven)

pumsak <- read_dta(dtam) %>%
    count(specific_ak, wt = pweight_num) %>%
    mutate(Tribes = factor(specific_ak,
                                labels = c("Not identified",
                                           "Identified with one of the four tribes"))
    ) %>%
    select(Tribes,n) -> table
  
  # output the table to latex 

sink(file="..\tables\freq_specific_ak.tex")
table %>% kable(format="latex")
sink()
