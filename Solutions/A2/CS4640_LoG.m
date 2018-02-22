function h = CS4640_LoG(x,y,sigma2)
% CS4640_LoG - Laplacian of Gaussian function
% On input:
%     x (double): x value
%     y (double): y value
%     sigma2 (double): variance of Gaussian
% On output:
%     h (double): LoG value
% Call:
%     h = CS4640_LoG(3,2,2);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

h = (-1/(pi*sigma2^2))*(1 - (x^2+y^2)/(2*sigma2))...
    *exp(-((x^2+y^2)/(2*sigma2)));
