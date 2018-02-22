function g = CS4640_Gaussian(x,y,v)
%

mux = v(1);
muy = v(2);
sigma2 = v(3);

g = exp(-((x-mux)^2+(y-muy)^2)/(2*sigma2));
