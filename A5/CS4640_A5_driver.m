function CS4640_A5_driver()
% CS4640_A5_driver - driver for A5 functions
% On input:
%      N/A
% On output:
%      N/A
% Call:
%      CS4640_A5_driver
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

warning('This function is not yet implemented');

B22 = CS4640_MM_translate(B,23,54,34,35);
Br = CS4640_MM_reflect(B,23,54);
Ac = CS4640_MM_complement(A);
AmB = CS4640_MM_diff(A,B);
Ab = CS4640_MM_boundary(A);
Ab = CS4640_MM_cc(im);
Ach = CS4640_MM_convhull(A);
As = CS4640_MM_skeleton(A);

end