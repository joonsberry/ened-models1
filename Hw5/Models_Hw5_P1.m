%Models HW5 Problem 1
clear; clc;

x = 1;
y = 1;
for k = 1:4
    Sum = x + y;
    x = y;
    y = Sum;
    disp(x);
    disp(y);
end
