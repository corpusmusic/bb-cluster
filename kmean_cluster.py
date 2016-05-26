from __future__ import print_function, division, absolute_import, unicode_literals
import csv
import numpy as np
import os
import scipy as sp
from sklearn.cluster import KMeans

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


"""15 Cluster K-Means Analysis"""
K = 15 #number of clusters
km = KMeans(n_clusters = K, n_init = 10000)
km.fit(X,Y)

clusterIdOfSong = {}
for title, cluster in zip(Y, km.labels_):
    clusterIdOfSong[title] = cluster

"""Write temp file outputs"""

csvfile = 'chord_by_chord.csv'
with open(csvfile, 'rb') as fin, open('cluster_'+csvfile, 'wb') as fout:                #temp file for k = 6
    reader = csv.reader(fin, lineterminator='\n')
    writer = csv.writer(fout, lineterminator='\n')
    for song in reader:
        if len(song) > 0:
            song.append(get_cluster(song[0]))
            writer.writerow(song)

csvfile2 = 'songbysongtransprob.csv'
with open(csvfile2, 'rb') as fin, open('cluster_'+csvfile2, 'wb') as fout:              #temp file for k = 6
    reader = csv.reader(fin, lineterminator='\n')
    writer = csv.writer(fout, lineterminator='\n')
    for song in reader:
        if len(song) > 0:
            song.append(get_cluster(song[0]))
            writer.writerow(song)


"""6 Cluster K-Means Analysis"""
K = 6 #number of clusters
km = KMeans(n_clusters = K, n_init = 10000)
km.fit(X,Y)

clusterIdOfSong = {}
for title, cluster in zip(Y, km.labels_):
    clusterIdOfSong[title] = cluster


"""Write final file outputs with K=6 and K=15 cluster output appends"""

csvfile = 'cluster_chord_by_chord.csv'
with open(csvfile, 'rb') as fin, open('new_'+csvfile, 'wb') as fout:
    reader = csv.reader(fin, lineterminator='\n')
    writer = csv.writer(fout, lineterminator='\n')
    for song in reader:
        if len(song) > 0:
            song.append(get_cluster(song[0]))
            writer.writerow(song)

csvfile2 = 'cluster_songbysongtransprob.csv'
with open(csvfile2, 'rb') as fin, open('new_'+csvfile2, 'wb') as fout:
    reader = csv.reader(fin, lineterminator='\n')
    writer = csv.writer(fout, lineterminator='\n')
    for song in reader:
        if len(song) > 0:
            song.append(get_cluster(song[0]))
            writer.writerow(song)
