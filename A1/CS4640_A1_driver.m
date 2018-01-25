function CS4640_A1_driver
% CS4640_A1_driver - driver for A1 functions
% On input:
%     N/A
% On output:
%     N/A
% Call:
%     CS4640_A1_driver
% Author:
%     Kyle Heaton
% UU
% Spring 2018
%

% Create image
im = CS4640_create_im("CS4640_hemisphere",10,10,100,-4,4,-4,4);
%surf(im);

% Image distance
batman1 = imread('batman1.jpg', 'jpg');
batman2 = imread('batman2.jpg', 'jpg');
avengers = imread('avengers.jpg', 'jpg');

dist = CS4640_im_dist(batman1, batman1);
%imshow(dist);

dist = CS4640_im_dist(batman1, batman2);
%imshow(dist);

% Image Noise
batman1_gray = rgb2gray(batman1);
nbatman = CS4640_add_noise(batman1_gray,0,10,1,0,1,0,.0001);
%imshow(nbatman);
nbatman = CS4640_add_noise(batman1_gray,0,10,1,0,2,0,.0001);
%imshow(nbatman);

% Fourier Transformation
avengers_gray = rgb2gray(avengers);
ft_avengers = CS4640_im_ft(imresize(avengers_gray, .5));
imshow(ft_avengers);



end