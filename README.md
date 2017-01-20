# bb-cluster

This repository contains Python and R code to transform and analyze harmonic progressions in the [McGill Billboard dataset](http://ddmal.music.mcgill.ca/research/billboard) (BB), including:

- ```assembleClusterResultsTable.R``` takes the output of each cluster solution and merges them with individual song metadata, producing a single table containing song metadata and the cluster assignment from each solution (1-15 clusters) in ```song_metadata_and_clusters.csv```.  
- ```billboard-2.0-index.csv``` is an index of all songs in the corpus.  
- ```chord_by_chord.csv``` contains a tidy table of all chords in the corpus, in order within each song, with original chord data from BB and key-oriented harmonic function notation from ```parse.py```.  
- ```cluster_summary_tables.md``` contains a list of markdown-formatted tables of normalized average transitional probability values for each cluster (output of ```normalize_tables.py```).  
- ```clusters_to_tables.R``` takes the transition probability analysis for each song in a cluster (from ```/cluster_tables/```) and creates a table of average probabilities for each cluster in each solution (in ```/cluster_summaries/```).  
- ```kmeans_cluster.py``` performs a K-means cluster analysis on that output, for cardinalities of 1 to 15. Script contains a seed value so you can reproduce our results exactly. Remove seed value to obtain slightly different (random) results.  
- ```normalize_tables.py``` normalizes transitional probability averages for each cluster summary so that rows sum to 1, then writes tables in markdown format to ```cluster_summary_tables.md```.  
- ```parse.py``` parses BB and transforms the absolute chord notation into key-oriented, functional notation (Roman numerals, identifying the chord root in relation to the tonic pitch of the key, with chord quality removed).  
- ```readdata.py``` defines file reading and parsing functions used by ```transitionprob.py```.  
- ```solutions_to_tables.py``` merges song transition probability data with cluster analysis results, and outputs a table for each cluster containing transitional probability data for each song in that cluster to ```/cluster_tables/```.  
- ```song_metadata_and_clusters.csv``` is a table containing song metadata and cluster assignments for each solution (1-15 clusters).  
= ```song_metadata_and_cluster_names.csv``` is a table containing song metadata and cluster *names* ("authentic", "plagal", "doo-wop", "blues", etc.) for each solution (1-15 clusters).  
- ```song_metadata.csv``` contains metadata for each song, extracted from BB source files.  
- ```songbysongtransprob.csv``` contains transitional probability analyses for each song in the corpus.  
- ```transitionprob.py``` calculates the probability of occurrence of chord-to-chord transitions in each song and outputs a table with results for each song in BB.  
- ```visualizations.R``` loads cluster-average transitional probability data for each cluster from ```/cluster_summaries/``` and generates a visualization of that table in ```/plots/```.  

BB data can be downloaded from the [McGill Billboard dataset website](http://ddmal.music.mcgill.ca/research/billboard) directly. Outputs of all parsing, machine learning, and analysis scripts are already contained in this repository.

To run these scripts yourself, download BB, place the data in the same root folder as these scripts, and move ```billboard-2.0-index.csv``` to the BB data folder. Then run the scripts in the following order:

- ```parse.py``` to parse and transform the data into key-oriented chord information  
- ```transitionprob.py``` to analyze the chord-to-chord transitional probabilities for each song  
- ```kmeans_cluster.py``` to run the cluster analysis algorithm  
- ```assembleClusterResultsTable.R``` to create a list of songs, metadata, and cluster assignments for each test  
- ```solutions_to_tables.py``` to assemble a table of song data for each cluster in each solution  
- ```clusters_to_tables.R``` to generate cluster-wide average probability tables for each cluster in each solution  
- ```normalize_tables.py``` to normalize tables and write to markdown  
- ```visualizations.R``` to generate visualizations  

## Articles and blog posts associated with this repository

[6 Cluster Analysis](https://medium.com/modeling-music/does-harmony-influence-musical-style-genre-a3b8726e5a3d#.de3u5yegd)

[15 Cluster Analysis](https://medium.com/modeling-music/harmonic-progression-and-genre-as-understood-through-cluster-analysis-9566dcaf4650#.595du9oc8)
