function imo = CS4640_zc(im)
% CS4640_zc - zero crossings
% On input:
%      im (MxN array): input image
% On output:
%      imo (MxN array): zero crossings in image
% Call:
%      imo = CS4640_zc(im);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N] = size(im);
imo = zeros(M, N);

[immag, imdir] = imgradient(im);

for row = 1:M
    for col = 1:N
        zc = 0;
        up = row + 1;
        down = row - 1;
        left = col - 1;
        right = col + 1;
        
        if  up > 1 && up <= M && down > 1 && down < M
            u = imdir(up, col);
            d = imdir(down, col);
            
            if (u < 0 && d > 0) || (u > 0 && d < 0)
                zc = 1;
            end
        end
        
        if  left > 1 && left <= M && right > 1 && right < M
            l = imdir(row, left);
            r = imdir(row, right);
            
            if (l < 0 && r > 0) || (l > 0 && r < 0)
                zc = 1;
            end
        end
        
        imo(row, col) = zc;
    end
end

end