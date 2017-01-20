bb <- read.csv('new_cluster_songbysongtransprob.csv', header = FALSE)
summary(bb)
length(bb$V1)

###### K-Means Cluster = 6 ######

#K = 6, cluster 0      Circle of Fifths
cluster6_0 <- bb[which(bb$V147 == '0'),]
cluster6_0_avg = colMeans(cluster6_0[c(2:145)])
#Table creation
cluster6_0_matrix <- matrix(cluster6_0_avg, ncol=12,byrow=TRUE)
colnames(cluster6_0_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_0_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_0_matrix <- as.table(cluster6_0_matrix)
cluster6_0_matrix
plot(cluster6_0_matrix, main = "K=6 Cluster0, Transitional Probabilities: 1st Chord -> 2nd Chord", xlab = "1st Chord Root", ylab = "2nd Chord Root")
cluster6_0$V1


#K = 6, cluster 1     Blues
cluster6_1 <- bb[which(bb$V147 == '1'),]
cluster6_1_avg = colMeans(cluster6_1[c(2:145)])
#Table creation
cluster6_1_matrix <- matrix(cluster6_1_avg, ncol=12,byrow=TRUE)
colnames(cluster6_1_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_1_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_1_matrix <- as.table(cluster6_1_matrix)
cluster6_1_matrix
plot(cluster6_1_matrix, main = "K=6 Cluster, Transitional Probabilities: 1st Chord -> 2nd Chord", xlab = "1st Chord Root", ylab = "2nd Chord Root")
cluster6_1$V1

#K = 6, cluster 2    Random
cluster6_2 <- bb[which(bb$V147 == '2'),]
cluster6_2_avg = colMeans(cluster6_2[c(2:145)])
#Table creation
cluster6_2_matrix <- matrix(cluster6_2_avg, ncol=12,byrow=TRUE)
colnames(cluster6_2_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_2_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_2_matrix <- as.table(cluster6_2_matrix)
cluster6_2_matrix
plot(cluster6_2_matrix, main = "K=6 Cluster2, Transitional Probabilities: 1st Chord -> 2nd Chord", xlab = "1st Chord Root", ylab = "2nd Chord Root")

#K = 6, cluster 3     V & bVII -> IV -> I Plagal
cluster6_3 <- bb[which(bb$V147 == '3'),]
cluster6_3_avg = colMeans(cluster6_3[c(2:145)])
#Table creation
cluster6_3_matrix <- matrix(cluster6_3_avg, ncol=12,byrow=TRUE)
colnames(cluster6_3_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_3_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_3_matrix <- as.table(cluster6_3_matrix)
cluster6_3_matrix
plot(cluster6_3_matrix, main = "K=6 Cluster3, Transitional Probabilities: 1st Chord -> 2nd Chord", xlab = "1st Chord Root", ylab = "2nd Chord Root")
cluster6_3$V1

#K = 6, cluster 4     Classical/Doo-wop 
cluster6_4 <- bb[which(bb$V147 == '4'),]
cluster6_4_avg = colMeans(cluster6_4[c(2:145)])
#Table creation
cluster6_4_matrix <- matrix(cluster6_4_avg, ncol=12,byrow=TRUE)
colnames(cluster6_4_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_4_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_4_matrix <- as.table(cluster6_4_matrix)
plot(cluster6_4_matrix, main = "K=6 Cluster4, Transitional Probabilities: 1st Chord -> 2nd Chord", xlab = "1st Chord Root", ylab = "2nd Chord Root")
cluster6_4$V1

#K = 6, cluster 5     Modal or Rock_Tonal/minor pre-dom -> bVII/V -> I
cluster6_5 <- bb[which(bb$V147 == '5'),]
cluster6_5_avg = colMeans(cluster6_5[c(2:145)])
#Table creation
cluster6_5_matrix <- matrix(cluster6_5_avg, ncol=12,byrow=TRUE)
colnames(cluster6_5_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster6_5_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster6_5_matrix <- as.table(cluster6_5_matrix)
cluster6_5_matrix
plot(cluster6_5_matrix, main = "K=6 Cluster5, Transitional Probabilities: 1st Chord -> 2nd Chord", xlab = "1st Chord Root", ylab = "2nd Chord Root")
cluster6_5$V1






###### K-Means Cluster = 15 ######

#K = 15, cluster 0      50s (II->V->I)
cluster15_0 <- bb[which(bb$V146 == '0'),]
cluster15_0_avg = colMeans(cluster15_0[c(2:145)])
#Table creation
cluster15_0_matrix <- matrix(cluster15_0_avg, ncol=12,byrow=TRUE)
colnames(cluster15_0_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_0_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_0_matrix <- as.table(cluster15_0_matrix)
cluster15_0_matrix
plot(cluster15_0_matrix)
cluster15_0$V1

#K = 15, cluster 1      Classical I-IV-V-I
cluster15_1 <- bb[which(bb$V146 == '1'),]
cluster15_1_avg = colMeans(cluster15_1[c(2:145)])
#Table creation
cluster15_1_matrix <- matrix(cluster15_1_avg, ncol=12,byrow=TRUE)
colnames(cluster15_1_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_1_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_1_matrix <- as.table(cluster15_1_matrix)
cluster15_1_matrix
plot(cluster15_1_matrix)
cluster15_1$V1

#K = 15, cluster 2      Rotated doo-wop VI-IV-V-I? (I-V?)
cluster15_2 <- bb[which(bb$V146 == '2'),]
cluster15_2_avg = colMeans(cluster15_2[c(2:145)])
#Table creation
cluster15_2_matrix <- matrix(cluster15_2_avg, ncol=12,byrow=TRUE)
colnames(cluster15_2_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_2_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_2_matrix <- as.table(cluster15_2_matrix)
cluster15_2_matrix
plot(cluster15_2_matrix)
cluster15_2$V1

#K = 15, cluster 15_3     Plagal I-IV-I-IV-I...
cluster15_3 <- bb[which(bb$V146 == '3'),]
cluster15_3_avg = colMeans(cluster15_3[c(2:145)])
#Table creation
cluster15_3_matrix <- matrix(cluster15_3_avg, ncol=12,byrow=TRUE)
colnames(cluster15_3_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_3_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_3_matrix <- as.table(cluster15_3_matrix)
cluster15_3_matrix
plot(cluster15_3_matrix)
cluster15_3$V1

#K = 15, cluster 15_4     VI-II-I
cluster15_4 <- bb[which(bb$V146 == '4'),]
cluster15_4_avg = colMeans(cluster15_4[c(2:145)])
#Table creation
cluster15_4_matrix <- matrix(cluster15_4_avg, ncol=12,byrow=TRUE)
colnames(cluster15_4_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_4_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_4_matrix <- as.table(cluster15_4_matrix)
cluster15_4_matrix
plot(cluster15_4_matrix)
cluster15_4$V1

#K = 15, cluster 15_5     V-IV-I 
cluster15_5 <- bb[which(bb$V146 == '5'),]
cluster15_5_avg = colMeans(cluster15_5[c(2:145)])
#Table creation
cluster15_5_matrix <- matrix(cluster15_5_avg, ncol=12,byrow=TRUE)
colnames(cluster15_5_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_5_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_5_matrix <- as.table(cluster15_5_matrix)
cluster15_5_matrix
plot(cluster15_5_matrix)
cluster15_5$V1

#K = 15, cluster 15_6     I-bIII-IV-I
cluster15_6 <- bb[which(bb$V146 == '6'),]
cluster15_6_avg = colMeans(cluster15_6[c(2:145)])
#Table creation
cluster15_6_matrix <- matrix(cluster15_6_avg, ncol=12,byrow=TRUE)
colnames(cluster15_6_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_6_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_6_matrix <- as.table(cluster15_6_matrix)
cluster15_6_matrix
plot(cluster15_6_matrix)
cluster15_6$V1

#K = 15, cluster 15_7     Circle of Fifths I-IV-II-V
cluster15_7 <- bb[which(bb$V146 == '7'),]
cluster15_7_avg = colMeans(cluster15_7[c(2:145)])
#Table creation
cluster15_7_matrix <- matrix(cluster15_7_avg, ncol=12,byrow=TRUE)
colnames(cluster15_7_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_7_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_7_matrix <- as.table(cluster15_7_matrix)
cluster15_7_matrix
plot(cluster15_7_matrix)
cluster15_7$V1

#K = 15, cluster 15_8     Extended Plagal bIII-bVII-I
cluster15_8 <- bb[which(bb$V146 == '8'),]
cluster15_8_avg = colMeans(cluster15_8[c(2:145)])
#Table creation
cluster15_8_matrix <- matrix(cluster15_8_avg, ncol=12,byrow=TRUE)
colnames(cluster15_8_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_8_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_8_matrix <- as.table(cluster15_8_matrix)
cluster15_8_matrix
plot(cluster15_8_matrix)
cluster15_8$V1

#K = 15, cluster 15_9     Rock Authentic bVI-bVII-I
cluster15_9 <- bb[which(bb$V146 == '9'),]
cluster15_9_avg = colMeans(cluster15_9[c(2:145)])
#Table creation
cluster15_9_matrix <- matrix(cluster15_9_avg, ncol=12,byrow=TRUE)
colnames(cluster15_9_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_9_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_9_matrix <- as.table(cluster15_9_matrix)
cluster15_9_matrix
plot(cluster15_9_matrix)
cluster15_9$V1

#K = 15, cluster 15_10     II-V-bVII-IV-I
cluster15_10 <- bb[which(bb$V146 == '10'),]
cluster15_10_avg = colMeans(cluster15_10[c(2:145)])
#Table creation
cluster15_10_matrix <- matrix(cluster15_10_avg, ncol=12,byrow=TRUE)
colnames(cluster15_10_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_10_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_10_matrix <- as.table(cluster15_10_matrix)
cluster15_10_matrix
plot(cluster15_10_matrix)
cluster15_10$V1

#K = 15, cluster 15_11     Singer/Songwriter
cluster15_11 <- bb[which(bb$V146 == '11'),]
cluster15_11_avg = colMeans(cluster15_11[c(2:145)])
#Table creation
cluster15_11_matrix <- matrix(cluster15_11_avg, ncol=12,byrow=TRUE)
colnames(cluster15_11_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_11_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_11_matrix <- as.table(cluster15_11_matrix)
cluster15_11_matrix
plot(cluster15_11_matrix)
cluster15_11$V1

#K = 15, cluster 15_12     Blues
cluster15_12 <- bb[which(bb$V146 == '12'),]
cluster15_12_avg = colMeans(cluster15_12[c(2:145)])
#Table creation
cluster15_12_matrix <- matrix(cluster15_12_avg, ncol=12,byrow=TRUE)
colnames(cluster15_12_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_12_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_12_matrix <- as.table(cluster15_12_matrix)
cluster15_12_matrix
plot(cluster15_12_matrix)
cluster15_12$V1

#K = 15, cluster 15_13     Random/Distributed
cluster15_13 <- bb[which(bb$V146 == '13'),]
cluster15_13_avg = colMeans(cluster15_13[c(2:145)])
#Table creation
cluster15_13_matrix <- matrix(cluster15_13_avg, ncol=12,byrow=TRUE)
colnames(cluster15_13_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_13_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_13_matrix <- as.table(cluster15_13_matrix)
cluster15_13_matrix
plot(cluster15_13_matrix)
cluster15_13$V1

#K = 15, cluster 15_14     50's doo-wop I-VI-II-V
cluster15_14 <- bb[which(bb$V146 == '14'),]
cluster15_14_avg = colMeans(cluster15_14[c(2:145)])
#Table creation
cluster15_14_matrix <- matrix(cluster15_14_avg, ncol=12,byrow=TRUE)
colnames(cluster15_14_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
rownames(cluster15_14_matrix) <- c("I", "bII", "II", "bIII", "III", "IV", "bV", "V", "bVI", "VI", "bVII", "VII")
cluster15_14_matrix <- as.table(cluster15_14_matrix)
cluster15_14_matrix
plot(cluster15_14_matrix)
cluster15_14$V1

#####finish k=15