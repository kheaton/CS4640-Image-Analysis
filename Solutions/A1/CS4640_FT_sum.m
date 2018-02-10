function s = CS4640_FT_sum(im,u,v)
% CS4640_FT_sum - Fourier Transform sum
% On input:
%     im (MxN float array): input image
%     u (float): x frequency value
%     v (float): y frequency value
% On output:
%     s (complex): Fourier Transform sum
% Call:
%     s = CS4640_FT_sum(im,2,3);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);

s = 0;
for x = 0:M-1
    for y = 0:N-1
        s = s + im(x+1,y+1)*exp(-i*2*pi*(u*x/M+v*y/N));
    end
end
