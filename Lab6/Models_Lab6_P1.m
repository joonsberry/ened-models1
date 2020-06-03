%Models Lab 6 Problem 1
clear; clc;

rng('shuffle');

%start the counts at 0 and index them as the die is rolled
count1 = 0;
count2 = 0;
count3 = 0;
count4 = 0;
count5 = 0;
count6 = 0;
count_rolls = input('How many times should the die be rolled? ');

%roll the dice and index the variables
for num_rolls = 1:count_rolls
    die1 = randi([1 6],1);
    switch die1
        case 1
            count1 = count1 + 1;
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
    end
end

%find the percentages
percent1 = count1/count_rolls*100;
percent2 = count2/count_rolls*100;
percent3 = count3/count_rolls*100;
percent4 = count4/count_rolls*100;
percent5 = count5/count_rolls*100;
percent6 = count6/count_rolls*100;

%print out the percentages
fprintf('Roll percentages - 1: %05.2f, 2: %0.2f, 3: %0.2f, 4: %0.2f, 5: %0.2f, 6: %0.2f\n',percent1,percent2,percent3,percent4,percent5,percent6);