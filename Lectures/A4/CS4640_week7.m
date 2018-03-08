function CS4640_week7
%

info = [1,5; 2,9; 3,12; 4,13; 5,16; 6,45]
H = CS4640_Huffman_encode(info)
CS4640_show_tree(H.nodes,H.root)

s = [1,1,0,1,1,1,0,0,1,0,1,1,0,0,1,1,1,0,0,1,1,0,0]
CS4640_Huffman_decode(s,H)

infob = [1,0.2; 2, 0.2; 3,0.4; 4,0.2]
seq = [1,2,3,3,4]
[low,high] = CS4640_arith_encode(infob,seq)

clf
hold on
plot(0,0,'w.');
plot(1.1,4.1,'w.');
for s1 = 1:4
    for s2 = 1:4
        [low,high] = CS4640_arith_encode(infob,[s1,s2]);
        plot([low,high],[s1,s1]);
        plot([low,high],[0.5,0.5]);
    end
end

clf
Lenna512 = imread('Lenna512.png');
Lenna512g = rgb2gray(Lenna512);
h = CS4640_hist(Lenna512g);

ime = CS4640_RLE_encode(Lenna512g);
plot(Lenna512g(1:20,1));
hold on
plot([1:20],Lenna512g(1:20,1),'ro');
ime(1:20)'
C = 512*512/length(ime)
R = 1 - 1/C
mean(ime(1:2:end))

Lenna512bw = Lenna512g>100;
ime = CS4640_RLE_encode(Lenna512bw)
C = 512*512/length(ime)
R = 1 - 1/C
mean(ime(1:2:end))
