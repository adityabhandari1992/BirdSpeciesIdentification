
from  numpy import *;
from sklearn import svm;

#import the data
featureData = loadtxt("/home/rohit/Desktop/python/SVM/featureData.txt");
labels = loadtxt("/home/rohit/Desktop/python/SVM/labels.txt");

#separate train data
imageLabels = loadtxt("/home/rohit/Desktop/python/SVM/image_class_labels.txt");

#classcount = 0;
#classnumber = 1;
#row = zeros(11788);
#for i in range(0,11788):
#	if imageLabels[i,0] == classnumber:
#		classcount++;
#		if classcount>49:
#			classnumber++;
#		row

clf_svm = svm.SVC();
clf_svm.fit(featureData,labels);

predictedValues = clf_svm.predict(featureData);

error = 0;
for i in range(0,11788):
	if predictedValues[i] != labels[i]:
		error = error+1;

print float(error)/float(11788);
