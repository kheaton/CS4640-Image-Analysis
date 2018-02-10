function s = CS4640_FTi_sum(im,x,y)
% CS4640_FTi_sum - inverse Fourier Transform sum
% On input:
%     im (MxN float array): input image
%     x (float): u spatial value
%     y (float): v spatial value
% On output:
%     s (complex): inverse Fourier Transform sum
% Call:
%     s = CS4640_FTi_sum(im,2,3);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);

s = 0;
for u = 0:M-1
    for v = 0:N-1
        s = s + im(u+1,v+1)*exp(i*2*pi*(u*x/M+v*y/N));
    end
end
s = s/(N*M);
