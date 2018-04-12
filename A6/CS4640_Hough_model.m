function D = CS4640_Hough_model(im)
% CS4640_Hough_model - create a Hough shape model
% On input:
%      im (MxN array): binary image with shape
% On output:
%      D (kx2 array): Hough model (offsets to anchor point)
% Call:
%      S_model = CS4640_Hough_model(S_im);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N] = size(im);
[x, y] = find(im, 1);

k = size(im(im == 1), 1);

D = zeros(k, 2);
count = 1;
for row = 1:M
    for col = 1:N
        if(im(row, col) == 1)
          D(count, 1) = row - x;
          D(count, 2) = col - y;
          count = count + 1;
        end
    end
end


end