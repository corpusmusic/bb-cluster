library('ggplot2')
library(reshape2)

build_file_name <- function(number, solution) {
  return(paste('cluster', solution, '_', number, sep = ''))
}

generate_file_name_list <- function(cardinality) {
  name_list <- sapply(1:cardinality, build_file_name, cardinality)
}

savePlotPNG <- function(solution) {
  normalizeProb <- function(record)  {
    prob_sum <- sum(c[c$start==record['start'],]['rawProbability'])
    norm_sum <- as.numeric(record['rawProbability']) / prob_sum
    return(norm_sum)
  }
  
  c1 <- read.csv(paste('cluster_summaries/', solution, '.csv', sep=''))
  c <- melt(c1, id.var="X")
  colnames(c) <- c('start', 'arrival', 'rawProbability')
  
  probability <- apply(c, MARGIN = 1, normalizeProb)
  c_normalized <- cbind(c, probability)
  c_normalized$start <- factor(c_normalized$start, levels = 
                                 c('I', 'bII', 'II', 'bIII', 'III', 'IV', 'bV', 'V', 'bVI', 'VI', 'bVII', 'VII'))
  
  png(filename = paste('plots/', solution, '.png', sep=''), width=1200, height=500)
  
  g <- ggplot(data = c_normalized, mapping = aes(x = start, y = probability, fill = arrival)) +
    geom_bar(stat = "identity") +
    xlab('Starting chord') +
    ylab('Probability') +
    ggtitle('Transitional probabilities') +
    guides(fill=guide_legend(title="Arrival chord")) +
    theme(plot.title = element_text(hjust = 0.5))
  
  print(g)
  dev.off()
}

solutions <- unlist(sapply(1:15, generate_file_name_list))

sapply(solutions, savePlotPNG)

savePlotPNG('cluster2_1')
