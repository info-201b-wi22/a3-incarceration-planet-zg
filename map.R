library(maps)
library(tidyverse)
trends <- read_csv("incarceration_trends.csv")
ny2015 <-  trends %>% filter(state=="NY") %>% filter(year==2015) %>% 
  filter(!is.na(female_prison_adm_rate)) %>%
  select(fips, county_name, female_prison_adm_rate)

fips <- county.fips  %>% separate(polyname, into=c("state", "subregion"), sep=",") %>%
  filter(state=="new york")
fips <- fips[!duplicated(fips$fips), ]
ny2015 <- left_join(ny2015, fips)


ny.county <- map_data("county") %>% filter(region=="new york")
data  <- left_join(ny.county, ny2015)
p <- ggplot(data, aes(x=long, y=lat, fill=female_prison_adm_rate, group=subregion)) + 
  geom_polygon() +
  scale_fill_distiller(palette = "YlGn") + theme_light() +
  labs(x="", y="", title="Prison Admission Rate Of Female (2015)", fill="Admission Rate")+
  theme_minimal()
plotly::ggplotly(p)