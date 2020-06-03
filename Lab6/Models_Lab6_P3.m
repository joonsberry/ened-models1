%Models Lab 6 Problem 3
clear; clc;

rng('shuffle')

%start the counts at 0 and index them as the dice are rolled
count_pair = 0;
count_3kind = 0;
count_4kind = 0;
count_5kind = 0;
count_rolls = input('How many times should the die be rolled? ');

%roll the dice and index the variables
for num_rolls = 1:count_rolls
    dice_roll = randi([1 6],[1 5]);
    dice_roll = sort(dice_roll);
    if dice_roll(1) == dice_roll(5)
        count_5kind = count_5kind + 1;
    elseif dice_roll(1) == dice_roll(4) || dice_roll(2) == dice_roll(5)
        count_4kind = count_4kind + 1;
    elseif dice_roll(1) == dice_roll(3) || dice_roll(2) == dice_roll(4) || dice_roll(3) == dice_roll(5)
        count_3kind = count_3kind + 1;
    elseif dice_roll(1) == dice_roll(2) || dice_roll(2) == dice_roll(3) || dice_roll(3) == dice_roll(4) || dice_roll(4) == dice_roll(5)
        count_pair = count_pair + 1;
    end
end

%find the percentages
percent_pair = count_pair/count_rolls*100;
percent_3kind = count_3kind/count_rolls*100;
percent_4kind = count_4kind/count_rolls*100;
percent_5kind = count_5kind/count_rolls*100;

%print out percentages
fprintf('Roll percentages - Pair: %0.2f, Three-of-a-kind: %0.2f, Four-of-a-kind: %0.2f, Five-of-a-kind: %0.2f\n',percent_pair,percent_3kind,percent_4kind,percent_5kind);