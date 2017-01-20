source_folder <- 'cluster_tables/'
output_folder <- 'cluster_summaries/'
cluster_files <- list()

for (i in 1:15) {
  for (j in 1:i) {
    cluster_files <- c(cluster_files, paste('cluster', i, '_', j, '.csv', sep = ''))
  }
}

create_mean_table <- function(filename) {
  d <- read.csv(paste(source_folder, filename, sep=''))
  cm <- colMeans(d[c(2:145)])
  cmtable <- data.frame()
  cmtable <- rbind(cm[c(1:12)], cm[c(13:24)], cm[c(25:36)], cm[c(37:48)], cm[c(49:60)], cm[c(61:72)], cm[c(73:84)], cm[c(85:96)], cm[c(97:108)], cm[c(109:120)], cm[c(121:132)], cm[c(133:144)])
  rn <- c('I', 'bII', 'II', 'bIII', 'III', 'IV', 'bV', 'V', 'bVI', 'VI', 'bVII', 'VII')
  rownames(cmtable) <- rn
  colnames(cmtable) <- rn
  write.csv(cmtable, file = paste(output_folder, filename, sep=''))
}

lapply(cluster_files, create_mean_table)