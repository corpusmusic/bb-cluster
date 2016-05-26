# bb-cluster

##Goals
* Improve the Billboard dataset chord analysis of a previous class. Also repeat this work done on the most recent Billboard Dataset.
* Run a 6 and 15 cluster K-mean model and a Gaussian mixture model to compare previously held genre classifications. 
* Run transitional probabilities on the clusters produced by our program.

##Notes
* An order to take if running this for yourself: parse.py, transprob.py, kmeans_cluster.py, bb_transprob_cluster_analysis.R.
* Gaussian mixture modeling was dropped due to difficulty in the time frame.
* The R script will work to get transitional probabilities of the cluster data produced by previous python programs. You can play with the data after the extraction is done.


##Group Tasks
1. Edit **parse.py** to mainly remove repeating chords from consideration.
  * Columns now included: song, year, artist, metre, 0-11 chord root, roman numeral form, chord symbol, quality.
2. Edit **readdata.py** to include our new columns.
3. Edit **transitionprob.py** to no longer include repeated chord probabilities.
4. Change output file name to something intuitive. **songbysongtransprob.csv**
5. Make **kmean_cluster.py**
6. Add cluster information to songbysongtransprob.csv. Named **newchordbychord**
7. **Gaussian clustering DROPPED**
8. Use R to run transitional probabilites on each of the clusters.
9. Analyze transitional probabilities.