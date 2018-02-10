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

batman = imread('lego-batman.jpg', 'jpg');
graybatman = rgb2gray(batman);
[M, N] = size(graybatman);

% CS4640_pad
pad_bat = CS4640_pad(graybatman, M * 2, N * 2);
pad_bat = mat2gray(pad_bat);

% CS4640_center
center_bat = CS4640_center(pad_bat);
center_bad = mat2gray(center_bat);
surf(center_bat);

% CS4640_power_spectrum

% CS4640_spatial_filter

% CS4640_freq_filter

% CS4640_depad
depad_bat = CS4640_depad(center_bat, M, N);


end