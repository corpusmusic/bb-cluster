library('ggplot2')
c1 <- read.csv('cluster_summaries/cluster1_1.csv')

library(reshape2)
c <- melt(c1, id.var="X")
colnames(c) <- c('start', 'arrival', 'rawProbability')

normalizeProb <- function(record)  {
  prob_sum <- sum(c[c$start==record['start'],]['rawProbability'])
  norm_sum <- as.numeric(record['rawProbability']) / prob_sum
  return(norm_sum)
}

probability <- apply(c, MARGIN = 1, normalizeProb)
c_normalized <- cbind(c, probability)
c_normalized$start <- factor(c_normalized$start, levels = 
              c('I', 'bII', 'II', 'bIII', 'III', 'IV', 'bV', 'V', 'bVI', 'VI', 'bVII', 'VII'))

ggplot(data = c_normalized, mapping = aes(x = start, y = probability, fill = arrival)) +
  geom_bar(stat = "identity") +
  xlab('Starting chord') +
  ylab('Probability') +
  ggtitle('Transitional probabilities') +
  guides(fill=guide_legend(title="Arrival chord")) +
  theme(plot.title = element_text(hjust = 0.5))
