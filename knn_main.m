knn_mat=validation_matrix*training_matrix';
score_size=size((training_matrix),1);
t_residual=zeros([1 score_size]);
score=zeros([score_size-1 1]);
validation_matrix_size=size((validation_matrix),1);
class_residual=zeros([312 1]);
for k=1:15

    for v=1:validation_matrix_size
    [B, I]=sort(knn_mat(v,:));
    class_residual=zeros([312 1]);
              for rev_runner=score_size-k+1:score_size
              class_residual(training_matrix_classes(I(1,rev_runner),1),1)=class_residual(training_matrix_classes(I(1,rev_runner),1),1)+1;
              end
              [B3, winner_class]=max(class_residual);
              if(validation_matrix_labels(v,2)==winner_class)
              score(k,1)=score(k,1)+1;
              end
    end
    
end
[B optimum_K]=max(score(:,1));