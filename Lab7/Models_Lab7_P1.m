%Models Lab 7 Problem 1
clear; clc;

%input
number = input('What would you like the cube root of? ');
estimate = input('What is the initial estimate? ');
count = 0;
error = abs(number-estimate^3);

%analysis
actual = number^(1/3);
while error > 1*10^-6
    count = count + 1;
    estimate = (1/3)*(2*estimate + (number/estimate^2));
    error = abs(number-estimate^3);
end

%output
fprintf('The actual value for the cube root is %0.3f.\n The estimated value is %0.3f.\n The loop ran %i times.\n',actual,estimate,count);