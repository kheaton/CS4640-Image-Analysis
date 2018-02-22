function imo = CS4640_median(im,s)
% CS4640_median - compute median value at each pixel
% On input:
%     im (MxN array): input image
%     s (int): median window side length (must be odd)
% On output:
%     imo (MxN array): median filtered image
% Call:
%     imo = CS4640_median(im);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);
imo = zeros(M,N);
k = (s-1)/2;

for r = 1:M
    r_min = max(1,r-k);
    r_max = min(M,r+k);
    for c = 1:N
        c_min = max(1,c-k);
        c_max = min(N,c+k);
        W = im(r_min:r_max,c_min:c_max);
        imo(r,c) = median(W(:));
    end
end
