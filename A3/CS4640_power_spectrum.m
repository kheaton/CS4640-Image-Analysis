function imP = CS4640_power_spectrum(im,centered)
% CS4640_power_spectrum - power spectrum of FT of image
% On input:
%      im (MxN double array): input image
%      centered (Boolean): if 1 centered, else not
% On output:
%      imP (MxN double array): power spectrum
% Call:
%      imP = CS4640_power_spectrum(im,1);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N] = size(im);
imP = zeros(M, N);
imc = im;
if centered == 1
    imc = CS4640_center(imc);
end

imf = fft2(imc);

for row = 1 : M
    for col = 1 : N
        imP(row, col) = real(imf(row, col))^2 + imag(imf(row,col))^2;
    end
end

end