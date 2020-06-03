%Models HW5 Problem 3
clear; clc;

%input
x = input('Angle value between 0 and 2pi(rad)? ');
N = input('How many terms? ');
actual = sin(x);
estimate = 0;

%analysis
for n = 0:N
    taylor_term = ((-1)^n)*(x^(2*n+1))/factorial(2*n+1);
    estimate = estimate + taylor_term;
end
error = abs(actual-estimate);

%output
fprintf('The estimate is %0.6f.\nThe actual is %0.6f.\n The error is %0.6f.\n',estimate,actual,error);