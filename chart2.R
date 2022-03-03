library(tidyverse)
trends <- read.csv("incarceration_trends.csv")
trends <-  trends %>% filter(!is.na(female_prison_adm_rate),
                             !is.na(male_prison_pop_rate)) 

trends %>% group_by(year) %>% summarise(female=mean(female_prison_adm_rate),
                                        male=mean(male_prison_adm_rate)) %>% 
  ggplot(aes(x=female, y=male)) +
  geom_point() + geom_smooth(method="lm",color="red") +
  labs(x="Average prison admission rate(female)",
       y="Average prison admission rate(male)",
       title="Relation of average prison admission rate between different gender")
