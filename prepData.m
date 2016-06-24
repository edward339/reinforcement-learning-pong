function [train_dat train_lab test_dat test_lab ] = prepData( mnist)
% Prep data get 3s and 7s only, normalise data between 0 and 1 for ReLU

targ=[3,7];
targ_train=ismember(mnist.train_labels,targ);
train_dat=double(mnist.train_images(:,:,targ_train))./255;%normalise
train_dat=double(reshape(train_dat,[28*28,length(train_dat)])'); 
train_lab=double(mnist.train_labels(targ_train));
train_lab(train_lab==3)=0; %re-index 3 to 1
train_lab(train_lab==7)=1; %re-index 7 to 2
% tr_tmp=zeros(length(train_lab),1);    %convert labs to binary matrix (l,2)
% for i =1:length(tr_tmp)    
%     tr_tmp(i,train_lab(i))=1;
% end
% train_lab=tr_tmp;


targ_test=ismember(mnist.test_labels,targ);
test_dat=double(mnist.test_images(:,:,targ_test))./255;  %normalise
test_dat=double(reshape(test_dat,[28*28,length(test_dat)])');
test_lab=double(mnist.test_labels(targ_test));
test_lab(test_lab==3)=0; %re-index 3 to 1
test_lab(test_lab==7)=1; %re-index 7 to 2

% te_tmp=zeros(length(test_lab),1);    %convert labs to binary matrix (l,2)
% for i =1:length(te_tmp)    
%     te_tmp(i,test_lab(i))=1;
% end
% test_lab=te_tmp;


end
