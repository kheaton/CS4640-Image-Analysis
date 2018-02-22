function imo = CS4640_zc(im)
% CS4640_zc - zero crossings
% On input:
%     im (MxN array): input image
% On output:
%     imo (MxN array): zero crossings in image
% Call:
%     imo = CS4640_zc(im);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);
imo = zeros(M,N);

for r = 1:M
    r_min = max(1,r-1);
    r_max = min(M,r+1);
    for c = 1:N
        c_min = max(1,c-1);
        c_max = min(N,c+1);
        W = im(r_min:r_max,c_min:c_max);
        W = W(:);
        if min(W)<0&max(W)>0
            imo(r,c) = 1;
        end
    end
end
