function im_FTi = CS4640_FTi(im)
% CS4640_FTi - compute inverse Fourier Transform of image
% On input:
%     im (MxN array): input image
% On output:
%     im_FTi (MxN float array): inverse Fourier Transform of im
% Call:
%     im_FTi = CS4640_FTi(im);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);
im_FTi = zeros(M,N);
for x = 0:M-1
    for y = 0:N-1
        im_FTi(x+1,y+1) = CS4640_FTi_sum(im,x,y);
    end
end
