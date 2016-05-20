"""
This file contains a method that grabs the data from the csv. Because it will
be used in all the analysis files, it is separated out here.

"""

import csv

CSV_COLUMNS = ['song_name', 'artist', 'year', 'metre', 'root', 'relative_chords', 'roman', 'quality']

def refine_form(song_list, has_chorus):
    """
    Implement some transformations on the module data from the corpus.

    'verse' becomes 'strophe' if not chorus is present
    'interlude' becomes 'intro' if not final, otherwise 'outro'
    'instrumental', 'solo' attempt to match with the letter of another form element
        if one is present, otherwise get '(unique_harmony)' appended

    """

    # use an inner function to have access to refine_form local variables
    def get_correct_module(key):
        current_letter = form_list[form_list_idx][2]
        for i, form in enumerate(form_list):
            if current_letter == form[2] and form[1] != key and form[1] != 'interlude':
                # form_list[i][1] = form[1]
                return form[1]
        return key + '(unique_harmony)'

    prev_module = None
    form_list = []
    for i, entry in enumerate(song_list):
        if 'module' not in entry:
            return

        # if there is no chorus, replace verse with strophe
        if not has_chorus and entry['module'] == 'verse':
            entry['module'] = 'strophe'

        if entry['module'] != prev_module:
            form_list.append([i, entry['module'], entry['letter']])

        prev_module = entry['module']

    if len(form_list) > 1:
        form_list_idx = 0
        current_form = form_list[form_list_idx][1]
        next_idx = form_list[form_list_idx+1][0]

        for i, entry in enumerate(song_list):
            if i == next_idx:
                form_list_idx += 1
                current_form = form_list[form_list_idx][1]
                if form_list_idx < len(form_list) - 1:
                    next_idx = form_list[form_list_idx+1][0]
                else:
                    current_form += '_final'

            if entry['module'] == 'interlude_final':
                entry['module'] = 'outro'
            if entry['module'] == 'interlude':
                try:
                    form_list[form_list.index('interlude')] = 'intro'
                except:
                    pass
                entry['module'] = 'intro'

            if entry['module'] == 'solo':
                entry['module'] = get_correct_module('solo')
            if entry['module'] == 'instrumental':
                entry['module'] = get_correct_module('instrumental')

def read_data(filename, col_names=None):
    """
    Return a list of usable data.

    Args:
        filename: the name of the csv to read the data from. This is the output from the parser code.
        col_names: a list that is a subset of the CSV_COLUMNS list, indicating which columns to select.
            If col_names is not passed, all columns will be collected

    """
    corpus_list = []
    song_list = []
    with open(filename, 'rb') as csvfile:
        reader = csv.reader(csvfile, delimiter=',', quotechar='"')
        has_chorus = False
        prev_song = None
        for row in reader:
            if len(row) > 0:
                if col_names is not None:
                    entry = {k: v for k, v in zip(CSV_COLUMNS, row) if k in col_names}
                else:
                    entry = {k: v for k, v in zip(CSV_COLUMNS, row)}

                if 'module' in entry:
                    # easy one-to-one form replacements

                    if 'chorus' in entry['module']:
                        entry['module'] = 'chorus'
                    if 'verse' in entry['module']:
                        entry['module'] = 'verse'
                    if 'instrumental' in entry['module']:
                        entry['module'] = 'instrumental'
                    if 'intro' in entry['module']:
                        entry['module'] = 'intro'

                    if entry['module'] == 'fadein' or entry['module'] == 'fade in':
                        entry['module'] = 'intro'
                    if entry['module'] == 'trans':
                        entry['module'] = 'interlude'
                    if entry['module'] == 'fadeout' or entry['module'] == 'ending':
                        entry['module'] = 'outro'
                    if entry['module'] == 'chorus':
                        has_chorus = True

                song_list.append(entry)
                prev_song = row[0]

            # line break means start the next song
            else:
                refine_form(song_list, has_chorus)
                has_chorus = False
                corpus_list.append(song_list)
                song_list = []

    return corpus_list
