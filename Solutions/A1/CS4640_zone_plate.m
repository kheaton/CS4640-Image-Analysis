function z = CS4640_zone_plate(x,y)
%

if norm([x,y])<8.2
    z = (1+cos(x^2+y^2))/2;
else
    z = 0;
end
