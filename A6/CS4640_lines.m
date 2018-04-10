function [lines_im,lines] = CS4640_lines(im,mag_thresh,ori_thresh)
% CS4640_lines - produce straight line setgments for image
% On input:
%      im (MxN array): binary line image
%      mag_thresh (float): edge magnitude threshold
%      ori_thresh (float radians): max distance for similar
%                                  orientations
% On output:
%      lines_im (MxN array): image of lines (they are numbered)
%      lines (kx3 array): line segments
%      col 1: row value
%      col 2: col value
%      col 3: line index
% Call:
%      [line_im,lines1] = CS4640_lines(im,1.5,0.96);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

warning('This function not yet implemeneted');

end