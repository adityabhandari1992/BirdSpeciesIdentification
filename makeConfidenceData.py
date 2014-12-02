def convertUsingConfidence(label, confidence):
    if (label == '1'):
        if (confidence == '4'):
            return '1'
        elif (confidence == '3'):
            return '0.9'
        elif (confidence == '2'):
            return '0.8'
        elif (confidence == '1'):
            return '0.7'
    elif (label == '0'):
        if (confidence == '4'):
            return '0'
        elif (confidence == '3'):
            return '0.1'
        elif (confidence == '2'):
            return '0.2'
        elif (confidence == '1'):
            return '0.3'

f = open('Data/image_attribute_labels_col1to4.txt', 'r')
fNew = open('Data/confidenceData.txt', 'a')
numberLines = 0
newLine = [0] * 312
for line in f:
    lineValues = [0] * 4
    i = 0
    for x in line.split(' '):
        if (i == 3):
            lineValues[3] = x[0]
        else:
            lineValues[i] = x
        i += 1
    newLine[numberLines] = convertUsingConfidence(lineValues[2], lineValues[3])
    numberLines += 1

    if (numberLines == 312):
        fNew.write(' '.join(newLine))
        fNew.write('\n')
        numberLines = 0