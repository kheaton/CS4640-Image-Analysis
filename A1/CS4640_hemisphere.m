function h = CS4640_hemisphere(x,y)
% CS4640_hemisphere - hemisphere height function
% On input:
%     x (float): x value
%     y (float): y value
% On output:
%     h (float): height of hemisphere at x,y
% Call:
%     h = CS4640_hemisphere(2,3.1);
% Author:
%     T. Henderson
%     UU
%     Spring 2018
%

h = 0;
radius = 4;

if x^2+y^2>=radius^2
    return
end

h = sqrt(radius^2 - x^2 - y^2);

end