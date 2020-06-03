clear; clc; clf;

t = 0:1:10;
C = exp(-0.4*t);
figure(1)
plot(t,C,'bs-');
xlabel('\bfTime (sec)','FontSize',14);
ylabel('\bfConcentration (M)','FontSize',14);
title('\bfDecomposition of Hydrogen Peroxide','FontSize',20);

clear;
t = 0:.001:.02;
y = sin(2*pi*250*t);
figure(2)
plot(t,y,'rs-');
xlabel('\bfTime (sec)','FontSize',14);

clear;
t = 0:.05:3;
p = exp(-2*t).*cos(20*pi*t);
v = -2*exp(-2*t).*(cos(20*pi*t))-(20*pi*exp(-2*t).*(sin(20*pi*t)));

figure(3)
plot(t,p,'rs-');
xlabel('\bfTime (sec)','FontSize',14);
ylabel('\bfPosition (cm)','FontSize',14);
title('\bfPosition of Shock Absorber','FontSize',20);
figure(4)
plot(t,v,'bs-');
xlabel('\bfTime (sec)','FontSize',14);
ylabel('\bfVelocity (cm/s)','FontSize',14);
title('\bfVelocity of Shock Absorber','FontSize',20);