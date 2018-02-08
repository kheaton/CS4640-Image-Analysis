function H_im = CS4630_Hessian(im)
% CS4640_Hessian - compute the eigenvalues of the Hessian at each pixel
% On input:
%      im (MxN array): graylevel image
% On output:
%      H_im (MxNx2 array): 2-channels with eigenvalues of Hessian
% Call:
%      H = CS4640_Hessian(im);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%
[M,N] = size(im);
H_im = zeros(M, N, 2);

[dx, dy] = imgradient(im);

[dxx, dxy] = gradient(dx);
[dyx, dyy] = gradient(dy);

for r = 1:M
    for c = 1:N
        h = [dxx(r,c), dxy(r,c);...
             dyx(r,c), dyy(r,c)];
        d = eigs(h);
        H_im(r, c, 1) = d(1);
        H_im(r, c, 2) = d(2);
    end
end
   
end
