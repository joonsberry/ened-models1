%Models Hw4 Problem 4
clear; clc;

%input
rng('shuffle')
wager = input('What is your wager ($)? ');

choice = menu('Under 7, 7, or over 7? ','Under 7','7','Over 7');

die1 = randi([1 6],1);
die2 = randi([1 6],1);

roll_value = die1 + die2;

fprintf('Die one reads %i and die two reads %i.\n',die1,die2);
fprintf('The dice read %i.\n',roll_value);

if (roll_value < 7  &&  choice == 1) || (roll_value > 7  &&  choice == 3)
    winnings = wager;
    fprint('You win! The payout is one-to-one so you receive $%i.\n',winnings);
elseif  (roll_value == 7  &&  choice == 2)
    winnings = wager*4;
    fprintf('You win! The payout is four-to-one so you receive $%i.\n',winnings);
else
    loss = wager;
    fprintf('You lose. You have lost $%i.\n',loss);
end