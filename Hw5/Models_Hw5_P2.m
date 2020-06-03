%Models HW5 Problem 2
clear; clc;

t = [ 0  -2  4  7  2 ];
count = 0;
for k = 1:length(t)
    if t(k) < 4
        count = count + 1;
	   location(count) = k;	
       disp(count);
       disp(location(count));
    end
end
