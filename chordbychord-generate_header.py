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
    header = ['song', 'artist', 'year', 'meter', 'leadSheet', 'chrRoot', 'roman', 'quality', 'cluster15'] #add gaussian when ready
    outputdata.append(header)
    for line in inputdata:
        outputdata.append(line)

    write_csv(outputdata, 'chord_by_chord_with_clusters.csv')
