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

def get_cluster(title):
    return clusterIdOfSong[title]

X = read_data("songbysongtransprob.csv")
Y = []
for song in X:
    Y.append(song[0])
    song.pop(0)

K = 15 #number of clusters
km = KMeans(n_clusters = K)
km.fit(X,Y)

clusterIdOfSong = {}
for title, cluster in zip(Y, km.labels_):
    clusterIdOfSong[title] = cluster

csvfile = 'song_metadata.csv'
with open(csvfile, 'rb') as fin, open('new_'+csvfile, 'wb') as fout:
    reader = csv.reader(fin, lineterminator='\n')
    writer = csv.writer(fout, lineterminator='\n')
    for song in reader:
        print(song[0])
        song.append(get_cluster(song[0]))
        writer.writerow(song)
#code that prints cluster information and writes info to a CSV with title/cluster
#print(km.labels_)
#print(km.cluster_centers_[1])
#with open('song_cluster_kMeans.csv', 'wb') as csvfile:
#    writer = csv.writer(csvfile, delimiter=str(u','), quotechar=str(u'"'), quoting=csv.QUOTE_MINIMAL)
#
#    for title, cluster in zip(Y, km.labels_):
#        writer.writerow([title, cluster])
#    writer.writerow([])
