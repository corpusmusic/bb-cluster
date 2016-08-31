from __future__ import print_function, division, absolute_import, unicode_literals
import csv
import numpy as np
import os
import scipy as sp
from sklearn.cluster import KMeans

# For computing distances between songs for visualization

import itertools
from scipy.spatial import distance
import math

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

X_mat = np.array(X, dtype = np.float)
print(X_mat.shape)


# create an empty dictionary in which to put inertia data for each clustering solution

inertiaData = {}

# Run the cluster analysis (km.fit)

K = 1 # number of clusters
while K <= maxClusters:
    km = KMeans(n_clusters = K, max_iter = 10000, n_init = 10000, n_jobs = -1, random_state = 42) # define the algorithm parameters
    km.fit(X_mat) # run cluster algorithm
    clusterName = 'cluster' + str(K)
    inertiaData[clusterName] = km.inertia_ # add within-cluster sum-of-squares for the solution to dictionary

    # Add center clusters to X, Y so that we can visualize them on the graph

    clusterNameList = []
    for i in range(0,K):
        clusterNameList.append('CLUSTER' + str(i))
    Y = Y + clusterNameList
    X =  np.concatenate((X_mat,km.cluster_centers_), axis = 0)

    # Define dictionary of song names and song indices (for graphs)

    song_dict = dict()
    for i in range(0, len(Y)):
        song_dict[Y[i]] = X[i]

    song_index = dict()
    for i in range(0, len(Y)):
        song_index[Y[i]] = i

    for j in range(0,K):
        song_index['CLUSTER' + str(j)] = i + j + 1

    # Compute distances between every two songs

    pairs_cosine = dict()
    pairs_euclidean = dict()

    counter = 0
    for song_pair in itertools.combinations(Y, 2):
        pairs_cosine[song_pair] = distance.cosine(song_dict[song_pair[0]],song_dict[song_pair[1]])
        pairs_euclidean[song_pair] = distance.euclidean(song_dict[song_pair[0]],song_dict[song_pair[1]])
        counter += 1
    print('Number of pairs: ' + str(counter))

    # Normalize euclidean distances to 0-1 range

    max_dist = max(pairs_euclidean.values())
    min_dist = min(pairs_euclidean.values())

    def min_max_scaler(x, min_, max_):
        return (x-min_)/(max_-min_)

    # Filter out NaN distances and scale to range 0-1 (only needed with Euclidean distance)

    graph_cosine = pairs_cosine.items()
    graph_cosine = [i for i in graph_cosine if math.isnan(i[1]) == False]
    graph_euclidean = pairs_euclidean.items()
    graph_euclidean = [(i[0], min_max_scaler(i[1], min_dist, max_dist)) for i in graph_euclidean if math.isnan(i[1]) == False]

    # Plot distribution of distances

    plt.figure(figsize=(10,5))
    plt.ylabel('Number of distance pairs')
    plt.xlabel('Distance')
    plt.title('Histogram of cosine distance pairs')
    plt.hist([i[1] for i in graph_cosine], bins = 50, color = 'green')
    plt.show()

    plt.figure(figsize=(10,5))
    plt.ylabel('Number of distance pairs')
    plt.xlabel('Distance')
    plt.title('Histogram of euclidean distance pairs')
    plt.hist([i[1] for i in graph_euclidean], bins = 50, color = 'green')
    plt.show()

    # Manually create JSON file

    json_nodes = '''"nodes": [''' + '\n'
    for title, cluster in zip(Y, km.labels_):
        json_nodes += '''{"id": "''' + title + '''", "group": ''' + str(cluster) + '''},''' + '\n'

    json_nodes = json_nodes[:-2] + '\n'+ ''']'''

    # Links using cosine distance

    json_links = '''"links": [''' + '\n'
    for song_pair, dist in graph_cosine:
        if dist < 0.9:
            json_links += '\t' + '''{"source": ''' + str(song_index[song_pair[0]]) + ''', "target": ''' + str(song_index[song_pair[1]]) + ''', "value": ''' + str(dist) + '''},''' + '\n'
    json_links = json_links[:-2] + '\n'+ ''']'''

    json_string = '''{''' + json_nodes + ''',''' + json_links + '''}'''

    text_file = open("graph_cosine.json", "w")
    text_file.write(json_string)
    text_file.close()

    # Links using euclidean distance
    
    json_links = '''"links": [''' + '\n'
    for song_pair, dist in graph_euclidean:
        if dist < 0.9:
            json_links += '\t' + '''{"source": ''' + str(song_index[song_pair[0]]) + ''', "target": ''' + str(song_index[song_pair[1]]) + ''', "value": ''' + str(dist) + '''},''' + '\n'
    json_links = json_links[:-2] + '\n'+ ''']'''

    json_string = '''{''' + json_nodes + ''',''' + json_links + '''}'''

    text_file = open("graph_euclidean.json", "w")
    text_file.write(json_string)
    text_file.close()

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
