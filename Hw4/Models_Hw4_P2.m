%Models Hw4 Problem 2
clear; clc;

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

%Corrects incorrect information
if Verify_Info == 1
    incorrect_item = 0;
else
    incorrect_item = menu('Which information is wrong?','Name','Age','City','State','Zip Code');
end

switch incorrect_item
    case 0
        fprintf('You have entered your information correctly. Congratulations!\n');
    case 1
        Name = input('Please enter your full name: ','s');
    case 2
        Age = input('Please enter your age: ','s');
    case 3
        City = input('Please enter your city of residence: ','s');
    case 4
        State = input('Please enter your state of residence: ','s');
    case 5
        Zip_Code = input('Please enter you zip code: ','s');
        
        fprintf('Your name is %s.\n',Name);
        fprintf('Your age is %s.\n',Age);
        fprintf('You live in the city %s.\n',City);
        fprintf('You live in the state %s.\n',State);
        fprintf('Your zip code is %s.\n',Zip_Code);
end