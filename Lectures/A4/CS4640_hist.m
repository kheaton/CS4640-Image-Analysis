function [h,ch] = CS4640_hist(im)
%

h = zeros(1,256);
ch = h;

[M,N] = size(im);

for r = 1:M
    for c = 1:N
        index = max(1,floor(im(r,c)));
        h(index) = h(index) + 1;
    end
end

total = sum(h);

for v = 1:256
    ch(v) = sum(h(1:v));
end

ch = ch/total;
