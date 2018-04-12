function segs = CS4640_kmeans(im,k)
% CS4640_kmeans - segment image using kmeans
%      im (MxNxP array): input image
%      k (int): number of clusters
% On putput:
%      segs (MxN array): segmented image
% Call:
%      s = CS4640_kmeans(v1,4);
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

[M, N, p] = size(im);

%reshape the image into something that kmean will understand
linearized = double(reshape(im, M*N, p));

%call k means
k_means = kmeans(linearized, k);

%reshape what kmeans gave back into an image
segs = reshape(k_means, M, N);

end