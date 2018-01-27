function imt = CS4640_transform(im,T)
% CS4640_transform - image coordinate transform
% On input:
%     im (MxN array): input image
%     T (3x3 array): transform array
%        cos(theta) -sin(theta) dx
%        sin(theta)  cos(theta) dy
%            0           0       1
% Call:
%     imt = CS4640_transform(im,[cosd(10) -sind(10) 3;...
%          sind(10) cosd(10) 5; 0 0 1]);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

[M,N] = size(im);
imt = zeros(M,N);

[x_vals,y_vals] = find(im>=0|im<=0);
pts = [[x_vals,y_vals]';ones(1,length(x_vals))];

ptsp = T*pts;
x_valsp = ptsp(1,:);
y_valsp = ptsp(2,:);

for p = 1:length(x_valsp)
    x = floor(x_valsp(p));
    y = floor(y_valsp(p));
    if x>1&x<M&y>1&y<N
        imt(x,y) = im(x_vals(p),y_vals(p));
    end
end

imt = bwmorph(imt,'fill');