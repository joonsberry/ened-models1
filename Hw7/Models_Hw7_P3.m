%Models Hw7 Problem 3
clear; clc;
load HW7;

count_x = 0;
count_y = 0;
count_equal = 0;

for k = 1:15
    if x(k) > y(k)
        z(k) = x(k);
        count_x = count_x+1;
    elseif x(k) < y(k)
        z(k) = y(k);
        count_y = count_y+1;
    else
        z(k) = x(k);
        count_equal = count_equal+1;
        location(count_equal) = k;
    end
end
disp(z);
disp(count_x);
disp(count_y);
disp(location);