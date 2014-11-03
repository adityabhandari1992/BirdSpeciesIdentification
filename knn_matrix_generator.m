function [test_matrix,test_matrix_classes,validation_matrix,validation_matrix_classes, training_matrix,training_matrix_classes] = matrix_generator(image_attribute_labels,test_matrix_labels,validation_matrix_labels,training_matrix_labels)
test_matrix=zeros([size((test_matrix_labels),1) 312]);
validation_matrix=zeros([size((validation_matrix_labels),1) 312]);
training_matrix=zeros([size((training_matrix_labels),1) 312]);

test_matrix_classes=zeros([size((test_matrix_labels),1) 1]);
validation_matrix_classes=zeros([size((validation_matrix_labels),1) 1]);
training_matrix_classes=zeros([size((training_matrix_labels),1) 1]);

for i=1:size((test_matrix_labels),1)
test_matrix(i,:)=image_attribute_labels((test_matrix_labels(i)-1)*312+1:test_matrix_labels(i)*312,3)';
test_matrix_classes(i)=test_matrix_labels(i,2);
end

for i=1:size((validation_matrix_labels),1)
validation_matrix(i,:)=image_attribute_labels((validation_matrix_labels(i)-1)*312+1:validation_matrix_labels(i)*312,3)';
validation_matrix_classes(i)=validation_matrix_labels(i,2);
end

for i=1:size((training_matrix_labels),1)
training_matrix(i,:)=image_attribute_labels((training_matrix_labels(i)-1)*312+1:training_matrix_labels(i)*312,3)';
training_matrix_classes(i)=training_matrix_labels(i,2);
end

%For finding distance, its good to replace zero by minus one
test_matrix(test_matrix==0) = -1;
training_matrix(training_matrix==0)=-1;
validation_matrix(validation_matrix==0)=-1;
