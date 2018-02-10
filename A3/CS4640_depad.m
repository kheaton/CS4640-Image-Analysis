function im_depad = CS4640_depad(im,M,N)
% CS4640_im_depad - depad an image for frequency domain filtering
% On input:
%      im (PxQ double array): padded input image
% On output:
%      im_depad (MxN double array): upper MxN of im
% Call:
%      imdp = CS4640_depad(im,M,N);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

im_depad = zeros(M, N);

for row = 1 : M
    for col = 1 : N
        im_depad(row, col) = im(row, col);
    end    
end

end