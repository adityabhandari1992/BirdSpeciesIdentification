function [phi_attributeK0_classI, phi_attributeK1_classI, phiY] = naiveBayesTrain(image_class_labels, image_attribute_labels, numberAttributes, numberClasses)

% Find the number of images
numberImages = size(image_class_labels,1);

% Initialize the output matrices
phi_attributeK0_classI = zeros(numberAttributes,numberClasses);
phi_attributeK1_classI = zeros(numberAttributes,numberClasses);

% We find the P(y=i) for each class 'i'
phiY = zeros(numberClasses, 1);

% We find the phi values for each attribute given each class
for k = 1:numberAttributes
    % phi_attributeK0_classI(k,i) = numeratorPhiK0I(i) / denominatorPhiKI(i)
    % phi_attributeK1_classI(k,i) = numeratorPhiK1I(i) / denominatorPhiKI(i)
    % Initialize numerators and denominator for Laplace smoothing
    numeratorPhiK0I = ones(numberClasses, 1);
    numeratorPhiK1I = ones(numberClasses, 1);
    denominatorPhiKI = 2 * ones(numberClasses, 1);
    
    % Iterate over the data where attribute is k
    for j = 1:numberImages
        row = j.*k;
        % If the image belongs to class 'i'
        % Update phiY(i), numeratorPhiKI(i) and denominatorPhiKI(i)
        i = image_class_labels(j,2);
        phiY(i) = phiY(i) + 1;
        
        % Update the weight of each example
        % Without using the confidence metric
        % weight = 1;
        
        % Using the confidence metric
        weight = image_attribute_labels(row,4);

        
        if (image_attribute_labels(row,3) == 0)
            numeratorPhiK0I(i) = numeratorPhiK0I(i) + weight;
        else
            numeratorPhiK1I(i) = numeratorPhiK1I(i) + weight;
        end
        denominatorPhiKI(i) = denominatorPhiKI(i) + weight;
    end
    
    % Store the phi value for y and for attribute k given class 'i'
    for i = 1:numberClasses
        phiY(i) = phiY(i)./numberImages;
        phi_attributeK0_classI(k,i) = numeratorPhiK0I(i)./denominatorPhiKI(i);
        phi_attributeK1_classI(k,i) = numeratorPhiK1I(i)./denominatorPhiKI(i);
    end
end