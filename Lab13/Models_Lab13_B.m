%Models Lab 13 Part B
clear; clc;
load Weather
BD_Row = find(W.YEAR == 1996 & W.MONTH == 12 & W.DAY == 12)
W(BD_Row,:)
Row = find(W.PRCP == max(W.PRCP))
W(Row,:)
DaysAbove90 = sum(W.YEAR == 2014 & W.TMAX > 90)
count = 0;
for year = 2011:2:2015
    count = count + 1;
    Rows = find(W.YEAR == year & W.MONTH == 4);
    PRCP_MEAN(count) = mean(W.PRCP(Rows));
    PRCP_STD(count) = std(W.PRCP(Rows));
    PRCP_Total(count) = sum(W.PRCP(Rows));
end
PRCP_MEAN
PRCP_STD
PRCP_Total