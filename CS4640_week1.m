function CS4640_week1
%

% Matlab image file  (indexed)
load trees
who   % show current (local variables)
imshow(X,map);
X(1:5,1:5)   % indexes
map(1:5,:)   % rgb values for indexes

Xg = ind2gray(X,map);  % convert indexed image to gray level
max(Xg(:))   % treat Xg as linear array

Xt = Xg>0.8;
imshow(Xt);

X_cc = bwlabel(Xt);   % Find connected components
imshow(X_cc);
impixelinfo    % interact with image to get info

combo(Xt,X_cc==1);

sum(sum(X_cc==1))
sum(sum(X_cc==13))

load dist_data
W = im_44(290:342,1116:1214,:);
imshow(W)
Wg = rgb2gray(W);
Wl = Wg<85;
Wl_skel = bwmorph(Wl,'skel',Inf);

combo(Wl,Wl_skel);

Wb = CS4640_boundary(Wl);
imshow(Wb);

% Geometric Operations

pts = [1,1; 2,1; 2,2; 1,2]'
pts = [pts; 1 1 1 1]
T_trans = [1 0 1.5; 0 1 0.7; 0 0 1]
clf
plot(pts(1,:),pts(2,:),'ko');
hold on
axis equal
plot(0,0,'w.');
plot(5,5,'w.');
ptsn = T_trans*pts

plot(ptsn(1,:),ptsn(2,:),'r*');

theta = pi/3;
T_rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1]

ptsr = T_rot*pts
plot(ptsr(1,:),ptsr(2,:),'g+');

ptsb = T_rot*T_trans*pts
plot(ptsb(1,:),ptsb(2,:),'bx');
end
