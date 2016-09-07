import fnmatch
from os import listdir
import csv

def read_data(filename):
    return data


# Generate dictionary containing all clustering solutions: solution[]
# solution['cluster10']['SongTitle']
# returns the cluster number of the song (0-9) SongTitle in the 10-cluster solution

cluster_directory = 'cluster_output_data/'
cluster_files = []
solution = {}

for file in listdir(cluster_directory):
    if fnmatch.fnmatch(file, 'cluster*.csv'):
        cluster_files.append(file)

for file in cluster_files:
    with open(cluster_directory + file, 'r') as csvf:
        data = {}
        csv_data = csv.reader(csvf)
        for row in csv_data:
            data[row[0]] = row[1]
        solution[file.split('.')[0]] = data


# Import the song-by-song transitional probability table from songbysongtransprob.csv
# Make into a dictionary: transprob[]
# transprob['SongTitle'] returns a 144-member list of probabilities
# I-I, I-bII, I-II, ... VII-VII

with open('songbysongtransprob.csv', 'r') as csvf:
    transprob = {}
    csv_data = csv.reader(csvf)
    for row in csv_data:
        transprob[row.pop(0)] = row
