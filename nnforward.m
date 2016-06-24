function [a1,a2,a3,a4 ]=nnforward(x,w1,w2,w3);
a1=x;
z2=a1*w1;
a2=tanh(z2);
z3=a2*w2;
a3=tanh(z3);
z4=a3*w3;
a4=sigmoid(z4);
end

