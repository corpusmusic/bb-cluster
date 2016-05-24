bb <- read.csv('new_cluster_songbysongtransprob.csv', header = FALSE)
summary(bb)
length(bb$V1)
bb[bb$V1 == 'TheRose',] 

###### K-Means Cluster = 6 ######

#K = 6, cluster 0      Classical?
cluster6_0 <- bb[which(bb$V147 == '0'),]
summary(cluster6_0)
length(cluster6_0)
cluster6_0_avg = colMeans(cluster6_0[c(2:145)])
plot(cluster6_0_avg)
    #Table creation
cluster6_0_matrix <- matrix(cluster6_0_avg, ncol=12,byrow=TRUE)
colnames(cluster6_0_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_0_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_0_matrix <- as.table(cluster6_0_matrix)
cluster6_0_matrix
plot(cluster6_0_matrix)
cluster6_0$V1


#K = 6, cluster 1     Plagal?
cluster6_1 <- bb[which(bb$V147 == '1'),]
summary(cluster6_1)
length(cluster6_1)
cluster6_1_avg = colMeans(cluster6_1[c(2:145)])
plot(cluster6_1_avg)
#Table creation
cluster6_1_matrix <- matrix(cluster6_1_avg, ncol=12,byrow=TRUE)
colnames(cluster6_1_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_1_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_1_matrix <- as.table(cluster6_1_matrix)
cluster6_1_matrix
plot(cluster6_1_matrix)
cluster6_1$V1

#K = 6, cluster 2    Circle of Fifths?
cluster6_2 <- bb[which(bb$V147 == '2'),]
summary(cluster6_2)
length(cluster6_2)
cluster6_2_avg = colMeans(cluster6_2[c(2:145)])
plot(cluster6_2_avg)
#Table creation
cluster6_2_matrix <- matrix(cluster6_2_avg, ncol=12,byrow=TRUE)
colnames(cluster6_2_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_2_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_2_matrix <- as.table(cluster6_2_matrix)
cluster6_2_matrix
plot(cluster6_2_matrix)

#K = 6, cluster 3
cluster6_3 <- bb[which(bb$V147 == '3'),]
summary(cluster6_3)
length(cluster6_3)
cluster6_3_avg = colMeans(cluster6_3[c(2:145)])
plot(cluster6_3_avg)
#Table creation
cluster6_3_matrix <- matrix(cluster6_3_avg, ncol=12,byrow=TRUE)
colnames(cluster6_3_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_3_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_3_matrix <- as.table(cluster6_3_matrix)
cluster6_3_matrix
plot(cluster6_3_matrix)

#K = 6, cluster 4     bVII-> IV,  I->IV, little V..... look up songs, double plagal (bVII -> IV -> I)?
cluster6_4 <- bb[which(bb$V147 == '4'),]
summary(cluster6_4)
length(cluster6_4)
cluster6_4_avg = colMeans(cluster6_4[c(2:145)])
plot(cluster6_4_avg)
#Table creation
cluster6_4_matrix <- matrix(cluster6_4_avg, ncol=12,byrow=TRUE)
colnames(cluster6_4_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_4_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_4_matrix <- as.table(cluster6_4_matrix)
plot(cluster6_4_matrix)
cluster6_4$V1

#K = 6, cluster 5     everything -> I, tonic lovers (: ...?  look up songs
cluster6_5 <- bb[which(bb$V147 == '5'),]
summary(cluster6_5)
length(cluster6_5)
cluster6_5_avg = colMeans(cluster6_5[c(2:145)])
plot(cluster6_5_avg)
#Table creation
cluster6_5_matrix <- matrix(cluster6_5_avg, ncol=12,byrow=TRUE)
colnames(cluster6_5_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_5_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_5_matrix <- as.table(cluster6_5_matrix)
cluster6_5_matrix
plot(cluster6_5_matrix)


###### K-Means Cluster = 15 ######

#K = 15, cluster 0      Classical? 50s? (II->V->I)
cluster15_0 <- bb[which(bb$V146 == '0'),]
summary(cluster15_0)
length(cluster15_0)
cluster15_0_avg = colMeans(cluster15_0[c(2:145)])
plot(cluster15_0_avg)
#Table creation
cluster15_0_matrix <- matrix(cluster15_0_avg, ncol=12,byrow=TRUE)
colnames(cluster15_0_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_0_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_0_matrix <- as.table(cluster15_0_matrix)
cluster15_0_matrix <- as.table(cluster15_0_matrix)
cluster15_0_matrix
plot(cluster15_0_matrix)
cluster15_0$V1

#K = 15, cluster 1      Classical?
cluster15_1 <- bb[which(bb$V146 == '1'),]
summary(cluster15_1)
length(cluster15_1)
cluster15_1_avg = colMeans(cluster15_1[c(2:145)])
plot(cluster15_1_avg)
#Table creation
cluster15_1_matrix <- matrix(cluster15_1_avg, ncol=12,byrow=TRUE)
colnames(cluster15_1_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_1_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_1_matrix <- as.table(cluster15_1_matrix)
cluster15_1_matrix <- as.table(cluster15_1_matrix)
cluster15_1_matrix
plot(cluster15_1_matrix)
cluster15_1$V1

#K = 15, cluster 2      Random?
cluster15_2 <- bb[which(bb$V146 == '2'),]
summary(cluster15_2)
length(cluster15_2)
cluster15_2_avg = colMeans(cluster15_2[c(2:145)])
plot(cluster15_2_avg)
#Table creation
cluster15_2_matrix <- matrix(cluster15_2_avg, ncol=12,byrow=TRUE)
colnames(cluster15_2_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_2_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_2_matrix <- as.table(cluster15_2_matrix)
cluster15_2_matrix <- as.table(cluster15_2_matrix)
cluster15_2_matrix
plot(cluster15_2_matrix)
cluster15_2$V1

#####finish k=15