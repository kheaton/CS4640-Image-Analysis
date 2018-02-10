function im_FT = CS4640_FT(im)
% CS4640_FT - compute Fourier Transform of image
% On input:
%     im (MxN float array): input image
% On output:
%     im_FT (MxN float array): Fourier Transform of im
% Call:
%     im_FT = CS4640_FT(im);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);
im_FT = zeros(M,N);
for u = 0:M-1
    for v = 0:N-1
        im_FT(u+1,v+1) = CS4640_FT_sum(im,u,v);
    end
end
