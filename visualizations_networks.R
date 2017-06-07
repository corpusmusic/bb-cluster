library(tidyverse)
library(Cairo)
library(igraph)
library(ggraph)
library(reshape2)
library(stringr)

build_file_name <- function(number, solution) {
  return(paste('cluster', solution, '_', number, sep = ''))
}

generate_file_name_list <- function(cardinality) {
  name_list <- sapply(1:cardinality, build_file_name, cardinality)
}

savePlotPNG <- function(solution) {
  c_normalized <- read_csv(paste('cluster_summaries/', solution, '.csv', sep='')) %>%
    rename(start = X1) %>%
    gather(2:13, key = 'arrival', value = 'raw_prob') %>%
    group_by(start) %>%
    mutate(raw_prob_total = sum(raw_prob)) %>%
    ungroup() %>%
    mutate(probability = raw_prob / raw_prob_total) %>%
    select(-raw_prob, -raw_prob_total)
  
  set.seed(2017)

  network <- c_normalized %>%
    filter(probability >= .35) %>%
    graph_from_data_frame()

  g <- ggraph(network, layout = 'fr') +
    geom_edge_fan(aes(edge_alpha = probability), 
                   show.legend = FALSE, 
                   arrow = arrow(length = unit(3, 'mm')), 
                   start_cap = circle(4, 'mm'), 
                   end_cap = circle(4, 'mm')) + 
    #geom_node_point(color = 'lightskyblue2',
    #                size = 3) +
    geom_node_text(aes(label = name)) +
    theme_void() 
  
  ggsave(filename = paste('plots_networks/', solution, '.png', sep=''), 
         plot = g,
         device = 'png', 
         width = 4, 
         height = 3, 
         units = 'in', 
         dpi=300)
}

solutions <- unlist(sapply(1:15, generate_file_name_list))

sapply(solutions, savePlotPNG)


#############

set.seed(2017)

# import all files into one tibble

cluster_data <- tibble()

for (filename in solutions) {
  cluster_data <- bind_rows(cluster_data,
            read_csv(paste('cluster_summaries/', filename, '.csv', sep='')) %>%
              mutate(solution = filename) %>%
              rename(start = X1))
}

for (card_num in 1:15) {
  g <- cluster_data %>%
    gather(2:13, key = 'arrival', value = 'raw_prob') %>%
    group_by(start, solution) %>%
    mutate(raw_prob_total = sum(raw_prob)) %>%
    ungroup() %>%
    mutate(probability = raw_prob / raw_prob_total,
           cardinality = str_sub(solution, 8, 9) %>%
             str_replace_all('_', ''),
           cluster = str_sub(solution, -2, -1) %>%
             str_replace_all('_', '')) %>%
    select(start, arrival, probability, cardinality, cluster) %>%
    filter(probability >= .35,
           cardinality == card_num) %>%
    graph_from_data_frame() %>%
    ggraph(layout = 'fr') +
    geom_edge_fan(aes(edge_alpha = probability), 
                  show.legend = FALSE, 
                  arrow = arrow(length = unit(3, 'mm')), 
                  start_cap = circle(4, 'mm'), 
                  end_cap = circle(4, 'mm')) + 
    geom_node_text(aes(label = name)) +
    theme_graph() +
    th_foreground(foreground = 'grey80', border = TRUE) +
    facet_edges(~cluster) +
    ggtitle(str_c(card_num, '-cluster solution'))
  
  ggsave(filename = str_c('plots_networks/cardinality_', card_num, '.png'), 
         plot = g,
         device = 'png', 
         width = 15, 
         height = 9, 
         units = 'in', 
         dpi=300)
  
}
