function [H,H2] = CS4640_Hough_detect(im,D)
% CS4640_Hough_detect - detect a Hough shape model
% On input:
%       im (MxN array): binary image with shape
%       D (kx2 array): Hough offset model
% On output:
%       H (M1xN1 array): Hough accumulator array (note it is bigger
%                        than MxN since it has to allow for the 
%                        largest offset
%      H2 (MxN array): part of accumulator overlapping with original
%                      image
% Call:
%      [H,H2] = CS4640_Hough_detect(im,D);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N] = size(im);
maxOffset = max(D, [], 1);

H = zeros(M + maxOffset(1), N + maxOffset(2));

k = size(D, 1);

for row = 1:M
    for col = 1:N
        for index = 1:k
            x = D(index, 1) + row;
            y = D(index, 2) + col;
            
            H(x, y) = H(x, y) + 1;
        end
    end
end

% Not sure if this is correct
H2 = imresize(H, [M, N]);

end