%Models Lab 13 Part C
clear; clc;
load Weather

count = 0;
YearVector = 1970:1:2015;
for year = YearVector
    count = count + 1;
    DaysAbove90(count) = sum(W.YEAR == year & W.TMAX > 90);
end
plot(YearVector,DaysAbove90,'ro-'); hold on;
xlabel('\bfYear','FontSize',14);
ylabel('\bfAbove 90 (days)','FontSize',14);
title('\bfDays Above 90 from 1970-2015','FontSize',20);