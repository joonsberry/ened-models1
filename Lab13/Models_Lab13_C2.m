%Models Lab 13 Part C2
clear; clc; clf;
load Weather

count = 0;
YearVector = 1970:1:2014;
for year = YearVector
    count = count + 1;
    Rows = find(W.YEAR == year);
    TotalPRCP(count) = sum(W.PRCP(Rows));
    clear Rows;
end
MEAN = mean(TotalPRCP)
MIN = min(TotalPRCP)
MAX = max(TotalPRCP)
plot(YearVector,TotalPRCP,'ro-'); hold on;
xlabel('\bfYear','FontSize',14);
ylabel('\bfTotal Precipitation (in)','FontSize',14);
title('\bfYearly Total Precipitation','FontSize',20);
minyear = find(sum(W.PRCP) == 30.29)
maxyear = find(sum(W.PRCP) == 73.28)