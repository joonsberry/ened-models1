%Models Hw6 Problem 2
clear; clc;

%Input
Name = input('Please enter your full name: ','s');
Age = input('Please enter your age: ','s');
City = input('Please enter your city of residence: ','s');
State = input('Please enter your state of residence: ','s');
Zip_Code = input('Please enter you zip code: ','s');

%Output
fprintf('\nYour name is %s.\n',Name);
fprintf('Your age is %s.\n',Age);
fprintf('You live in the city %s.\n',City);
fprintf('You live in the state %s.\n',State);
fprintf('Your zip code is %s.\n',Zip_Code);

verify_info = menu('Is this information correct?','Yes','No');

%Corrects incorrect information
while verify_info == 2
    incorrect_item = menu('Which information is wrong?','Name','Age','City','State','Zip Code');
    switch incorrect_item
        case 1
            Name = input('\nPlease enter your full name: ','s');
        case 2
            Age = input('\nPlease enter your age: ','s');
        case 3
            City = input('\nPlease enter your city of residence: ','s');
        case 4
            State = input('\nPlease enter your state of residence: ','s');
        case 5
            Zip_Code = input('\nPlease enter you zip code: ','s');
    end
    fprintf('\nYour name is %s.\n',Name);
    fprintf('Your age is %s.\n',Age);
    fprintf('You live in the city %s.\n',City);
    fprintf('You live in the state %s.\n',State);
    fprintf('Your zip code is %s.\n',Zip_Code);
    verify_info = menu('Is this information correct?','Yes','No');
end
fprintf('\nYou have entered your information correctly. Congratulations!\n');