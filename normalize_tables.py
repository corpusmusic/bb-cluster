import csv
from os import listdir
import fnmatch

cluster_directory = 'cluster_summaries/'
cluster_files = []

for file in listdir(cluster_directory):
    if fnmatch.fnmatch(file, 'cluster*.csv'):
        cluster_files.append(file)

def read_text_file(filename):
    f = open(filename)
    table_original = []
    for line in f:
        table_original.append(line.rstrip('\n'))
    return table_original

def read_csv_file(filename):
    with open(filename, 'r') as csvf:
        csv_data = csv.reader(csvf)
        table_original = []
        for line in csv_data:
            table_original.append(line)
        return table_original

def normalize_row(table_row):
    head = table_row.pop(0)
    table_row_float = []
    for item in table_row:
        table_row_float.append(float(item))
    row_sum = sum(table_row_float)
    normalized = []
    normalized.append(head)
    for item in table_row:
        if row_sum != 0:
            normalized.append(round(float(item)/row_sum, 3))
        else:
            normalized.append(0)
    return normalized

def convert_table_line_to_markdown(table_row):
    row_string = '|'
    for item in table_row:
        row_string += ' '
        row_string += str(item)
        row_string += ' |'
    return row_string

header_boundary = '| --: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |'

def make_markdown_table(cluster_summary):
    markdown = []
    markdown.append(convert_table_line_to_markdown(cluster_summary.pop(0)))
    markdown.append(header_boundary)
    for row in cluster_summary:
        markdown.append(convert_table_line_to_markdown(normalize_row(row)))
    return markdown

def write_tables_to_file(filename):
    f = open(filename, 'w')
    for file in cluster_files:
        md_table = make_markdown_table(read_csv_file(cluster_directory + file))
        f.write(file.split('.')[0] + '\n\n')
        for line in md_table:
            f.write(line + '\n')
        f.write('\n\n\n')
    f.close()

write_tables_to_file('cluster_summary_tables.md')
