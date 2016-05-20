from __future__ import print_function, division, absolute_import, unicode_literals
import csv
import numpy as np
import os
import scipy as sp
from sklearn.cluster import KMeans

#open transition prob csv file
#with open('songbysongtransprob.csv','rb') as csvf:
#    rows = csv.reader(csvf)
#    for row in rows:
#        print row
        
def read_data(filename):
    with open(filename, 'rB') as csvf:
        return [row for row in csv.reader(csvf)]

X = read_data("songbysongtransprob.csv")
Y = []
for song in X:
    Y.append(song[0])
    song.pop(0)
    
K = 15 #number of clusters
km = KMeans(n_clusters = K)
km.fit(X,Y)
#print(km.labels_)
#print(km.cluster_centers_[1])
with open('song_cluster_kMeans.csv', 'wb') as csvfile:
    writer = csv.writer(csvfile, delimiter=str(u','), quotechar=str(u'"'), quoting=csv.QUOTE_MINIMAL)
    	
    for title, cluster in zip(Y, km.labels_):
        writer.writerow([title, cluster])
    writer.writerow([])