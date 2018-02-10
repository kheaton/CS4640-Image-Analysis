function imc = CS4640_center(im)
% CS4640_center - center image for Fourier transform
% On input:
%      im (MxN array): input image
% On output:
%      imc (MxN array): centered image
% Call:
%      imc = CS4640_center(im);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N] = size(im);
imc = zeros(M, N);

for row = 1 : M
    for col = 1 : N
        imc(row, col) = im(row, col) * power(-1, row + col);
    end    
end

end