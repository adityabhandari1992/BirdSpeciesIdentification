from numpy import *
from sklearn.decomposition import PCA
import scipy.io
from sklearn import svm
from sklearn import cross_validation
from sklearn.lda import LDA

# Import training data
trainingData = loadtxt('Data/featureData.txt')
trainingLabels = loadtxt('Data/labels.txt')

# Find the sizes of the data
trainingSize = size(trainingLabels)

# Run PCA
pca = PCA(n_components=200)
trainingDataNew = pca.fit_transform(trainingData)

X_train, X_test, y_train, y_test = cross_validation.train_test_split(trainingDataNew, trainingLabels, test_size=0.3)

# Train SVM model for the training data
clf_svm = LDA()
clf_svm.fit(X_train,y_train)

# Test the trained model in the test data
print clf_svm.score(X_test, y_test) * 100

# Find the percentage error
# error = 0
# for i in range(0,trainingSize):
#     if predictedLabels[i] != trainingLabels[i]:
#         error = error+1

# print float(error)/float(trainingSize) * 100