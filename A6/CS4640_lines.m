function [lines_im,lines] = CS4640_lines(im,mag_thresh,ori_thresh)
% CS4640_lines - produce straight line setgments for image
% On input:
%      im (MxN array): binary line image
%      mag_thresh (float): edge magnitude threshold
%      ori_thresh (float radians): max distance for similar
%                                  orientations
% On output:
%      lines_im (MxN array): image of lines (they are numbered)
%      lines (kx3 array): line segments
%      col 1: row value
%      col 2: col value
%      col 3: line index
% Call:
%      [line_im,lines1] = CS4640_lines(im,1.5,0.96);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N] = size(im);
k = size(find(im), 1);

lines_im = zeros(M, N);
lines = zeros(k, 3);

[mag, ori] = imgradient(im);
count = 1;
for row = 1:M
    for col = 1:N
        %Check if magnitude and orientation is in threshold
        if mag(row,col)-mag_thresh > 0 && ori(row,col)-ori_thresh > 0
            
            %I didn't have the time to get each segment and number them
            lines_im(row, col) = 1;
            lines(count, 1) = row;
            lines(count, 2) = col;
            lines(count, 3) = 1;
            
            count = count + 1;
        end
    end
end

end