% Image attribute labels
image_attribute_labels = importdata('image_attribute_labels_col1to4.txt');

% Image class labels
image_class_labels = importdata('image_class_labels.txt');

[test_matrix_labels,validation_matrix_labels, training_matrix_labels] = class_label_splitter(image_class_labels);
[test_matrix,test_matrix_classes,validation_matrix,validation_matrix_classes, training_matrix,training_matrix_classes] = matrix_generator(image_attribute_labels,test_matrix_labels,validation_matrix_labels,training_matrix_labels);
K_training_range_row=[1:20];
%[B, optimum_K accuracy]=knn_cosine_distance(validation_matrix,validation_matrix_labels,training_matrix,training_matrix_classes,K_training_range_row);
distance='euclidean';
optimum_K=knn_specified_distance(validation_matrix,validation_matrix_labels,training_matrix,training_matrix_classes,K_training_range_row,distance);
% Testing
accuracy=knn_test(test_matrix,test_matrix_labels,training_matrix,training_matrix_classes,optimum_K,distance);