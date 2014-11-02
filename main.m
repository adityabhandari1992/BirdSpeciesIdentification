% Read the data from the data set
readData

% Run Naive Bayes algorithm
% Train
[phiK, phiY] = naiveBayesTrain(image_class_labels, image_attribute_labels, numberAttributes, numberClasses);

% Test
[error] = naiveBayesTest(phiK, phiY, image_class_labels, image_attribute_labels, numberAttributes, numberClasses);

% Print the % error and accuracy
percentageError = error.*100
percentageAccuracy = 100-percentageError