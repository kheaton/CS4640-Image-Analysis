function CS4640_A1_driver_tch
% CS4640_A1_driver - driver to test A1 functions
% On input:
%     N/A
% On output:
%     N/A
% Call:
%     CS4640_A1_driver
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

% Test create image
imc = CS4640_create_im('CS4640_hemisphere',100,100,256,-3,5,-4,4);
% Show as graylevel and surf; show with sinusoid

% Test image dist
load dist_data
imd = CS4640_im_dist(im_34,im_44);

% Test FT
ims = CS4640_create_im('CS4640_sinusoid',50,50,256,-30,30,-3,3);
imsFT = CS4640_FT(ims);
imsiFT = CS4640_FTi(imsFT);

% Test register
load demo_register
[imr,Tr] = CS4640_register(im,imt10,pts);

% Test noise
im = zeros(100,100);
for c = 1:100
    im(:,c) = c;
end
imnu = CS4640_add_noise(im,0,100,1,0,5,0,0);
imnG = CS4640_add_noise(im,0,100,2,0,0,0,0.01);
tch = 0;
