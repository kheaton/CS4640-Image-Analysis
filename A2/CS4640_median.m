function imo = CS4640_median(im,s)
% CS4640_median - compute median value at each pixel
% On input:
%      im (MxN array): input image
%      s (int): median window side length (must be odd)
% On output:
%      imo (MxN array): median filtered image
% Call:
%      imo = CS4640_median(im);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N] = size(im);
imo = zeros(M, N);
windowSize = fix(s / 2);

for r = 1:M
    for c = 1:N
        med = nan(s);
        for srow = 1 : s
            for scol = 1 : s
                
                rcomp = r - windowSize + srow;
                ccomp = c - windowSize + scol;
                
                if rcomp > 1 && rcomp <= M && ccomp > 1 && ccomp <= N
                    med(srow, scol) = im(rcomp, ccomp);
                end
                
                
                %if (srow - windowSize) > 1 && (srow + windowSize <= M) ...
                %    && (scol - windowSize > 1) && (scol + windowSize <= N)   
                %end
            end
        end

        imo(r, c) = median(med(:), 'omitnan');
    end
end

end
