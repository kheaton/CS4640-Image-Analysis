function [H_tree,codes] = CS4640_Huffman_encode(info)
% CS4640_Huffman_encode - produce Huffman code tree
% On input:
%      info (nx2 array): col 1 gives symbols indexes (i.e., [1:n])
%                        col 2 gives frequencies
% On output:
%      H_tree (tree struct):
%           .root (int): index of root of tree
%           .nodes (node vector struct)
%                .parent (int): index of parent
%                .left (int): index of left child
%                .right (int): index of right child
%                .children (1xk vector): indexes of left and right children
%                .symbol (int): col 1 of info for this symbol
%                .state (int): node’s own index in tree
%                .frequency (double): occurrence count (absolute or
%                 relative)
%                .val (nil): unused
%                .level (int): node’s level in tree (i.e., root is 0)
%      codes (nx1 struct vector): codes for the n symbols
%           (q).code (1xn_q binary vector): binary code for symbol q
% Call:
%      info = [1,5; 2,9; 3,12; 4,13; 5,16; 6,45];
%      [H,codes] = CS4640_Huffman_encode(info);
%      CS4640_show_tree(H.nodes,11)
%       [11]
%        [6]
%         [10]
%          [8]
%           [3]
%           [4]
%          [9]
%           [7]
%            [1]
%            [2]
%           [5]
% Author:
%      Kyle Heaton
%      UU
%      Spring 2018
%

warning('Function not yet implemented');

end