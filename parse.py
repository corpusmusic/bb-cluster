from __future__ import division

import os
import re
import csv

from collections import defaultdict, deque

ROOT_DIR = '../McGill-BillBoard'  #make sure you download the BB corpus into the same root folder as the repository
KEYS = [{'A'}, {'A#', 'Bb'}, {'B', 'Cb'}, {'C'}, {'C#', 'Db'}, {'D'}, {'D#', 'Eb'}, {'E', 'Fb'}, {'F'}, {'F#', 'Gb'}, {'G'}, {'G#', 'Ab'}]
RN = ['I', 'bII', 'II', 'bIII', 'III', 'IV', 'bV', 'V', 'bVI', 'VI', 'bVII', 'VII']
chromaticRelativeRoot = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

def corpus_list(root):
    """Return a list of all paths to the salami text files, relative to the root directory of the project."""
    filelist = []
    with open((root + '/billboard-2.0-index.csv'), 'rb') as csvfile: #make sure index file is in ROOT_DIR folder
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        for entry in reader:
            if entry[4]:
                filelist.append(root + '/' + str(entry[0].zfill(4)) + '/salami_chords.txt')
    filelist.pop(0)
    return filelist

def lookup_chord(key, key_list):
    """Look up the numerical position of a chord root relative to an ordered list of roots (possibly shifted)."""
    for i, k in enumerate(key_list):
        if key in k:
            return i

def get_tonic(songfile):
    """Return tonic pitch of a song."""
    fs = open(songfile)
    line = fs.readline()
    while 'tonic' not in line:
        line = fs.readline()
    tonic = line[line.index(':') + 2:-1]
    return tonic

def get_chord_sequence(line):
    """
    Return a list of chord sequences from a line.
    """
    chords =  re.findall(r'\S+:\S+|\s+Z{1}\s|&pause|\s+N+\s', line)
    return [c.strip() for c in chords]

def get_roman(tonic, chords):
    """
    Return a list of the relative root numbers based on the tonic note and
    a list of absolute chords. Returns integers, where 0 -> I, 1 -> II, etc.

    TODO: needs testing and verification that it is working properly

    """
    root_num = lookup_chord(tonic, KEYS)
    shifted_keys = deque(KEYS)
    shifted_keys.rotate(-root_num)
    relative_chords = []
    for c in chords:
	if c.strip() == "N" or c.strip() == "Z" or c.strip() == "&pause":
		relative_chords.append("NonHarmonic")
	else:
		root, quality = c.split(':')
        	relative_chords.append(RN[lookup_chord(root, shifted_keys)])
    return relative_chords

def get_relroot(tonic, chords):
    """
    Return a list of the relative root numbers based on the tonic note and
    a list of absolute chords. Returns integers, where 0 -> I, 1 -> II, etc.

    TODO: needs testing and verification that it is working properly

    """
    root_num = lookup_chord(tonic, KEYS)
    shifted_keys = deque(KEYS)
    shifted_keys.rotate(-root_num)
    relative_chords = []
    for c in chords:
	if c.strip() == "N" or c.strip() == "Z" or c.strip() == "&pause":
		relative_chords.append("NonHarmonic")
	else:
		root, quality = c.split(':')
        	relative_chords.append(chromaticRelativeRoot[lookup_chord(root, shifted_keys)])
    return relative_chords

def get_title(song):
    fs = open(song)
    line = fs.readline()
    while 'title' not in line:
        line = fs.readline()
    title = line[line.index(':') + 2:-1]
    return title

def get_artist(song):
    fs = open(song)
    line = fs.readline()
    while 'artist' not in line:
        line = fs.readline()
    artist = line[line.index(':') + 2:-1]
    return artist

def get_metre(song):
    fs = open(song)
    line = fs.readline()
    while 'metre' not in line:
        line = fs.readline()
    metre = line[line.index(':') + 2:-1]
    return metre

def get_year(root):
    filelist = []
    with open((root + '/billboard-2.0-index.csv'), 'rb') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        for entry in reader:
            if entry[4]:
                filelist.append(str(entry[1][0:4]))
    filelist.pop(0)
    #print filelist
    return filelist

def get_chord_quality(chordList):
	qualityList = []
	for chord in chordList:
		if chord.strip() == "N" or chord.strip() == "Z" or chord.strip() == "&pause":
			qualityList.append("NonHarmonic")
		else:
			qualityList.append(chord.split(":")[1])

	return qualityList

def get_repeats(line):
	repeats = re.findall(r'x+\d',line)
	if repeats:
		return int(repeats[0][-1])
	else:
		return 1

def update_key(line, tonic):
	if "tonic:" in line:
		tonic = line[line.index(':') + 2:-1]
	return tonic

if __name__ == '__main__':
    """Write an example csv to play with for the analysis code."""
    filenames = corpus_list(ROOT_DIR)
    yearArray = get_year(ROOT_DIR)
    yearCounter = -1

    relative_chords = []

    with open('chord_by_chord.csv', 'wb') as csvfile:
	writer = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    	for song in filenames:
            tonic = get_tonic(song)
            songfile = open(song)
            titleList = []
            artistList = []
            yearList = []
            metreList = []
            chordList = []
            relativeChordList = []
            relativeRNList =[]
            chordQualityList = []
            yearCounter += 1
            year = yearArray[yearCounter]
            #print year

            for line in songfile:
                chordsInPhrase =  get_chord_sequence(line)
                roman =  get_roman(tonic,chordsInPhrase)
                relroot =  get_relroot(tonic,chordsInPhrase)
                title = [get_title(song).replace(" ","")]*len(chordsInPhrase)
                artist = [get_artist(song).replace(" ","")]*len(chordsInPhrase)
                metre = [get_metre(song).replace(" ","")]*len(chordsInPhrase)
                chordQualities = get_chord_quality(chordsInPhrase)

                repeats = get_repeats(line)

                tonic = update_key(line,tonic)

                titleList += title*repeats
                artistList += artist*repeats
                yearList.append(year)
                metreList += metre*repeats
                chordList +=  chordsInPhrase*repeats
                relativeChordList += relroot*repeats
                relativeRNList += roman*repeats
                chordQualityList += chordQualities*repeats

            for title, artist, year, metre, lead_sheet, rel_chords, roman_num, quality in zip(titleList,artistList, yearList, metreList, chordList,relativeChordList,relativeRNList,chordQualityList):
                writer.writerow([title, artist, year, metre, lead_sheet, rel_chords, roman_num, quality])
            writer.writerow([])

    yearCounter = -1
    with open('song_metadata.csv', 'wb') as csvfile:
        writer = csv.writer(csvfile, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
        for song in filenames:
            tonic = get_tonic(song)
            songfile = open(song)
            titleList = []
            artistList = []
            yearList = []
            metreList = []
            yearCounter += 1
            year = yearArray[yearCounter]
            #print year

            for line in songfile:
                chordsInPhrase =  get_chord_sequence(line)
                title = [get_title(song).replace(" ","")]*len(chordsInPhrase)
                artist = [get_artist(song).replace(" ","")]*len(chordsInPhrase)
                metre = [get_metre(song).replace(" ","")]*len(chordsInPhrase)

                titleList += title
                artistList += artist
                yearList.append(year)
                metreList += metre

            for title, artist, year, metre, in zip(titleList,artistList, yearList, metreList):
                writer.writerow([title, artist, year, metre])
            writer.writerow([])
