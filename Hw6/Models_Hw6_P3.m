%Models HW6 Problem 3
clear; clc;

%input
x = input('Angle value between 0 and 2pi(rad): ');
n = 0;
actual = sin(x);
estimate = 0;
error = 1;
%analysis
while error > 1e-5
    taylor_term = ((-1)^n)*(x^(2*n+1))/factorial(2*n+1);
    estimate = estimate + taylor_term;
    error = abs(actual-estimate);
    n = n+1;
end

%output
fprintf('The estimate is %0.6f.\nThe actual is %0.6f.\nThis computation required %i terms.\n',estimate,actual,n);