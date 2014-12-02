# Declare the number of images
NUMBER_IMAGES = 11788

from  numpy import *;
from sklearn.naive_bayes import GaussianNB
from sklearn import cross_validation
import scipy.io

# Import data
data = loadtxt('Data/confidenceData.txt')
labels = loadtxt('Data/labels.txt')

# Import training data
# trainingDataRecord = scipy.io.loadmat('SampledData/training_matrix.mat')
# trainingData = trainingDataRecord['training_matrix']
# trainingLabelsRecord = scipy.io.loadmat('SampledData/training_matrix_classes.mat')
# trainingLabels = trainingLabelsRecord['training_matrix_classes']

# # Import the test data
# testDataRecord = scipy.io.loadmat('SampledData/test_matrix.mat')
# testData = testDataRecord['test_matrix']
# testLabelsRecord = scipy.io.loadmat('SampledData/test_matrix_classes.mat')
# testLabels = testLabelsRecord['test_matrix_classes']

# Separate the train test data
trainingData, testData, trainingLabels, testLabels = cross_validation.train_test_split(data, labels, test_size=0.3)

# Find the sizes of the data
trainingSize = size(trainingLabels)
testSize = size(testLabels)

# Train Naive Bayes on the training data 
gnb = GaussianNB()
gnb.fit(trainingData, trainingLabels)

# Test the trained model in the test data
print gnb.score(testData, testLabels) * 100

# Find the percentage error
# error = 0
# for i in range(0,testSize):
#     if predictedLabels[i] != testLabels[i]:
#         error = error+1

# print float(error)/float(testSize) * 100