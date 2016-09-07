import fnmatch
from os import listdir
import csv


def write_csv(data, folder, filename):
    with open(folder + filename, 'w') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        for line in data:
            writer.writerow(line)


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

for cluster_key,cluster_value in solution.items():
    i = 1
    number_of_clusters = int(cluster_key.split('cluster')[1])
    while i <= number_of_clusters:
        output_filename = cluster_key + '_' + str(i) + '.csv'
        data_table = []
        header_row = ['song', 'I-I', 'I-bII', 'I-II', 'I-bIII', 'I-III', 'I-IV', 'I-bV', 'I-V', 'I-bVI', 'I-VI', 'I-bVII', 'I-VII', 'bII-I', 'bII-bII', 'bII-II', 'bII-bIII', 'bII-III', 'bII-IV', 'bII-bV', 'bII-V', 'bII-bVI', 'bII-VI', 'bII-bVII', 'bII-VII', 'II-I', 'II-bII', 'II-II', 'II-bIII', 'II-III', 'II-IV', 'II-bV', 'II-V', 'II-bVI', 'II-VI', 'II-bVII', 'II-VII', 'bIII-I', 'bIII-bII', 'bIII-II', 'bIII-bIII', 'bIII-III', 'bIII-IV', 'bIII-bV', 'bIII-V', 'bIII-bVI', 'bIII-VI', 'bIII-bVII', 'bIII-VII', 'III-I', 'III-bII', 'III-II', 'III-bIII', 'III-III', 'III-IV', 'III-bV', 'III-V', 'III-bVI', 'III-VI', 'III-bVII', 'III-VII', 'IV-I', 'IV-bII', 'IV-II', 'IV-bIII', 'IV-III', 'IV-IV', 'IV-bV', 'IV-V', 'IV-bVI', 'IV-VI', 'IV-bVII', 'IV-VII', 'bV-I', 'bV-bII', 'bV-II', 'bV-bIII', 'bV-III', 'bV-IV', 'bV-bV', 'bV-V', 'bV-bVI', 'bV-VI', 'bV-bVII', 'bV-VII', 'V-I', 'V-bII', 'V-II', 'V-bIII', 'V-III', 'V-IV', 'V-bV', 'V-V', 'V-bVI', 'V-VI', 'V-bVII', 'V-VII', 'bVI-I', 'bVI-bII', 'bVI-II', 'bVI-bIII', 'bVI-III', 'bVI-IV', 'bVI-bV', 'bVI-V', 'bVI-bVI', 'bVI-VI', 'bVI-bVII', 'bVI-VII', 'VI-I', 'VI-bII', 'VI-II', 'VI-bIII', 'VI-III', 'VI-IV', 'VI-bV', 'VI-V', 'VI-bVI', 'VI-VI', 'VI-bVII', 'VI-VII', 'bVII-I', 'bVII-bII', 'bVII-II', 'bVII-bIII', 'bVII-III', 'bVII-IV', 'bVII-bV', 'bVII-V', 'bVII-bVI', 'bVII-VI', 'bVII-bVII', 'bVII-VII', 'VII-I', 'VII-bII', 'VII-II', 'VII-bIII', 'VII-III', 'VII-IV', 'VII-bV', 'VII-V', 'VII-bVI', 'VII-VI', 'VII-bVII', 'VII-VII']
        data_table.append(header_row)
        for title,probabilities in transprob.items():
            if int(solution[cluster_key][title]) == i - 1:
                data_row = []
                data_row.append(title)
                for prob in probabilities:
                    data_row.append(prob)
                data_table.append(data_row)
        write_csv(data_table, 'cluster_tables/', output_filename)
        print(cluster_key, i)

        i += 1
