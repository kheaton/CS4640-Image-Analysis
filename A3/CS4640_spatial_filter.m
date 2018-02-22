function g = CS4640_spatial_filter(im_in,H)
% CS4640_spatial_filter - spatial domain filtering
% On input:
%      im_in (MxN double array): input image
%      H (kxk double array, k odd): filter
% On output:
%      g (MxN double array): filtered image; i.e., im_in<conv>H
% Call:
%      im_lp = CS4640_spatial_filter(im,ones(7,7)/49);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[Mf, Nf] = size(H);
if Mf ~= Nf || mod(Mf, 2) == 0
    g = [];
    return
end

%g = imfilter(im_in, H);
g = conv2(im_in, H);
%use conv2

end