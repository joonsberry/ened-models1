%Models Lab 6 Problem 2
clear; clc;

rng('shuffle');

%start the counts at 0 and index them as the dice are rolled
count2 = 0;
count3 = 0;
count4 = 0;
count5 = 0;
count6 = 0;
count7 = 0;
count8 = 0;
count9 = 0;
count10 = 0;
count11 = 0;
count12 = 0;
count_rolls = input('How many times should the die be rolled? ');

%roll the dice and index the variables
for num_rolls = 1:count_rolls
    die1 = randi([1 6],1);
    die2 = randi([1 6],1);
    dice_roll = die1 + die2;
    switch dice_roll
        case 2
            count2 = count2 + 1;
        case 3
            count3 = count3 + 1;
        case 4
            count4 = count4 + 1;
        case 5
            count5 = count5 + 1;
        case 6
            count6 = count6 + 1;
        case 7
            count7 = count7 + 1;
        case 8
            count8 = count8 + 1;
        case 9
            count9 = count9 + 1;
        case 10
            count10 = count10 + 1;
        case 11
            count11 = count11 + 1;
        case 12
            count12 = count12 + 1;
    end
end

%find the percentages
percent2 = count2/count_rolls*100;
percent3 = count3/count_rolls*100;
percent4 = count4/count_rolls*100;
percent5 = count5/count_rolls*100;
percent6 = count6/count_rolls*100;
percent7 = count7/count_rolls*100;
percent8 = count8/count_rolls*100;
percent9 = count9/count_rolls*100;
percent10 = count10/count_rolls*100;
percent11 = count11/count_rolls*100;
percent12 = count12/count_rolls*100;

%print out the percentages
fprintf('Roll percentages - 2: %0.2f, 3: %0.2f, 4: %0.2f, 5: %0.2f, 6: %0.2f,\n 7: %0.2f, 8: %0.2f, 9: %0.2f, 10: %0.2f, 11: %0.2f, 12: %0.2f\n',percent2,percent3,percent4,percent5,percent6,percent7,percent8,percent9,percent10,percent11,percent12);