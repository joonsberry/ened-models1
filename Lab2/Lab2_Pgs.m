%Lab 2:Plotting and Graphical Soltions
%Jonathan Kenney

%Newton's Law
clear; clc;
%Acceleration Vector
a = [5 10 12 15 25];
%Force Vector
F = [2500 5000 6000 7500 12500];
%Plot
figure(1)
plot(a,F,'ks--');
title('\bfRelationship of Force and Acceleration for an Object','FontSize',20);
xlabel('\bfAcceleration (ms^-2)','FontSize',14);
ylabel('\bfForce (N)','FontSize',14);

%Calories Burned While Biking
clear;
%Velocity Vector
V = 3:0.5:20;
%Weights and Rates
   %W = 125
Rate_125 = 60*125*10.^((V*25.^-1)-1.85);
   %W = 175
Rate_175 = 60*175*10.^((V*25.^-1)-1.85);
%Plot
figure(2)
plot(V,Rate_125,'rs--',V,Rate_175,'bs--');
legend('Red -> W=125','Blue -> W=175');
title('\bfCalories Burned While Biking','FontSize',20);
xlabel('\bfVelocity (mph)','FontSize',14);
ylabel('\bfRate of Calorie Burn (Cal/h)','FontSize',14);

%Stopping Sight Distance
clear;
%Given Variables
f1 = 0.69; %dry roads and decent tires
f2 = 0.4;  %wet roads and decent tires
G = 0.02;
tr = 2.0;
%Vehicle Speeds Vector (mph)
V_mph = 10:2.5:75;
%Convert to km/h
V = V_mph*1.60934;
%Dry Stopping with V
S_Dry = (((0.278*V).^2)*((19.6*(f1+G)).^-1))+(0.278*V*tr);
%Wet Stopping with V
S_Wet = (((0.278*V).^2)*((19.6*(f2+G)).^-1))+(0.278*V*tr);
%Conversion of S_Dry and S_Wet from meters to feet
S_DryFeet = S_Dry*0.3048;
S_WetFeet = S_Wet*0.3048;
%Plot
figure(3)
plot(V_mph,S_DryFeet,'rs--',V_mph,S_WetFeet,'bs--');
legend('Red -> Dry','Blue - > Wet');
title('\bfStopping Distance in Varying Conditions','FontSize',20);
xlabel('\bfVehicle Speed (mph)','FontSize',14);
ylabel('\bfStopping Distance (ft)','FontSize',14);