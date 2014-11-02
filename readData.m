% Image attribute labels
image_attribute_labels = importdata('image_attribute_labels_col1to4.txt');

% Image class labels
image_class_labels = importdata('image_class_labels.txt');

% Class names
fileID = fopen('classes.txt');
classes = textscan(fileID,'%d %s');
fclose(fileID);

% Define number of classes
numberClasses = 200;

% Attributes
fileID = fopen('attributes.txt');
attributes = textscan(fileID,'%d %s');
fclose(fileID);

% Define number of attributes
numberAttributes = 312;