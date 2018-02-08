function CS4640_A2_driver
% CS4640_A2_driver - driver for A2 functions
% On input:
%      N/A
% On output:
%      N/A
% Call:
%      CS4640_A2_driver
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

batman = imread('A2-batman.jpg', 'jpg');
greybat = rgb2gray(batman);

%edge
[mag, ori] = CS4640_edge(greybat);

%hessian
imh = CS4630_Hessian(greybat);

% median
randomMatrix = randi([1, 10], 10);
imo = CS4640_median(randomMatrix, 3);

%imgen
imgen = CS4640_create_im_gen("CS4640_hemisphere",10,10,100,-4,4,-4,4, []);

%zc
imo = CS4640_zc(greybat);

%LoG
h = CS4640_LoG(3,2,2);

%LapG
[imo,imzc] = CS4640_LapG(greybat,7,3);

end