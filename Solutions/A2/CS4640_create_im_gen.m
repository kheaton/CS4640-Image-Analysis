function im = CS4640_create_im_gen(f_name,M,N,Q,x_min,x_max,y_min,y_max,...
    args)
% CS4640_create_im_gen - create an image from a function with arguments
% On input:
%     f_name (string): name of function
%     M (int): number of rows in image
%     N (int): number of cols in image
%     Q (int): number of quantization levels in image
%       if Q==0, return the actual function values
%       else return values in set {0,1,...,Q-1}
%     x_min (float): min x value for planar patch
%     x_max (float): max x value for planar patch
%     y_min (float): min y value for planar patch
%     y_max (float): max y value for planar patch
%     args (1xq vector): arguments for function (in addition to x,y)
% On output:
%     im (MxN array): image
% Call:
%     im = CS4640_creat_im_gen('CS4640_LoG',100,100,64,-4,4,-4,4,2);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

im = zeros(M,N);
x_spread = x_max - x_min;
y_spread = y_max - y_min;
x_vals = [x_min:x_spread/N:x_max];
x_samps = zeros(N,1);
for s = 2:N+1
    x_samps(s-1) = mean(x_vals(s-1:s));
end
y_vals = [y_min:y_spread/M:y_max];
y_samps = zeros(M,1);
for s = 2:M+1
    y_samps(s-1) = mean(y_vals(s-1:s));
end
f = zeros(M,N);
for r =1:M
    y = y_samps(M-r+1);
    for c = 1:N
        x = x_samps(c);
        if isempty(args)
            f(r,c) = feval(f_name,x,y);
        else
            f(r,c) = feval(f_name,x,y,args);
        end
    end
end
if Q==0
    im = f;
    return
end

f_min = min(f(:));
f_max = max(f(:));
f_spread = f_max - f_min;
f_vals = [f_min:f_spread/Q:f_max];
for r = 1:M
    for c = 1:N
        indexes = find(f_vals>=f(r,c));
        im(r,c) = min(indexes) - 1;
    end
end
