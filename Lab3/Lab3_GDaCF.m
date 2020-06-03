%Lab 3: Graphing Data and Curve Fitting

%Total Electricity
clear; clc; clf;
%Input
t = xlsread('UNdata_TotalElectricity','C2:C23');
t = t-1991;
q = xlsread('UNdata_TotalElectricity','E24:E45');

%Analysis
poly1 = polyfit(t,q,1);
poly1_vals = polyval(poly1,t);
r = q - poly1_vals;

%Output
figure(1)
subplot(2,1,1)
plot(t,q,'r*',t,poly1_vals,'k-');
xlabel('\bfYears since 1991','FontSize',14);
ylabel('\bfQuantity (kWh million)','FontSize',14);
title('\bfElectricity Production in the US','FontSize',20);
subplot(2,1,2)
bar(r);

%Wind and Solar Production
clear;
%Input
t = xlsread('USdata_WindProduction','C2:C23');
t = t-1991;
q_wind = xlsread('USdata_WindProduction','E2:E23');
q_solar = xlsread('USdata_SolarProduction','E2:E23');

%Analysis
poly3_wind = polyfit(t,q_wind,3);
poly3_wind_vals = polyval(poly3_wind,t);
residuals_wind = q_wind - poly3_wind_vals;
poly3_solar = polyfit(t,q_solar,3);
poly3_solar_vals = polyval(poly3_solar,t);
residuals_solar = q_solar - poly3_solar_vals;

%Output
figure(2)
subplot(2,1,1)
plot(t,q_wind,'r*',t,q_solar,'b*'); hold on;
xlabel('\bfYears since 1991','FontSize',14);
ylabel('\bfQuantity (kWh million)','FontSize',14);
title('\bfWind and Solar Production in the US','FontSize',20);
legend('Yearly wind measurements','Yearly solar measurements');
plot(t,poly3_wind_vals,'k-',t,poly3_solar_vals,'g-');
subplot(2,1,2)
bar(t,[residuals_wind residuals_solar]);

%Total Electricity for US and China
clear;
%Input
t = xlsread('UNdata_TotalElectricity','C2:C23');
t = t-1991;
q_china = xlsread('UNdata_TotalElectricity','E2:E23');
q_us = xlsread('UNdata_TotalElectricity','E24:E45');

%Analysis
poly3_china = polyfit(t,q_china,3);
poly3_china_vals = polyval(poly3_china,t);
poly3_us = polyfit(t,q_us,3);
poly3_us_vals = polyval(poly3_us,t);

%Output
figure(3)
plot(t,q_china,'r*',t,q_us,'b*'); hold on;
legend('China yearly measurements','US yearly measurements');
plot(t,poly3_china_vals,'k-',t,poly3_us_vals,'g-');
xlabel('\bfYears since 1991','FontSize',14);
ylabel('\bfQuantity (kWh million)','FontSize',14);
title('\bfElectricity Production in China and the US','FontSize',20);

%Total Electricity for US and China (per capita)
clear;
%Input
t = xlsread('UNdata_TotalElectricity','C2:C23');
t = t-1991;
q_china = xlsread('UNdata_TotalElectricity','E2:E23');
q_us = xlsread('UNdata_TotalElectricity','E24:E45');
p_china = xlsread('PopulationData','D2:D23');
p_us = xlsread('PopulationData','D24:D45');

%Analysis
q_china_percap = q_china./p_china;
q_us_percap = q_us./p_us;
poly3_china_percap = polyfit(t,q_china_percap,3);
poly3_china_percap_vals = polyval(poly3_china_percap,t);
poly3_us_percap = polyfit(t,q_us_percap,3);
poly3_us_percap_vals = polyval(poly3_us_percap,t);

%Output
figure(4)
plot(t,q_china_percap,'r*',t,q_us_percap,'b*'); hold on;
legend('China yearly measurements (per capita)','US yearly measurements (per capita)');
plot(t,poly3_china_percap_vals,'k-',t,poly3_us_percap_vals,'g-');
xlabel('\bfYears since 1991','FontSize',14);
ylabel('\bfQuantity (kWh)','FontSize',14);
title('\bfElectricity Production in China and the US','FontSize',20);