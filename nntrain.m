function [ w1,w2,w3,dw1,dw2,dw3,alpha1,alpha2,alpha3,trains ] = nntrain(memory,w1,w2,w3,dw1,dw2,dw3,alpha1,alpha2,alpha3,SETUP,trains,j,miss,score )
if j>SETUP(5) && rem(j,SETUP(7))==0
    for i=1:SETUP(9)
        idx = randsample(SETUP(5),SETUP(6));
        x=memory(idx,1:end-1);

        x=bsxfun(@rdivide,x,[SETUP(1),SETUP(2),2,2,SETUP(1),1,1,1]);
        y=memory(idx,end);
        [a1,a2,a3,a4 ] = nnforward(x,w1,w2,w3);
        [dw1,dw2,dw3,dw1Prev,dw2Prev,dw3Prev] = getgrads(y,a1,a2,a3,a4,w1,w2,w3,dw1,dw2,dw3);
        [alpha1,alpha2,alpha3]=updatealpha(dw1,dw2,dw3,dw1Prev,dw2Prev,dw3Prev,alpha1,alpha2,alpha3);
        [w1,w2,w3] = updateweights(w1,w2,w3,alpha1,alpha2,alpha3,dw1,dw2,dw3);
    end
    trains=trains+1;
     fprintf('TRAINING: %d / %d\n', trains, SETUP(8));
     fprintf('Accuracy: %d\n', score/(miss+score));

end

