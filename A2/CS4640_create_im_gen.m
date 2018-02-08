function im = ...
CS4640_create_im_gen(f_name,M,N,Q,x_min,x_max,y_min,y_max,args)
% CS4640_create_im_gen - create an image from a function with arguments
% On input:
%     f_name (string): name of function
%     M (int): number of rows in image
%     N (int): number of cols in image
%     Q (int): number of quantization levels in image
%     x_min (float): min x value for planar patch
%     x_max (float): max x value for planar patch
%     y_min (float): min y value for planar patch
%     y_max (float): max y value for planar patch
%     args (1xq vector): arguments for function (in addition to x,y)
% On output:
%     im (MxN array): image
% Call:
%     im = CS4640_creat_im_gen(’CS4640_LoG’,100,100,64,-4,4,-4,4,2);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

im = zeros(M, N);

for u = 1 : x_max - x_min
    for v = 1 : y_max - y_min
        x = u + x_min;
        y = v + y_min;
        
        if isempty(args)
            im(u, v) = feval(f_name, x, y);
        else
            im(u, v) = feval(f_name,x,y,args);
        end
    end
end

if Q == 0
    return
end

max_value = max(im);
min_value = min(im);

for u = 1 : x_max - x_min
    for v = 1 : y_max - y_min
       im(u, v) = (((Q - 1) * (im(u,v) - min_value)) / (max_value - min_value));
    end
end
%im = (((Q - 1) * (im - min_value)) / (max_value - min_value));
end