library(tidyverse)
trends <- read.csv("incarceration_trends.csv")
trends <-  trends %>% filter(!is.na(female_prison_adm_rate),
                             !is.na(male_prison_pop_rate)) 

trends %>% group_by(year) %>% summarise(female=mean(female_prison_adm_rate),
                                        male=mean(male_prison_adm_rate)) %>% 
  gather(key=gender, value=rate, -year) %>%
  ggplot(aes(x=year, y=rate, color=gender)) +
  geom_line() +
  labs(x="Year", y="Average Prison Admission Rate", color="Gender",
       title="Trend of prison admission rate for different gender")
