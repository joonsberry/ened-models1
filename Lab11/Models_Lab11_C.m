%Models Lab 11 
clear; clc;
rng('shuffle');

%input
r1 = input('Resistance of resistor 1 (Ohm): ');
r2 = input('Resistance of resistor 2 (Ohm): ');
voltage_source = input('Source voltage (V): ');
r1_tol = input('Tolerance of resistor 1 (%): ');
r1_tol = r1_tol/100;
r2_tol = input('Tolerance of resistor 2 (%): ');
r2_tol = r2_tol/100;
r1_vtol = input('Acceptable voltage tolerance of resistor 1 (%): ');
r1_vtol = r1_vtol/100;
r2_vtol = input('Acceptable voltage tolerance of resistor 2 (%): ');
r2_vtol = r2_vtol/100;
voltage_check = zeros(500,500);

%analysis
r1_min = r1 - r1*r1_tol;
r1_max = r1 + r1*r1_tol;
r2_min = r2 - r2*r2_tol;
r2_max = r2 + r2*r2_tol;
r1_nomvoltage = r1/(r1 + r2)*voltage_source;
r2_nomvoltage = r2/(r1 + r2)*voltage_source;
r1_vmin = r1_nomvoltage - r1_nomvoltage*r1_vtol;
r1_vmax = r1_nomvoltage + r1_nomvoltage*r1_vtol;
r2_vmin = r2_nomvoltage - r2_nomvoltage*r2_vtol;
r2_vmax = r2_nomvoltage + r2_nomvoltage*r2_vtol;

R1 = linspace(r1_min,r1_max,500);
R2 = linspace(r2_min,r2_max,500);

for p = 1:500
    for k = 1:500
        r1_voltage = R1(p)/(R1(p) + R2(k))*voltage_source;
        r2_voltage = R2(k)/(R1(p) + R2(k))*voltage_source;
        if r1_voltage >= r1_vmin && r1_voltage <= r1_vmax && r2_voltage >= r2_vmin && r2_voltage <= r2_vmax
            voltage_check(p,k) = 255;
        end
    end
end
figure(1)
imshow(uint8(voltage_check))

r1_values = zeros(10000,1);
r2_values = zeros(10000,1);
count_bad = 0;
for l = 1:10000
    rand_r1 = r1 + r1*r1_tol/2*randn(1);
    rand_r2 = r2 + r2*r2_tol/2*randn(1);
    r1_volt = rand_r1/(rand_r1 + rand_r2)*voltage_source;
    r2_volt = rand_r2/(rand_r1 + rand_r2)*voltage_source;
    r1_values(l) = r1_volt;
    r2_values(l) = r2_volt;
    if r1_volt < r1_vmin || r1_volt > r1_vmax || r2_volt < r2_vmin || r2_volt > r2_vmax
        count_bad = count_bad + 1;
    end
end

figure(2)
hist(r1_values,100);
xlabel('\bfVoltage (V)','FontSize',14);
ylabel('\bf# of Circuits','FontSize',14);
title('\bfResistor 1 Voltages','FontSize',20);
figure(3)
hist(r2_values,100);
xlabel('\bfVoltage (V)','FontSize',14);
ylabel('\bf# of Circuits','FontSize',14);
title('\bfResistor 2 Voltages','FontSize',20);

probability_bad = count_bad/10000*100