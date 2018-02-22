function res = A2_test
%

res = zeros(13,2);
res(:,1) = [1:13]';

im = zeros(10,10);
[mag,ori] = CS4640_edge(im);
if isequal(mag,zeros(10,10))
    res(1,2) = 1;
end
if isequal(ori,zeros(10,10))
    res(2,2) = 1;
end

im = zeros(11,11);
im(4:8,4:8) = 1;
[mag,ori] = CS4640_edge(im);
im_mag = zeros(11,11);
im_mag(3,4:8) = 0.5;
im_mag(4,3) = 0.5;
im_mag(4,4) = 0.7071;
im_mag(4,5:7) = 0.5;
im_mag(4,8) = 0.7071;
im_mag(4,9) = 0.5;
im_mag(5,3:4) = 0.5;
im_mag(5,8:9) = 0.5;
im_mag(6,3:4) = 0.5;
im_mag(6,8:9) = 0.5;
im_mag(7,3:4) = 0.5;
im_mag(7,8:9) = 0.5;
im_mag(8,3) = 0.5;
im_mag(8,4) = 0.7071;
im_mag(8,5:7) = 0.5;
im_mag(8,8) = 0.7071;
im_mag(8,9) = 0.5;
im_mag(9,4:8) = 0.5;
mag_dif = sum(abs(mag-im_mag))/121;
if mag_dif<0.5
    res(3,2) = 1;
end
ori = posori(ori);
indexes = find(ori>0&ori<2);
res(4,2) = length(indexes)==9;
indexes = find(ori>2&ori<4);
res(5,2) = length(indexes)==10;
indexes = find(ori>4&ori<6);
res(6,2) = length(indexes)==9;

imc = CS4640_create_im_gen('CS4640_sinusoid',41,101,0,-9,9,-2,2,[]);
imcH = CS4640_Hessian(imc);
if max(max(imcH(:,:,2)))==0
    res(7,2) = 1;
end
if (max(max(imcH(:,:,1)))+min(min(imcH(:,:,1))))<0.001
    res(8,2) = 1;
end

im = ones(101,101);
im(3:5:end,3:5:end) = 10;
im_med = CS4640_median(im,5);
if max(max(im_med))==1&min(min(im_med))==1
    res(9,2) = 1;
end

imc = CS4640_create_im_gen('CS4640_Gaussian',101,101,0,-3,3,-3,3,[0,0,2]);
if sum(imc(:))>3200&sum(imc(:))<3400
    res(10,2) = 1;
end

sigma2 = 2;
x = pi;
y = -pi;
h = (-1/(pi*sigma2^2))*(1 - (x^2+y^2)/(2*sigma2))...
    *exp(-((x^2+y^2)/(2*sigma2)));
if abs(CS4640_LoG(x,y,sigma2)-h)<0.001
    res(11,2) = 1;
end

im = zeros(11,21);
im(:,8:14) = 1;
[LapG,zc] = CS4640_LapG(im,3,2);
pline = [0,0,0,0,0,0,0.0336,-0.0336,0,0,0,0,0,-0.0336,0.0336,0,0,0,0,0,0];
L_dif = sum(abs(pline-LapG(10,:)))/21;
if L_dif<0.001
    res(12,2) = 1;
end
zcline = [0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,0,0,0,0,0,0];
zc_dif = sum(abs(zcline-zc(10,:)))/21;
if zc_dif<0.001
    res(13,2) = 1;
end

tch = 0;
