function [state, control] = updatepaddle(SETUP,state,trains,w1,w2,w3)

control=zeros(1,3);



% Random control choice
if trains<1 || randi(SETUP(10))==SETUP(10)
r=randi(3);
control(r)=1;
else %Predict Q*(s,a) using neural network
    x=repmat(state,[3,1]);  
    c=[[1 0 0];[0 1 0];[0 0 1]];    
    x=[x c];
    x=bsxfun(@rdivide,x,[SETUP(1),SETUP(2),2,2,SETUP(1),1,1,1]);
    [~,~,~,a4]=nnforward(x,w1,w2,w3);
    %idx=sum(rand>=cumsum(a4./sum(a4)))+1; % Probabalistically
    [~,idx]=max(a4); %Deterministically
    control(idx)=1;
end


% Paddle moves up
if control(1) == 1 && state(5)>1
    state(5) = state(5)-1;
end

% Paddles moves down
if control(3) == 1 && state(5)<SETUP(1)-SETUP(3)+1
    state(5) = state(5) +1;
end

    

end

