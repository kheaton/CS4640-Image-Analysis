function im_pad = CS4640_pad(im,P,Q)
% CS4640_im_pad - pad an image for frequency domain filtering
% On input:
%      im_in (MxN double array): input image
% On output:
%      im_pad (PxQ double array): upper MxN is im; rest is 0
% Call:
%      imp = CS4640_pad(im,2*M,2*N);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N] = size(im);

% Make sure PxQ is not smaller than MxN,
if P < M || Q < N
    im_pad = [];
    return;
end

% Initialize im_pad
im_pad = zeros(P, Q);

% Copy values from im into im_pad
for row = 1 : M
    for col = 1 : N
        im_pad(row, col) = im(row, col);        
    end
end

end