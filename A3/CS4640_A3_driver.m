function CS4640_A3_driver
% CS4640_A3_driver - driver for A3 functions
% On input:
%      N/A
% On output:
%      N/A
% Call:
%      CS4640_A3_driver
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

load trees;
load im;

batman = imread('lego-batman.jpg', 'jpg');
graybatman = rgb2gray(batman);
[M, N] = size(graybatman);

% CS4640_pad
pad_bat = CS4640_pad(graybatman, M * 2, N * 2);
pad_bat = mat2gray(pad_bat);

% CS4640_center
center_bat = CS4640_center(pad_bat);
center_bat = mat2gray(center_bat);
%surf(center_bat);

% CS4640_power_spectrum
power_bat = CS4640_power_spectrum(pad_bat, 0);
%imshow(power_bat);

%imshow(trees);
pstree = CS4640_power_spectrum(im, 1);
%surf(pstree);

% CS4640_spatial_filter
im_filtered = CS4640_spatial_filter(graybatman, ones(7, 7)/49);
%imshow(mat2gray(im_filtered));

% CS4640_freq_filter
freq_filter = CS4640_freq_filter(trees,ones(7,7)/49);
imshow(mat2gray(freq_filter));

% CS4640_depad
depad_bat = CS4640_depad(center_bat, M, N);


end