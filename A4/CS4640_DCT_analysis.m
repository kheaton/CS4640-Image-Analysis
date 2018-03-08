function [RMS,components,resim] = CS4640_DCT_analysis(im)
% CS4640_DCT_analysis - compute RMS error for DCT image encoding
% On input:
%      im (MxN array): gray level image
% On output:
%      RMS (101x1 vector): RMS error between original and encoded image
%      components (101x1 vector): percentage of non-zero components
%      in coded image
%      resim (101x1 struct vector): has decoded images
%      (k).im (PxP array): inverse image of DCT coded image
%      where k = 1:101, and for k_th image, all components with
%      less than (k-1)*0.01*max_component_value are set to 0
% Call:
%      [res,resim] = CS4640_DCT_analysis(lennag);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

warning('Function not yet implemented');

end