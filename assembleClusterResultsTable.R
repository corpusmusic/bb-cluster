# import meta data and individual cluster results

meta <- read.csv('song_metadata.csv')
cluster1 <- read.csv('cluster_output_data/cluster1.csv', header=FALSE)
colnames(cluster1) = c('song', 'c1')
cluster2 <- read.csv('cluster_output_data/cluster2.csv', header=FALSE)
colnames(cluster2) = c('song', 'c2')
cluster3 <- read.csv('cluster_output_data/cluster3.csv', header=FALSE)
colnames(cluster3) = c('song', 'c3')
cluster4 <- read.csv('cluster_output_data/cluster4.csv', header=FALSE)
colnames(cluster4) = c('song', 'c4')
cluster5 <- read.csv('cluster_output_data/cluster5.csv', header=FALSE)
colnames(cluster5) = c('song', 'c5')
cluster6 <- read.csv('cluster_output_data/cluster6.csv', header=FALSE)
colnames(cluster6) = c('song', 'c6')
cluster7 <- read.csv('cluster_output_data/cluster7.csv', header=FALSE)
colnames(cluster7) = c('song', 'c7')
cluster8 <- read.csv('cluster_output_data/cluster8.csv', header=FALSE)
colnames(cluster8) = c('song', 'c8')
cluster9 <- read.csv('cluster_output_data/cluster9.csv', header=FALSE)
colnames(cluster9) = c('song', 'c9')
cluster10 <- read.csv('cluster_output_data/cluster10.csv', header=FALSE)
colnames(cluster10) = c('song', 'c10')
cluster11 <- read.csv('cluster_output_data/cluster11.csv', header=FALSE)
colnames(cluster11) = c('song', 'c11')
cluster12 <- read.csv('cluster_output_data/cluster12.csv', header=FALSE)
colnames(cluster12) = c('song', 'c12')
cluster13 <- read.csv('cluster_output_data/cluster13.csv', header=FALSE)
colnames(cluster13) = c('song', 'c13')
cluster14 <- read.csv('cluster_output_data/cluster14.csv', header=FALSE)
colnames(cluster14) = c('song', 'c14')
cluster15 <- read.csv('cluster_output_data/cluster15.csv', header=FALSE)
colnames(cluster15) = c('song', 'c15')


# merge into one big data frame

cluster_results <- merge(meta,
                         cluster1, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster2, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster3, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster4, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster5, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster6, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster7, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster8, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster9, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster10, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster11, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster12, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster13, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster14, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

cluster_results <- merge(cluster_results,
                         cluster15, 
                         by.x = 'song', 
                         by.y = 'song', 
                         all.x = TRUE, 
                         all.y = FALSE)

# add 1 to each cluster, to start counting from 1 and match the article text

cluster_results$c1 <- cluster_results$c1 + 1
cluster_results$c2 <- cluster_results$c2 + 1
cluster_results$c3 <- cluster_results$c3 + 1
cluster_results$c4 <- cluster_results$c4 + 1
cluster_results$c5 <- cluster_results$c5 + 1
cluster_results$c6 <- cluster_results$c6 + 1
cluster_results$c7 <- cluster_results$c7 + 1
cluster_results$c8 <- cluster_results$c8 + 1
cluster_results$c9 <- cluster_results$c9 + 1
cluster_results$c10 <- cluster_results$c10 + 1
cluster_results$c11 <- cluster_results$c11 + 1
cluster_results$c12 <- cluster_results$c12 + 1
cluster_results$c13 <- cluster_results$c13 + 1
cluster_results$c14 <- cluster_results$c14 + 1
cluster_results$c15 <- cluster_results$c15 + 1

# save to file

write.csv(cluster_results, 'song_metadata_and_clusters.csv', row.names=FALSE)


#################### analysis

boxplot(cluster_results$year ~ cluster_results$c1)
boxplot(cluster_results$year ~ cluster_results$c2)
boxplot(cluster_results$year ~ cluster_results$c3)
boxplot(cluster_results$year ~ cluster_results$c4)
boxplot(cluster_results$year ~ cluster_results$c5)
boxplot(cluster_results$year ~ cluster_results$c6)
boxplot(cluster_results$year ~ cluster_results$c7)
boxplot(cluster_results$year ~ cluster_results$c8)
boxplot(cluster_results$year ~ cluster_results$c9)
boxplot(cluster_results$year ~ cluster_results$c10)
boxplot(cluster_results$year ~ cluster_results$c11)
boxplot(cluster_results$year ~ cluster_results$c12)
boxplot(cluster_results$year ~ cluster_results$c13)
boxplot(cluster_results$year ~ cluster_results$c14)
boxplot(cluster_results$year ~ cluster_results$c15)
