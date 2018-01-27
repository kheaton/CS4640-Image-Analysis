function imb = CS4640_boundary(im)
% CS4640_boundary - find boundary pixels
% On input:
%     im (MxN array): binary image
% On output:
%     imb (MxN array): binary boundary image
% Call:
%     imb = CS4640_boundary(im);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);
imb = zeros(M,N);

for r = 1:M
    for c = 1:N
        r_min = max(1,r-1);
        r_max = min(M,r+1);
        c_min = max(1,c-1);
        c_max = min(N,c+1);
        for rr = r_min:r_max
            for cc = c_min:c_max
                if im(r,c)==1&im(rr,cc)==0
                    imb(r,c) = 1;
                end
            end
        end
    end
end