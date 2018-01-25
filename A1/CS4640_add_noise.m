function imn =
CS4640_add_noise(im,p_min,p_max,noise_type,a,b,mu,sigma2)
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

% rand(50, 50) => generates a random image of that size,
% shift it to the range you need.
% multiple this matrix by ((b-a) + a) * rand(M, N)
% generate thee new image, but it has to be restricted to p_min and p_max, just truncate it

%index = max(1, min(m, fx));
%value = max(p_min, min(p_max, theValue))

% randn(u, sigma2) shift => sigma * randn + u

for r = 1 : M
    for c = 1 : N
        % imNoise = imc + noise 
        % rand samples from uniform dist from 0 to 1
        % 
    end
end
end