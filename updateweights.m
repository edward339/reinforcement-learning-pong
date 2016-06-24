function [w1,w2,w3] = updateweights(w1,w2,w3,alpha1,alpha2,alpha3,dw1,dw2,dw3);

w3=w3-alpha3.*sign(dw3);
w2=w2-alpha2.*sign(dw2);
w1=w1-alpha1.*sign(dw1);
end

