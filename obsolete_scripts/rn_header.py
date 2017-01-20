rn = ['I', 'bII', 'II', 'bIII', 'III', 'IV', 'bV', 'V', 'bVI', 'VI', 'bVII', 'VII']
header = []
for n in rn:
    for next_n in rn:
        header.append(n + '-' + next_n)
print(header)
print(len(header))
