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
<b>Naive Bayes</b> - Error = 66.9324737021 %  

<b>SVM</b> - Error = 49.3298269427 %  

<b>Decision Trees</b> - Error = 0.169664065151 %  

<b>KNN</b> - Uniform - Error = 54.5724465558 %  
      Distance - Error = 0.169664065151 %

<b>LDA</b> - Error = 36.4353579912 %

Testing on separate test data
===
<b>Naive Bayes</b> - Error = 80.7806533729 %  

<b>SVM</b> - Error = 56.0882477726 %  

<b>Decision Trees</b> - Error = 75.6470089096 %  

<b>KNN</b> - Uniform - Error = 68.8162918965 %  
      Distance - Error = 66.9495120916 %

<b>LDA</b> - Error = 54.5608824777 %
