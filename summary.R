library(tidyverse)
trends <- read_csv("incarceration_trends.csv")
trends <-  trends %>% filter(!is.na(female_prison_adm_rate),
                             !is.na(male_prison_pop_rate)) 
stats <- trends %>% 
  summarise(
    female.max=max(female_prison_adm_rate),
    female.min=min(female_prison_adm_rate),
    female.median=median(female_prison_adm_rate),
    female.mean=mean(female_prison_adm_rate),
    male.max=max(male_prison_adm_rate),
    male.min=min(male_prison_adm_rate),
    male.median=median(male_prison_adm_rate),
    male.mean=mean(male_prison_adm_rate)
  )
