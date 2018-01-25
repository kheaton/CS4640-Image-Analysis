function imn = CS4640_add_noise(im,p_min,p_max,noise_type,a,b,mu,sigma2)
% CS4640_add_noise - add uniform or Gaussian noise
% On input:
%     im (MxN image): input image
%     p_min (float): minimum gray level in noise image
%     p_max (float): maximum gray level in noise image
%     noise_type (int): 1: uniform; 2: Gaussian
%     a (float): lower limit on uniform range
%     b (float): upper limit on uniform range
%     mu (float): mean of N(mu,sigma2)
%     sigma2 (float): variance of N(mu,sigma2)
% On output
%     imn (MxN array): noise image
% Call:
%     imn = CS4640_add_noise(im3,2,10,1,0,1,0,.0001);
% Author:
%     Kyle Heaton
% UU
% Spring 2018
%

[M, N] = size(im);
imn = zeros(M, N);

if(noise_type == 1) %Uniform
    imn = double(im) + (rand(M, N) * (b - a)) + a;
    %imn = max(p_min, min(p_max, imn));
elseif(noise_type == 2)
    imn = double(im) + normrnd(mu, sqrt(sigma2), M, N);
    %imn = max(p_min, min(p_max, imn));
end

end