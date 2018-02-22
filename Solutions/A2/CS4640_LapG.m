function [imo,imzc] = CS4640_LapG(im,s,sigma2)
% CS4640_LapG - Laplacian of Gaussian of image
% On input:
%     im (MxN array): input image
%     s (int): side length of LoG filter
%     sigma2 (double): variance of Gaussian filter
% On output:
%     imo (MxN array): LoG image
%     imzc (MxN arry): zero-crossings
% Call:
%     [imo,imzc] = CS4640_LaG(T1gs,7,3);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);
imo = zeros(M,N);
a = (s+1)/2;

G = CS4640_create_im_gen('CS4640_LoG',s,s,0,-a,a,-a,a,sigma2);
G = CS4640_force_sum(G,0);

imo = conv2(double(im),G,'same');
imzc = CS4640_zc(imo);

