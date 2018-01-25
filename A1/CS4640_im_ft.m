function im_FT = CS4640_FT(im)
% CS4640_FT - compute Fourier Transform of image
% On input:
%     im (MxN float array): input image
% On output:
%     im_FT (MxN float array): Fourier Transform of im
% Call:
%     im_FT = CS4640_FT(im);
% Author:
%     Kyle Heaton
% UU
% Spring 2018
%

[M, N] = size(im);
im_FT = zeros(M, N);

for u = 0:M - 1
    for v = 0:N - 1
        s = 0;
        for x = 0:M - 1
            for y = 0:N - 1
                temp = exp(1i*-2*pi*(((u*x)/M)+((v*y)/N)));
                s = s + (im(u+1, v+1) * real(temp));
            end
        end
        im_FT(u+1,v+1) = s;
    end
end

end