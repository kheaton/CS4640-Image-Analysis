function imd = CS4640_im_dist(im1,im2)
% CS4640_im_dist - pixel-wise vector distance between images
% On input:
%   im1 (M1xN1xP1 array): image 1
%   im2 (M2xN2xP2 array): image 2
% On output:
%     imd (M1xN1 array): distace image
% Call:
% imd = CS4640_im_dist(im1,im2);
% Author:
% <Your Name>
% UU
% Spring 2018
%

[m1,n1,p1] = size(im1);
[m2,n2,p2] = size(im2);

if m1 ~= m2 | n1 ~= n2 | p1 ~= p2
    imd = [];
    return
end

for r = 1:m1
    for c = 1:n1
        v1 = reshape(im1(r,c,:), [1,3]);
        v2 = reshape(im2(r,c,:), [1,3]);
        imd(r,c) = norm(v1-v2);
    end
end

end