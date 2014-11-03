function [accuracy]=knn_test(test_matrix,test_matrix_labels,training_matrix,training_matrix_classes,K,distance)

%Convert minus one to zeros first
%test_matrix(test_matrix==-1) = 0;
training_matrix(training_matrix==-1)=0;
test_matrix(test_matrix==-1)=0;




%knn_mat=validation_matrix*training_matrix';
%distance='euclidean';
% 'hamming' , 'chebychev' , 'minkowski', 'euclidean', 'seuclidean'
knn_mat = pdist2(test_matrix,training_matrix,distance);
%score_size=size((training_matrix),1);
%score=zeros([score_size 1]);
test_matrix_size=size((test_matrix),1);
correct=0;
k=K;

    for v=1:test_matrix_size
    [B, I]=sort(knn_mat(v,:));
    class_residual=zeros([312 1]);
              for rev_runner=1:k
              class_residual(training_matrix_classes(I(1,rev_runner),1),1)=class_residual(training_matrix_classes(I(1,rev_runner),1),1)+1;
              end
              [B3, winner_class]=max(class_residual);
              if(test_matrix_labels(v,2)==winner_class)
              correct=correct+1;
              end
    end
accuracy=correct/test_matrix_size;