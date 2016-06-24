function [alpha1,alpha2,alpha3]=updatealpha(dw1,dw2,dw3,dw1Prev,dw2Prev,dw3Prev,alpha1,alpha2,alpha3)

alpha1((dw1>0&dw1Prev>0)|(dw1<0&dw1Prev<0))=alpha1((dw1>0&dw1Prev>0)|(dw1<0&dw1Prev<0))*1.2;
alpha2((dw2>0&dw2Prev>0)|(dw2<0&dw2Prev<0))=alpha2((dw2>0&dw2Prev>0)|(dw2<0&dw2Prev<0))*1.2;
alpha3((dw3>0&dw3Prev>0)|(dw3<0&dw3Prev<0))=alpha3((dw3>0&dw3Prev>0)|(dw3<0&dw3Prev<0))*1.2;

alpha1((dw1>0&dw1Prev<0)|(dw1<0&dw1Prev>0))=alpha1((dw1>0&dw1Prev<0)|(dw1<0&dw1Prev>0))*0.7;
alpha2((dw2>0&dw2Prev<0)|(dw2<0&dw2Prev>0))=alpha2((dw2>0&dw2Prev<0)|(dw2<0&dw2Prev>0))*0.7;
alpha3((dw3>0&dw3Prev<0)|(dw3<0&dw3Prev>0))=alpha3((dw3>0&dw3Prev<0)|(dw3<0&dw3Prev>0))*0.7;

end

