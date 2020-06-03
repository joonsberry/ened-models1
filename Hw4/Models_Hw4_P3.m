%Models Hw4 Problem 3
clear; clc;

circuit_config = menu('Is the circuit series or parallel?','Series','Parallel');
r1_resistance = input('What is the resistance (Ohms) of the first resistor? ');
r2_resistance = input('What is the resistance (Ohms) of the second resistor? ');
source_voltage = input('What is the applied voltage (V)? ');

switch circuit_config
    case 1
        total_resistance = r1_resistance + r2_resistance;
        r1_current = source_voltage / total_resistance;
        r1_voltage = r1_resistance * r1_current;
        r2_current = r1_current;
        r2_voltage = r2_resistance * r2_current;
    case 2
        total_resistance = (r1_resistance * r2_resistance)/(r1_resistance + r2_resistance);
        r1_voltage = source_voltage;
        r1_current = source_voltage / r1_resistance;
        r2_voltage = source_voltage;
        r2_current = source_voltage / r2_resistance;
end
fprintf('The total resistance is %0.2f Ohms.\nThe current through R1 is %0.2f A.\nThe current through R2 is %0.2f A.\nThe voltage across R1 is %0.2f V.\nThe voltage across R2 is %0.2f V.\n',total_resistance,r1_current,r2_current,r1_voltage,r2_voltage);