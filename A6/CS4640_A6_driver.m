function CS4640_A6_driver
% CS4640_A6_driver - driver for A6 functions
% On input:
%      N/A
% On output:
%      N/A
% Call:
%      CS4640_A6_driver
% Author:
%      Kyl Heaton
%      UU
%      Spring 2018
%

binary = imresize(imread('binary.png') > 1, [15, 15]);
lights = imread('lights.jpg');

S_model = CS4640_Hough_model(binary);

D = S_model;

[H,H2] = CS4640_Hough_detect(binary, D); 

[line_im,lines1] = CS4640_lines(rgb2gray(lights) > 100,1.5,0.96);
%imshow(mat2gray(line_im));

s = CS4640_kmeans(lights,4); 
%imshow(mat2gray(s));

end