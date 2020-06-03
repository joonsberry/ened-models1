%Models Hw8 Problem 4
clear; clc;

rng('shuffle');

wlt = [0 1 -1 -1 1;-1 0 1 1 -1;1 -1 0 -1 1;1 -1 1 0 -1;-1 1 -1 1 0];
picks = {'Rock','Paper','Scissors','Lizard','Spock'};
play = 1;
winCount = 0;
lossCount = 0;
tieCount = 0;

while play == 1
    player_pick = menu('What is your pick?',picks);
    bot_pick = randi([1 5],1);
    result = wlt(bot_pick,player_pick);
    if result == 1
        player_status = 'Wins!';
        winCount = winCount + 1;
    elseif result == -1;
        player_status = 'Loses.';
        lossCount = lossCount + 1;
    else
        player_status = 'Ties.';
        tieCount = tieCount + 1;
    end
    fprintf('The player choice is %s. The computer choice is %s. The player %s\n\n',picks{player_pick},picks{bot_pick},player_status);
    play = menu('Play again?','Yes','No');
end
fprintf('\nThe player won %i time(s). The player lost %i time(s). The player tied %i time(s).\n',winCount,lossCount,tieCount);