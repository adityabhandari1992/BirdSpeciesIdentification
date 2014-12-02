# Declare the number of images
NUMBER_IMAGES = 11788

from  numpy import *
from sklearn import tree
from sklearn import cross_validation
from sklearn.feature_selection import VarianceThreshold
from sklearn.feature_selection import SelectKBest 
from sklearn.feature_selection import chi2 
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

# Feature selection - variance threshold method
# newData = VarianceThreshold(threshold=0.02).fit_transform(data)
# print size(newData[1])

# Feature selection - variance threshold method
# newData = SelectKBest(chi2, k=200).fit_transform(data, labels)

# Separate the train test data
trainingData, testData, trainingLabels, testLabels = cross_validation.train_test_split(data, labels, test_size=0.3)

# Find the sizes of the data
trainingSize = size(trainingLabels)
testSize = size(testLabels)

# Train a Decision Trees model for the training data
clf_tree = tree.DecisionTreeClassifier()
clf_tree.fit(trainingData,trainingLabels)

# Test the trained model in the test data
# predictedLabels = clf_tree.predict(testData)
print clf_tree.score(testData, testLabels) * 100

# Find the percentage error
# error = 0
# for i in range(0,testSize):
#     if predictedLabels[i] != testLabels[i]:
#         error = error+1

# print float(error)/float(testSize) * 100