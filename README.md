# bb-cluster

##Goals
* Improve the Billboard dataset chord analysis of a previous class. Also repeat this work done on the most recent Billboard Dataset.
* Run a 6 and 15 cluster K-mean model and a Gaussian mixture model to compare previously held genre classifications. 
* Run transitional probabilities on the clusters produced by our program.

##Results
[6 Cluster Analysis](https://medium.com/modeling-music/does-harmony-influence-musical-style-genre-a3b8726e5a3d#.de3u5yegd)

[15 Cluster Analysis](https://medium.com/modeling-music/harmonic-progression-and-genre-as-understood-through-cluster-analysis-9566dcaf4650#.595du9oc8)

##Notes
* An order to excute if running this for yourself: parse.py, transprob.py, kmeans_cluster.py, bb_transprob_cluster_analysis.R.
	* For **parse.py**, the McGill Billboard dataset needs to be in the same root folder as this repo.
	* **billboard-2.0-index.csv** should also be moved into the McGill Billboard folder.
* Gaussian mixture modeling was dropped due to difficulty in the time frame.
* The R script will get transitional probabilities of the cluster data produced by previous python programs. You can play with the data after the extraction is done.


##Group Tasks
1. Edit **parse.py** to mainly remove repeating chords from consideration.
	* Columns now included: song, year, artist, metre, 0-11 chord root, roman numeral form, chord symbol, quality.
2. Edit **readdata.py** to include our new columns.
3. Edit **transitionprob.py** to no longer include repeated chord probabilities.
4. Change output file name to something intuitive. **songbysongtransprob.csv**.
5. Make **kmean_cluster.py** to run KMeans cluster analysis on **songbysongtransprob.csv**.
6. Outputs into temporary files **cluster_chordbychord.csv** and **cluster_songbysong.csv**.
7. Add cluster information to songbysongtransprob.csv. Named **new_cluster_songbysongtransprob.csv**.
8. **Gaussian clustering DROPPED**.
9. Use R to run transitional probabilites on each of the clusters.
10. Analyze transitional probabilities to identify clusters.
