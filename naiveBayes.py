# Declare the number of images
NUMBER_IMAGES = 11788

from  numpy import *;
from sklearn.naive_bayes import GaussianNB

# Import the data
featureData = loadtxt("Data/featureData.txt")
labels = loadtxt("Data/labels.txt")

# Train Naive Bayes on the training data 
gnb = GaussianNB()
gnb_model = gnb.fit(featureData, labels)

# Test the trained model in the test data
predictedValues = gnb_model.predict(featureData)

# Find the percentage error
error = 0
for i in range(0,NUMBER_IMAGES):
    if predictedValues[i] != labels[i]:
        error = error+1

print float(error)/float(NUMBER_IMAGES) * 100