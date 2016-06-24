function [dw1,dw2,dw3,dw1Prev,dw2Prev,dw3Prev] = getgrads(trainY,a1,a2,a3,a4,w1,w2,w3,dw1,dw2,dw3)
dw3Prev=dw3;
dw2Prev=dw2;
dw1Prev=dw1;


dw3=(((a4-trainY).*a4.*(1-a4))'*a3)';
dw2=(((a4-trainY)  .*  a4.*(1-a4)  *w3'  .*   (1-a3.^2) )'   *   a2)';
dw1=(((a4-trainY) .* a4.*(1-a4) * w3' .* (1-a3.^2)  *w2' .*(1-a2.^2))'  *a1)';

end
