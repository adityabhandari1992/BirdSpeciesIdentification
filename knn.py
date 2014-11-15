# Declare the number of images
NUMBER_IMAGES = 11788

from  numpy import *;
from sklearn import neighbors, datasets

# Import the data
featureData = loadtxt("Data/featureData.txt")
labels = loadtxt("Data/labels.txt")

n_neighbors = 1

for n_neighbors in range(1,20):
    clf = neighbors.KNeighborsClassifier(n_neighbors, 'uniform')
    clf.fit(featureData, labels)

    predictedValues = clf.predict(featureData)

    error = 0
    for i in range(0,11788):
        if predictedValues[i] != labels[i]:
            error = error+1

    print n_neighbors
    print float(error)/float(11788) * 100