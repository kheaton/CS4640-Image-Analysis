function im = CS4640_create_im(f_name,M,N,Q,x_min,x_max,y_min,y_max)
% CS4640_create_im - create an image from a function
% On input:
%     f_name (string): name of function
%     M (int): number of rows in image
%     N (int): number of cols in image
%     Q (int): number of quantization levels in image
%     x_min (float): min x value for planar patch
%     x_max (float): max x value for planar patch
%     y_min (float): min y value for planar patch
%     y_max (float): max y value for planar patch
% On output:
%     im (MxN array): image
% Call:
%     im = CS4640_create_im(’CS4640_hemisphere’,100,100,64,-4,4,-4,4);
% Author:
%     Kyle Heaton
% UU
% Spring 2018
%

im = zeros(M, N);
func = str2func(f_name);

for u = 1 : x_max - x_min
    for v = 1 : y_max - y_min
        x = u + x_min;
        y = v + y_min;
        
        im(u, v) = func(x, y);
    end
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