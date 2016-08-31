from __future__ import print_function, division, absolute_import, unicode_literals
import csv
import numpy as np
import os
import scipy as sp
from sklearn.cluster import KMeans

# general parameters for project

maxClusters = 15 # algorithm will run from 1 cluster to this cardinality
outputFolder = 'cluster_output_data/' # where the output data will be stored
inertiaFile = 'inertia.csv' # where the inertia for each test is recorded

# custom functions needed for project

def read_data(filename):
    with open(filename, 'r') as csvf:
        return [row for row in csv.reader(csvf)]

def get_cluster(title):
    return clusterIdOfSong[title]

# create the array and song list needed for KMeans.fit

X = read_data("songbysongtransprob.csv") # array of first-order conditional probabilities of chord occurrence
Y = [] # list of song titles for indexing
for song in X:
    Y.append(song[0])
    song.pop(0)

inertiaData = {}

# Run the cluster analysis (km.fit)

K = 1 # number of clusters
while K <= maxClusters:
    km = KMeans(n_clusters = K, max_iter = 10000, n_init = 10000, n_jobs = -1, random_state = 42) # define the algorithm parameters
    km.fit(X,Y) # run cluster algorithm
    clusterName = 'cluster' + str(K)
    inertiaData[clusterName] = km.inertia_ # add within-cluster sum-of-squares for the solution to dictionary

    # assemble a dictionary containing the cluster membership
    # for each song in the corpus
    # write to file

    clusterIdOfSong = {}
    for title, cluster in zip(Y, km.labels_):
        clusterIdOfSong[title] = cluster

    csvfile = outputFolder + clusterName + '.csv' # filename identifies the number of clusters in the test
    with open(csvfile, 'w') as fout:
        writer = csv.writer(fout, lineterminator='\n')
        for title in clusterIdOfSong:
            writer.writerow((title, clusterIdOfSong[title]))

    # reset for next loop
    print(clusterName, 'completed.')
    K += 1

# write inertia data to file

csvfile = outputFolder + inertiaFile
with open(csvfile, 'w') as fout:
    writer = csv.writer(fout, lineterminator='\n')
    for clusterName in inertiaData:
        writer.writerow((clusterName, inertiaData[clusterName]))
