function [test_matrix_labels,validation_matrix_labels, training_matrix_labels] = class_label_splitter(class_label_matrix)
class_label_matrix_row_size=size((class_label_matrix),1);

p=randperm(class_label_matrix_row_size);

test_matrix_row_size=floor(0.2*class_label_matrix_row_size);
validation_matrix_row_size=floor(0.16*class_label_matrix_row_size);

p_test_matrix_labels=p(1:test_matrix_row_size);
p_validation_matrix_labels=p(test_matrix_row_size+1:test_matrix_row_size+validation_matrix_row_size);
p_training_matrix_labels=p(test_matrix_row_size+validation_matrix_row_size+1:class_label_matrix_row_size);

test_matrix_labels=class_label_matrix(p_test_matrix_labels,:);
validation_matrix_labels=class_label_matrix(p_validation_matrix_labels,:);
training_matrix_labels=class_label_matrix(p_training_matrix_labels,:);