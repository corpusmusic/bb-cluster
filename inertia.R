library(Cairo)
library(tidyverse)

t <- read_csv('inertia.csv')

p <- t %>%
  ggplot(aes(clusters, inertia, fill = clusters)) +
  geom_col() +
  xlab('Number of clusters') +
  ylab('Inertia') +
  theme(legend.position = 'none') +
  ggtitle('Inertia value for each clustering solution') +
  theme(plot.title = element_text(hjust = 0.5))

ggsave(filename = 'plots/inertia_smooth.png', 
       plot = p,
       device = 'png', 
       width = 8, 
       height = 5, 
       units = 'in', 
       dpi=300)
