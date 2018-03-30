function CS4640_week8
%

% Example 1
% Create info and build Huffman tree and codes
info1 = [1,5; 2,9; 3,12; 4,13; 5,16; 6,45]
[H1,c1] = CS4640_Huffman_encode(info1)
CS4640_show_tree(H1.nodes,H1.root);
c1(:).code

% encode a string
im1 = [4,3,3,6,2,3,1]
tab1 = [1:6]'
cd1 = CS4640_im2Hcode(im1,c1,tab1)'
cost_orig1 = length(im1)*8
cost_comressed = length(cd1)

% Decompress
im1d = CS4640_Huffman_decode(cd1,H1,tab1)
im1d = im1d(1:2:end);
[im1',im1d']

% Example 2
% Create info and build Huffman tree and codes
lenna = imread('lenna.jpg');
im2 = rgb2gray(lenna);
h = CS4640_hist(im2);
indexes = find(h);

info2 = [[1:length(indexes)]',h(indexes)'];
[H2,c2] = CS4640_Huffman_encode(info2)
%CS4640_show_tree(H1.nodes,H1.root);
c2(1:10).code

% encode a string
im2_lin = im2(:);
tab2 = indexes';
cd2 = CS4640_im2Hcode(im2_lin,c2,tab2)';
cd2(1:20)'
cost_orig2 = length(im2_lin)*8
cost_compressed2 = length(cd2)

% Decompress
im2d = CS4640_Huffman_decode(cd2,H2,tab2);
im2d = im2d(1:2:end);
[im2_lin(1:10),im2d(1:10)']
im2r = reshape(im2d,225,225);
imshow(mat2gray(im2r));

% RLE encoding
lennag = rgb2gray(lenna);
lenna_RLE = CS4640_RLE_encode(lennag);
cost_orig = length(lennag(:))*8
max(lenna_RLE(1:2:end-1))
cost_RLE = 5*length(lenna_RLE)/2 + 8*length(lenna_RLE)/2
cost_orig/cost_RLE

lenna_RLEd = CS4640_RLE_decode(lenna_RLE,225,225);
imshow(mat2gray(lenna_RLEd));

lennabw = lennag>100;
figure(1);
imshow(lennabw);
lennabw_RLE = CS4640_RLE_encode(lennabw);
cost_orig = length(lennabw(:))*8
max(lennabw_RLE(1:2:end-1))
cost_RLE = 12*length(lennabw_RLE)/2 + 1*length(lennabw_RLE)/2
cost_orig/cost_RLE
cost_orig = length(lennabw(:))*2
cost_orig/cost_RLE

lennabw_RLEd = CS4640_RLE_decode(lennabw_RLE,225,225);
figure(2);
imshow(lennabw_RLEd);

S00 = CS4640_Suv_FT(0,0,32);
S00(1:5,1:5)
tch = 0;
exp(2*j*pi)/32
S0_16 = CS4640_Suv_FT(0,16,32);
imshow(mat2gray(imresize(real(S0_16),[200,200])));
S0_31 = CS4640_Suv_FT(0,31,32);
imshow(mat2gray(imresize(real(S0_31),[200,200])));
S16_0 = CS4640_Suv_FT(16,0,32);
imshow(mat2gray(imresize(real(S16_0),[200,200])));
S16_16 = CS4640_Suv_FT(16,16,32);
imshow(mat2gray(imresize(real(S16_16),[200,200])));
abs(sum(sum(S0_16.*S16_16)))

D08 = CS4640_Suv_DCT(0,4,32);
imshow(mat2gray(imresize(real(D08),[200,200])));
D80 = CS4640_Suv_DCT(4,0,32);
imshow(mat2gray(imresize(real(D80),[200,200])));
D88 = CS4640_Suv_DCT(8,8,32);
imshow(mat2gray(imresize(real(D88),[200,200])));

im = floor(rand(8,8)*255)
figure(1)
imshow(mat2gray(imresize(im,[200,200])));
W = dct2(im)
figure(2)
imr = CS4640_gen_im_DCT(W)
RMS = sqrt(sum(sum((im-imr).^2))/64)

Wp = W;
max_val = max(max(W));
Wp(abs(W)<=max_val*.1) = 0;
im1 = CS4640_gen_im_DCT(Wp);

Wp = W;
max_val = max(max(W));
Wp(abs(W)<=max_val*.05) = 0;
im1 = CS4640_gen_im_DCT(Wp);

im = lennag(41:48,41:48);
W = dct2(double(im));
W1 = 0*W;
W1(1,1) = W(1,1);
imr = CS4640_gen_im_DCT(W);
figure(1)
imshow(mat2gray(imresize(im,[200,200])));
figure(2)
imshow(mat2gray(imresize(imr,[200,200])));
figure(3)
imr1 = CS4640_gen_im_DCT(W1);
imshow(mat2gray(imresize(imr1,[200,200])));
imr1
mean(mean(im))

tch = 0;
