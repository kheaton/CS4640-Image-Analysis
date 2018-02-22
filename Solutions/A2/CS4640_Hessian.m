function H_im = CS4630_Hessian(im)
% CS4640_Hessian - compute the eigenvalues of the Hessian at each pixel
% On input:
%     im (MxN array): graylevel image
% On output:
%     H_im (MxNx2 array): 2-channels with eigenvalues of Hessian
% Call:
%     H = CS4640_Hessian(im);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);
H_im = zeros(M,N,3);

[dx,dy] = gradient(im);
[dxx,dxy] = gradient(dx);
[dyx,dyy] = gradient(dy);
wb = waitbar(0,'Hessian');
for r = 1:M
    waitbar(r/M);
    for c = 1:N
        H = [dxx(r,c),dxy(r,c); dyx(r,c) dyy(r,c)];
        [V,D] = eigs(H);
        H_im(r,c,1) = D(1,1);
        H_im(r,c,2) = D(2,2);
        H_im(r,c,3) = im(r,c);
    end
end
close(wb);
