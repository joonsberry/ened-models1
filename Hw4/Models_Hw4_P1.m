%Models HW4 Problem 1
clear; clc;

t = [-1 3 8 7 2]; %input

%check sign status of t(1)
if t(1) < 0
    t1_sign = 'negative';
else
    t1_sign = 'non-negative';
end
fprintf('t(1) is %s.\n',t1_sign);

%check if t(2) is between 6 and 10
if t(2) > 6  &&  t(2) < 10
    t2_location = 'between 6 and 10';
else
    t2_location = 'not between 6 and 10';
end
fprintf('t(2) is %s.\n',t2_location);

%compare t(2) and t(4)
if t(2) < t(4)
    t2t4_compare = 'less than';
elseif t(2) == t(4)
    t2t4_compare = 'equal to';
else
    t2t4_compare = 'greater than';
end
fprintf('t(2)=%i and t(4)=%i therefore t(2) is %s t(4).\n',t(2),t(4),t2t4_compare);