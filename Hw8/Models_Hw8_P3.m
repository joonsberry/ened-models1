%Models Hw8 Problem 3
clear; clc;

load HW8;
C = zeros(4,6);
[mrows,ncols] = size(C);
largerA = 0;
largerB = 0;
equalAB = 0;

for k = 1:mrows
    for r = 1:ncols
        if A(k,r) > B(k,r)
            C(k,r) = A(k,r);
            largerA = largerA + 1;
        elseif B(k,r) > A(k,r)
            C(k,r) = B(k,r);
            largerB = largerB + 1;
        else
            C(k,r) = A(k,r);
            equalAB = equalAB + 1;
        end
    end
end

disp(C);
fprintf('A has %i entries larger than corresponding B.\nB has %i entries larger than corresponding A.\nA and B have %i equal corresponding entries.\n',largerA,largerB,equalAB);