function [mag,ori] = CS4640_edge(im)
% CS4640_edge - compute edge magnitudes and orientations
% On input:
%     im (MxN array): input image
% On output:
%     mag (MxN array): edge magnitudes
%     ori (Mxn array): edge orientations (gradient direction)
% Call:
%     [mag,ori] = CS4640_edge(im);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[dx,dy] = gradient(im);
mag = sqrt(dx.^2+dy.^2);
ori = posori(atan2(dy,dx));
