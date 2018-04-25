function [MO,im_ac,x,y] = CS4640_ac(im,x0,y0,alpha,beta,gamma,max_iter)
% CS4640_ac - compute active contour
% On input:
%      im (MxN array): gray-level image
%      x0 (Kx1 vector): x (row) locations for curve
%      y0 (Kx1 vector): y (col) locations for curve
%      alpha (float): coefficient for D2 array
%      beta (float): coefficient for D4 array
%      gamma (float): coefficient for external force vector
%      max_iter (int): max number of iterations
% On output:
%      MO (movie): movie of snake motion
%      im_ac (MxN array): binary array with final curve points
%      x (float): final x values of snake
%      y (float): final y values of snake
% Call:
%      sq = zeros(31,31);
%      sq(11:20,11:20) = 100;
%      [sqc,xf,yf] = CS4640_ac(sq,x0,y0,1,1,0.2,5000);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

    warning('This function is not yet implemented');

end