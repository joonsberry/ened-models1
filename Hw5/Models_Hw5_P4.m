%Models HW5 P4
clear; clc;

%input
x = [1 -2 3 5 4 2];

%analysis
for k = 1:5
    if x(k) > x(k+1)
        s = x(k);
        x(k) = x(k+1);
        x(k+1) = s;
    end
end

%output
disp(x);