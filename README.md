Bird Species Identification from an Image
=========================

<b>CS 229 : Machine Learning Project at Stanford University</b>

Naive Bayes
=====
(Tested on training data)  

- Without confidence metric:  
Error = 62.1310 %  

- With confidence metric:  
Error = 62.2922 %  

KNN
=====
(Tested on separate test data)  

Optimal k = 13  
Error = 69.63 %

Scikit library
=====
Testing on the entire training data
===
Naive Bayes - Error = 66.9324737021 %  

SVM - Error = 49.3298269427 %  

Decision Trees - Error = 0.169664065151 %  

KNN - Uniform - Error = 54.5724465558 %  
      Distance - Error = 0.169664065151 %


Testing on separate test data
===
Naive Bayes - Error = 80.7806533729 %  

SVM - Error = 56.0882477726 %  

Decision Trees - Error = 75.6470089096 %  

KNN - Uniform - Error = 68.8162918965 %  
      Distance - Error = 66.9495120916 %
