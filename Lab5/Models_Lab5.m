%Models Lab 5: Conditional Statements
clc;

%Problem 1
clear;
%Input
mass_kg = input('Enter the mass in kg: ');
mass_conversion = menu('Would you like to convert to lbm or slugs?','lbm','slugs');


switch mass_conversion
    case 1
        mass_converted = mass_kg*2.2046226;
        fprintf('The mass is %0.3f lbm.\n',mass_converted);
    case 2
        mass_converted = mass_kg*0.0685218;
        fprintf('The mass is %0.3f slugs.\n',mass_converted);
end

%Problem 2
clear;

pH_value = input('Enter your pH value: '); %Input

if pH_value < 0 || pH_value > 14
    error('Your pH is not in the proper range.');
    
elseif pH_value < 7
    fprintf('Your pH is acidic.\n');
    
elseif pH_value == 7
    fprintf('Your pH is neutral.\n');
    
elseif pH_value > 7
    fprintf('Your pH is basic.\n')
end

%Problem 3
clear;
%Input
Temperature = input('Enter the temperature (degC): ');
Pressure = input('Enter the pressure (atm): ');

if Temperature > 355 || Pressure > 0.100
    fprintf('The Nuclear Reactor is catagorized as Melt Down.\n');
    
elseif Temperature > 345 || Pressure > .095
    fprintf('The Nuclear Reactor is catagorized as Very Severe.\n');
    
elseif Temperature > 335 || Pressure > .09
    fprintf('The Nuclear Reactor is catagorized as Severe.\n');
    
elseif Temperature > 325 || Pressure > .085
    fprintf('The Nuclear Reactor is catagorized as Moderate.\n');
    
elseif Temperature <= 325 || Pressure <= .085
    fprintf('The Nuclear Reactor is catagorized as Normal.\n');
end
    