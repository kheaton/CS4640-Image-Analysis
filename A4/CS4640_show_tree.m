function  CS4640_show_tree(nodes,n)
% CS4640_show_tree - display indented tree
% On input:
%     nodes (tree struct)
%     n (int): root index
% On output:
%     displays tree in interpreter
% Call:
%     CS4640_show_tree(H,11);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

BLANK = ' ';

if isempty(nodes)
    return
end

level = nodes(n).level;
state = nodes(n).state;
children = nodes(n).children;

white = [];
for p = 1:level
    white = [white,BLANK];
end

fprintf('%s',white);
fprintf('[%d]\n',state);

if isempty(children)
    return
end

num_children = length(children);
for c = 1:num_children
    CS4640_show_tree(nodes,children(c));
end
