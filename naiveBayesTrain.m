function [phi_attributeK_classI, phiY] = naiveBayesTrain(image_class_labels, image_attribute_labels, numberAttributes, numberClasses)

% Find the number of images
numberImages = size(image_class_labels,1);

% Initialize the output matrix
phi_attributeK_classI = zeros(numberAttributes,numberClasses);

% We find the P(y=i) for each class 'i'
phiY = zeros(numberClasses, 1);

% We find the phi values for each attribute given each class
for k = 1:numberAttributes
    % phi_attributeK_classI(k,i) = numeratorPhiKI(i) / denominatorPhiKI(i)
    % Initialize numerators and denominators for Laplace smoothing
    numeratorPhiKI = ones(numberClasses, 1);
    denominatorPhiKI = numberAttributes * ones(numberClasses, 1);
    
    % Iterate over the data where attribute is k
    for j = 1:numberImages
        row = j.*k;
        % If the image belongs to class 'i'
        % Update phiY(i), numeratorPhiKI(i) and denominatorPhiKI(i)
        i = image_class_labels(j,2);
        phiY(i) = phiY(i) + 1;
        
        % Without using the confidence metric
        % numeratorPhiKI(i) = numeratorPhiKI(i) + image_attribute_labels(row,3);
        
        % Using the confidence metric
        numeratorPhiKI(i) = numeratorPhiKI(i) + (image_attribute_labels(row,3).*image_attribute_labels(row,4));
        
        denominatorPhiKI(i) = denominatorPhiKI(i) + 1;
    end
    
    % Store the phi value for y and for attribute k given class 'i'
    for i = 1:numberClasses
        phiY(i) = phiY(i)./numberImages;
        phi_attributeK_classI(k,i) = numeratorPhiKI(i)./denominatorPhiKI(i);
    end
end