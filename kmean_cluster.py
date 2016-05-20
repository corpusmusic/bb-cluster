from __future__ import print_function, division, absolute_import, unicode_literals
import csv
import numpy as np
import scipy as sp
from sklearn.cluster import KMeans

#open transition prob csv file
csvf = open('songbysongtransprob.csv','rb')
reader = csv.reader(csvf)
for row in reader:
    print row

K = 15 #number of clusters
km = KMeans(n_clusters = K)
km.fit(customer_deal_matrix)
