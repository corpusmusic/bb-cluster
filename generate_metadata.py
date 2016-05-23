from __future__ import division

from collections import defaultdict
from operator import itemgetter
from readdata import read_data
import csv
import sys


def read_data(filename):
    with open(filename, 'r') as csvf:
        return [row for row in csv.reader(csvf)]


def write_csv(data, filename):
    with open(filename, 'w') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        for line in data:
            writer.writerow(line)


if __name__ == '__main__':
    try:
        datafile = sys.argv[1]
    except:
        datafile = 'new_chord_by_chord.csv'

    inputdata = read_data(datafile)
    outputdata = []
    uniquesongs = []
    header = ['song', 'artist', 'year', 'meter', 'cluster15'] #add gaussian when ready
    outputdata.append(header)
    for line in inputdata:
        if line[0] not in uniquesongs:
            uniquesongs.append(line[0])
            songmeta = [line[0], line[1], line[2], line[3], line[8]] # add line[9] when gaussian is ready
            outputdata.append(songmeta)

    write_csv(outputdata, 'metadata_with_clusters.csv')
