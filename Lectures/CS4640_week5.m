function CS4640_week5
%

f_box = zeros(1,101);
f_box(49:51) = 1;
plot(f_box);

f_boxF = fft(f_box);
plot(real(f_boxF).^2 + imag(f_boxF).^2);
f_boxF = fft(CS4640_center(f_box));
plot(real(f_boxF).^2 + imag(f_boxF).^2);

f_box(44:56) = 1;
f_boxF = fft(CS4640_center(f_box));
plot(real(f_boxF).^2 + imag(f_boxF).^2);

f_sinc = CS4640_create_im_gen('CS4640_sinc',1,101,0,-9,9,-9,9,[]);
plot(f_sinc)
f_sincF = fft(CS4640_center(f_sinc));
plot(real(f_sincF).^2 + imag(f_sincF).^2);

load('im');

imF = fft2(im);
imP = real(imF).^2 + imag(imF).^2;
surf(imP);

imF = fft2(CS4640_center(im));
imP = real(imF).^2 + imag(imF).^2;
surf(imP);
imshow(mat2gray(imP));
imshow(mat2gray(log(1+imP)));

imP = CS4640_power_spectrum(im,0);
surf(imP);
imP = CS4640_power_spectrum(im,1);
surf(imP);

load('trees');
imP = CS4640_power_spectrum(trees,1);
subplot(2,1,1);
imshow(mat2gray(trees));
subplot(2,1,2);
imshow(mat2gray(log(1+imP)));

load('brodatz');
imP = CS4640_power_spectrum(b3,1);
subplot(2,1,1);
imshow(mat2gray(b3));
subplot(2,1,2);
imshow(mat2gray(log(1+imP)));

imP = CS4640_power_spectrum(b14,1);
subplot(2,1,1);
imshow(mat2gray(b14));
subplot(2,1,2);
imshow(mat2gray(log(1+imP)));

imP = CS4640_power_spectrum(b20,1);
subplot(2,1,1);
imshow(mat2gray(b20));
subplot(2,1,2);
imshow(mat2gray(log(1+imP)));

imP = CS4640_power_spectrum(b53,1);
subplot(2,1,1);
imshow(mat2gray(b53));
subplot(2,1,2);
imshow(mat2gray(log(1+imP)));
clf

im_p = CS4640_pad(im,200,200);
imshow(im_p);
im_dp = CS4640_depad(im_p,100,100);
imshow(im_dp);

im_c = CS4640_center(im_p);
imshow(im_c);
imF = fft2(im_c);
imP = real(imF).^2 + imag(imF).^2;
surf(imP);

h = ones(7,7)/49;
h_p = CS4640_pad(h,200,200);
h_c = CS4640_center(h_p);
hF = fft2(h_c);
hP = real(hF).^2 + imag(hF).^2;
surf(hP);

G = hF.*imF;
gP = real(G).^2 + imag(G).^2;
surf(gP);

gp = CS4640_center(real(ifft2(G)));
g = CS4640_depad(gp,100,100);
imshow(g);
im_b = conv2(im,ones(7,7)/49,'same');
imshow(im_b);

combo(im_b,g>0.2);

tch = 0;
