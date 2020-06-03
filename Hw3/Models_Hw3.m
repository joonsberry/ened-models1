%Models_Hw3
clc;
%Problem 2
clear;
%Input
Name = input('Please enter your full name: ','s');
Age = input('Please enter your age: ','s');
City = input('Please enter your city of residence: ','s');
State = input('Please enter your state of residence: ','s');
Zip_Code = input('Please enter you zip code: ','s');

%Output
fprintf('Your name is %s.\n',Name);
fprintf('Your age is %s.\n',Age);
fprintf('You live in the city %s.\n',City);
fprintf('You live in the state %s.\n',State);
fprintf('Your zip code is %s.\n',Zip_Code);

Verify_Info = menu('Is this information correct?','Yes','No');

%Problem 3
clear; clc;
%Inputs
T = input('What is the period? '); %T is the period length
tau = input('What is the duty cycle? '); %tau is the duty cycle
N = input('How many cycles? '); %N = number of cycles
f = 1/T; %f = frequency which = 1/T
Time = 0:0.01:T*N; 

%Analysis
y = 2.5*square(2*pi*f*Time, tau) + 2.5;
avg_y = mean(y);

%Output
plot(Time,y,'bo-');
xlabel('\bfTime (sec)','FontSize',14);
ylabel('\bfVoltage (V)','FontSize',14);
title('\bfVoltage vs Time','FontSize',20);
fprintf('The frequency is %0.2f Hz.\n',f);
fprintf('The average Voltage is %0.1f V.\n',avg_y);

%Problem 4
clear;
%Input
Color1 = menu('What is the color of the first band? ','Black','Brown','Red','Orange','Yellow','Green','Blue','Violet','Grey','White');
Color2 = menu('What is the color of the second band? ','Black','Brown','Red','Orange','Yellow','Green','Blue','Violet','Grey','White');
Color3 = menu('What is the color of the third band? ','Black','Brown','Red','Orange','Yellow','Green','Blue','Violet','Grey','White');
Color4 = menu('What is the color of the fourth band? ','Gold','Silver','None');

Color1 = Color1 - 1;
Color2 = Color2 - 1;
Color3 = Color3 - 1;

Tolerance_Options = [.05 .1 .2];
Tolerance = Tolerance_Options(Color4);

%Analysis
Resistor_Value = (Color1*10 + Color2)*10^Color3;
Resistor_LowerRange = Resistor_Value - Resistor_Value*Tolerance;
Resistor_UpperRange = Resistor_Value + Resistor_Value*Tolerance;

%Output
fprintf('The nominal resistor value is %0.1f Ohms.\n',Resistor_Value);
fprintf('The range of values for the resistor is %0.1f to %0.1f Ohms.\n',Resistor_LowerRange,Resistor_UpperRange);