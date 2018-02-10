function imd = CS4640_im_dist(im1,im2)
% CS4640_im_dist - pixel-wise vector distance between images
% On input:
%     im1 (M1xN1xP1 array): image 1
%     im2 (M2xN2xP2 array): image 2
% On output:
%     imd (M1xN1 array): distace image
% Call:
%     imd = CS4640_im_dist(im1,im2);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

imd = [];
im1 = double(im1);
im2 = double(im2);

[M1,N1,P1] = size(im1);
[M2,N2,P2] = size(im2);
if M1~=M2 | N1~=N2 | P1~=P2
    return
end

imd = zeros(M1,N1);
for r = 1:M1
    for c = 1:N1
        v1 = reshape(im1(r,c,:),[1,P1]);
        v2 = reshape(im2(r,c,:),[1,P2]);
        imd(r,c) = norm(v1-v2);
    end
end
