function g = CS4640_freq_filter(im_in,H)
% CS4640_freq_filter - frequency domain filtering
% On input:
%      im_in (MxN double array): input image
%      H (kxk double array, k odd): filter
% On output:
%      g (MxN double array): filtered image; i.e.,
%      Fˆ{-1}[F(im_in).*F(H)]
% Call:
%      im_lp = CS4640_freq_filter(im,ones(7,7)/49);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%
[M, N] = size(im_in);
[Mf, Nf] = size(H);
if Mf ~= Nf || mod(Mf, 2) == 0
    g = [];
    return
end
P = M + Mf + 1;
Q = N + Nf + 1;

H_pad = CS4640_pad(H, P, Q);
H_center = CS4640_center(H_pad);
H_ft = fft2(H_center);

f_pad = CS4640_pad(im_in, P, Q);
f_center = CS4640_center(f_pad);
f_ft = fft2(f_center);

G_ft = f_ft .* H_ft;
G_ift = ifft2(G_ft);
G_real = real(G_ift);

G_pad = CS4640_center(G_real);
g = CS4640_depad(G_pad, M, N);

end