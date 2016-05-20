# bb-cluster

##Goals
* Improve the Billboard dataset chord analysis of a previous class. Also repeat this work done on the most recent Billboard Dataset.
* Run a 15 cluster K-mean model and a Gaussian mixture model to compare previously held genre classifications. 

##Duties
1. Edit **parse.py** to mainly remove repeating chords from consideration.
  * Columns now included: song, year, artist, metre, 0-11 chord root, roman numeral form, chord symbol, quality.
2. Edit **readdata.py** to include our new columns  
3. Edit **transitionprob.py** to no longer include repeated chord probabilities
4. Change output file name to something intuitive. **songbysongtransprob.csv**
