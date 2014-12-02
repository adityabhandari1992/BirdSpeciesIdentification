# Declare the number of images
NUMBER_IMAGES = 11788

from  numpy import *;
from sklearn.cluster import KMeans
import scipy.io

# Import data
# trainingData = loadtxt('Data/featureData.txt')
# trainingLabels = loadtxt('Data/labels.txt')
# testData = trainingData
# testLabels = trainingLabels

# Import training data
trainingDataRecord = scipy.io.loadmat('SampledData/training_matrix.mat')
trainingData = trainingDataRecord['training_matrix']
trainingLabelsRecord = scipy.io.loadmat('SampledData/training_matrix_classes.mat')
trainingLabels = trainingLabelsRecord['training_matrix_classes']

# Import the test data
testDataRecord = scipy.io.loadmat('SampledData/test_matrix.mat')
testData = testDataRecord['test_matrix']
testLabelsRecord = scipy.io.loadmat('SampledData/test_matrix_classes.mat')
testLabels = testLabelsRecord['test_matrix_classes']

# Find the sizes of the data
trainingSize = size(trainingLabels)
testSize = size(testLabels)

# Train K Means on the training data 
kmeans = KMeans(n_clusters=200)
kmeans.fit(trainingData)

# Test the trained model in the test data
predictedLabels = kmeans.predict(testData)

# Find the percentage error
error = 0
for i in range(0,testSize):
    if predictedLabels[i] != testLabels[i]:
        error = error+1

print float(error)/float(testSize) * 100