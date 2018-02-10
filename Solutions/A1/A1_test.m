function res = A1_test
%

res = zeros(1,7);

imc = CS4640_create_im('CS4640_ramp',4,4,4,-2,2,-2,2);
truth = [0 1 2 3; 0 1 2 3; 0 1 2 3; 0 1 2 3];
res(1) = 0==sum(sum(truth-imc));

im1 = ones(4,4);
im2 = 2*ones(4,4);
imd = CS4640_im_dist(im1,im2);
res(2) = 0==sum(sum(abs(imd-im1)));

im1(:,:,1) = ones(4,4);
im1(:,:,2) = zeros(4,4);
im1(:,:,3) = zeros(4,4);
im2(:,:,1) = 2*ones(4,4);
im2(:,:,2) = zeros(4,4);
im2(:,:,3) = zeros(4,4);
imd = CS4640_im_dist(im1,im2);
res(3) = 0==sum(sum(abs(imd-ones(4,4))));

imc = CS4640_create_im('CS4640_ramp',20,20,256,-2,2,-2,2);
imft = CS4640_FT(imc);
imfti = CS4640_FTi(imft);
res(4) =  sum(sum(abs(real(imfti)-imc)))<0.001;

ref = zeros(21,21);
ref(6:15,6:15) = 1;
im = ref;
pts = [6,6,6,6; 6,15,6,15; 15, 6, 15, 6; 15, 15, 15, 15];
imr = CS4640_register(ref,im,pts);
res(5) = 0==sum(sum(abs(imr-ref)));

imn = CS4640_add_noise(zeros(100,100),0,1,1,0,1,0,0);
res(6) = abs(sum(sum(imn))/10000-0.5)<0.05;

imn = CS4640_add_noise(zeros(300,300),-5,5,2,0,1,0,1);
res(7) = abs(mean(imn(:)))<0.01;

tch = 0;
