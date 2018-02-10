function [imr,T] = CS4640_register(ref,im,pts)
% CS4640_register - register an image to a reference
% On input:
%     ref (M1xN1 array): reference image
%     im (M2xN2 array): input image
%     pts (nx4 array): corresponding pixels in the two images
%       in order x_ref y_ref v_im w_im
% On output:
%     imr (M1xN1 array): registered version of im
% Call:
%     imr = CS4640_register(ref,im,pts);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M_ref,N_ref] = size(ref);
[M_im,N_im] = size(im);
imr = zeros(M_ref,N_ref);

[num_pts,dummy] = size(pts);

b = zeros(2*num_pts,1);
count = 0;
for p = 1:num_pts
    count = count + 1;
    b(count) = pts(p,3);
    count = count + 1;
    b(count) = pts(p,4);
end

A = zeros(2*num_pts,4);
count = 0;
for p = 1:num_pts
    count = count + 1;
    A(count,1) = pts(p,1);
    A(count,2) = pts(p,2);
    A(count,3) = 1;
    A(count,4) = 0;
    count = count + 1;
    A(count,1) = pts(p,2);
    A(count,2) = -pts(p,1);
    A(count,3) = 0;
    A(count,4) = 1;
end

coef = A\b;
T = zeros(3,3);
T(1,1) = coef(1);
T(1,2) = coef(2);
T(1,3) = coef(3);
T(2,1) = -coef(2);
T(2,2) = coef(1);
T(2,3) = coef(4);
T(3,3) = 1;

for r = 1:M_ref
    for c = 1:N_ref
        rcp = T*[r;c;1];
        r_im = rcp(1);
        c_im = rcp(2);
        if r_im>0&r_im<M_im&c_im>0&c_im<N_im
            rr = max(1,min(ceil(r_im),M_im));
            cc = max(1,min(ceil(c_im),N_im));
            imr(r,c) = im(rr,cc);
        end
    end
end
tch = 0;
