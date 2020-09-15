#Life expectancy in years Central America 

library(gapminder)
library(tidyverse)
library(ggplot2)
library(gganimate)


gapminder%>%
  filter(country%in% c("Nicaragua","Costa Rica", "Honduras", "Guatemala", "El Salvador", "Panama"))%>%   
  ggplot(aes(x=year,
             y=lifeExp,
             color=country))+
  scale_y_continuous(limits = c(40,80))+
  geom_line(size=2)+
  geom_point(size=4)+
  labs(title="Life expectancy (years) {frame_along}",
       subtitle = "Central America 1952-2007",
       caption= "Source: Gapminder | Design: Gersán Vásquez Gutiérrez",
       x=NULL,
       y="Years")+
  facet_wrap(~country) +
  theme_minimal()+
  theme(legend.position = "none",
        plot.title=element_text(size = 16, face="bold"),
       plot.subtitle=element_text(face="italic", size=12, margin=margin(b=12)))+
  transition_reveal(year)
#save graph
ggsave("lifeexpca.gif")
