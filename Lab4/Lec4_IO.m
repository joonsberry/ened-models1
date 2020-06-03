clear; clc; clf;
%Input
Option = menu('How to input data?','File','Vector','Input');

if Option == 1 %Option 1: Read Data from File
    FileString = input('What is your file name? ','s');
    time = xlsread('UNdata_TotalElectricity','C2:C23');
    distance = xlsread('UNdata_TotalElectricity','E24:E45');
    
elseif Option == 2 %Option 2: Create Vectors
    time = 0:1:10;
    distance = [0 2 3 5 6 8 10 13 14 16 18];
    
elseif Option == 3 %Option 3:
    time = input('Input your time vector in sec: ');
    distance = input('Input your distance vector in meters: ');
end
%Analysis
Distance_mean = mean(distance);

%Output 
%disp('Distance_mean = '); disp(Distance_mean);
fprintf('Option = %i\n',Option);
fprintf('The mean of the Distance = %0.2f in meters\n',Distance_mean);
plot(time,distance,'ro:');
xlabel('\bfTime (sec)','FontSize',14);
ylabel('\bfDistance (m)','FontSize',14);