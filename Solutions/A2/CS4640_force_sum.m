function H_out = CS4640_force_sum(H,v)
% CS4640_force_sum - force the sum of a filter to value v
% On input:
%     H (kxk array): filter kernel
%     v (double): float
% On output:
%     H_out (kxk array): kernel whose sum is v
% Call:
%     H_out = CS4640_force_sum(ones(7,7),1);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

THRESH = 0.00001;

H_out = H;
[M,N] = size(H);
MN = M*N;
w = sum(H(:));

if abs(w-v)<THRESH
    return
end

if w==0&v==0
    return
elseif w==0
    H = H + 1/v;
    return
elseif v==0
    H_out = H - w/MN;
    return
end

H_out = (v/w)*H;
return
