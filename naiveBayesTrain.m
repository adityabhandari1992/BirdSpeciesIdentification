function [phi_attributeK_classI] = naiveBayesTrain(image_class_labels, image_attribute_labels, numberAttributes, numberClasses)

% Find the number of images
numberImages = size(image_class_labels,1);

% Initialize the output matrix
phi_attributeK_classI = zeros(numberAttributes,numberClasses);

% We need to find the phi values for each attribute given each class
for k = 1:numberAttributes
    % phi_attributeK_classI(k,i) = numeratorPhiKI(i) / denominatorPhiKI(i)
    % Initialize numerators and denominators for Laplace smoothing
    numeratorPhiKI = ones(1, numberClasses);
    denominatorPhiKI = numberAttributes * ones(1, numberClasses);
    
    % Iterate over the data where attribute is k
    for j = 1:numberImages
        row = j.*k;
        % If the image belongs to class 'i'
        % Update numeratorPhiKI(i) and denominatorPhiKI(i)
        i = image_class_labels(j,2);
        if (image_attribute_labels(row,3) == 1)
            numeratorPhiKI(i) = numeratorPhiKI(i) + 1;
        end
        denominatorPhiKI(i) = denominatorPhiKI(i) + 1;
    end
    
    % Store the phi value for attribute k given class 'i'
    for i = 1:numberClasses
        phi_attributeK_classI(k,i) = numeratorPhiKI(i)./denominatorPhiKI(i);
    end
end