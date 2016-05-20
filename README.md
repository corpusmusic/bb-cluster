# bb-cluster

##Goals
* Improve the Billboard dataset chord analysis of a previous class. Also repeat this work done on the most recent Billboard Dataset.
* Run a 15 cluster K-mean model and a Gaussian mixture model to compare previously held genre classifications. 

##Instructions
1. Go into **parse.py** and change __ROOT_DIR__ variable (line 9) to the location of this repo on your computer. 
2. Run parse.py. Output should be **chord_by_chord.csv**
3. Run transitionprob.py. Output should be **songbysongtransprob.csv**

##Group Tasks
1. Edit **parse.py** to mainly remove repeating chords from consideration.
  * Columns now included: song, year, artist, metre, 0-11 chord root, roman numeral form, chord symbol, quality.
2. Edit **readdata.py** to include our new columns  
3. Edit **transitionprob.py** to no longer include repeated chord probabilities
4. Change output file name to something intuitive. **songbysongtransprob.csv**
