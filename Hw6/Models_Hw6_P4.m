%Models Hw6 Problem 4
clear; clc;

%input
rng('shuffle')
money = input('How much money do you have in total ($)? ');
balance = money;
playgame = 1;
while balance > 0  &&  playgame == 1
    wager = input('What is your wager ($)? ');
    if wager > balance
        fprintf('Do not wager more money than you are able to.\n')
        wager = input('What is your wager ($)? ');
    end
    choice = menu('Under 7, 7, or over 7? ','Under 7','7','Over 7');
    
    die1 = randi([1 6],1);
    die2 = randi([1 6],1);
    
    roll_value = die1 + die2;
    
    fprintf('Die one reads %i and die two reads %i.\n',die1,die2);
    fprintf('The dice read %i.\n',roll_value);
    
    if (roll_value < 7  &&  choice == 1) || (roll_value > 7  &&  choice == 3)
        winnings = wager;
        fprintf('You win! The payout is one-to-one so you receive $%i.\n',winnings);
        balance = balance + winnings;
    elseif  (roll_value == 7  &&  choice == 2)
        winnings = wager*4;
        fprintf('You win! The payout is four-to-one so you receive $%i.\n',winnings);
        balance = balance + winnings;
    else
        loss = wager;
        fprintf('You lose. You have lost $%i.\n',loss);
        balance = balance - loss;
    end
    fprintf('Your balance is $%i.\n',balance);
    playgame = menu('Would you like to play again?','Yes','No');
end

if playgame == 1  &&  balance == 0
    fprintf('Sorry, you are out of money and cannot play again.\n');
end

fprintf('Your final balance is $%i. Thank you for playing!\n',balance);