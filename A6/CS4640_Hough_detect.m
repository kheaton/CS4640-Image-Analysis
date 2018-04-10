function [H,H2] = CS4640_Hough_detect(im,D)
% CS4640_Hough_detect - detect a Hough shape model
% On input:
%       im (MxN array): binary image with shape
%       D (kx2 array): Hough offset model
% On output:
%       H (M1xN1 array): Hough accumulator array (note it is bigger
%                        than MxN since it has to allow for the 
%                        largest offset
%      H2 (MxN array): part of accumulator overlapping with original
%                      image
% Call:
%      [H,H2] = CS4640_Hough_detect(im,D);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

warning('This function not yet implemented');

end