%Models Lab 7 Problem 2
clear; clc;

%input
x = input('What is the value of x? ');
while x <= 0  ||  x > 2
    x = input('That value of x is invalid. Please enter a new one: ');
end

n = 0;
estimate = 0;
estimate_diff = 1;
actual = log(x);

%analysis
while estimate_diff > 1*10^-6
    n = n + 1;
    prev_estimate = estimate;
    estimate = prev_estimate + ((-1)^(n+1))*((x-1)^n)/n;
    estimate_diff = abs(prev_estimate - estimate);
end

%output
fprintf('The actual value of ln(x) is %0.6f.\n The estimated value of ln(x) is %0.6f.\n The loop iterated %i times.\n',actual,estimate,n);