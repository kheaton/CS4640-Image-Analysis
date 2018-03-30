function nodes_out = CS4640_set_levels(nodes)
% CS4640_set_levels - set level field in tree
% On input:
%    nodes(tree struct): Huffmann tree
% On output:
%     nodes_out (tree struct): Huffman tree with levels set
% Call:
%     H.nodes = CS4640_set_levels(nodes);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

num_nodes = length(nodes);
nodes_out = nodes;

for n = 1:num_nodes
    level = 0;
    current = n;
    while nodes(current).parent>0
        level = level + 1;
        current = nodes(current).parent;
    end
    nodes_out(n).level = level;
end
