%   Robert W. Rost
%   September 20, 2015
%   Rocket Flight
%   Program will ask user for system of units
%   Based on response, user is asked for
%   empty mass of rocket (kg or slugs)
%   fuelmass (kg or slugs)
%   rate at which rocket burns fuel (kg/sec or slugs/sec)
%   exit velocity of thrust (m/sec or ft/sec)
%   desired height of rocket
%   mass of fuel to add if rocket does not meet desired height
%
clear
close all
home
% Initialize variables
time=zeros(1);                          % time vector
vel=zeros(1);                            % velocity of rocket
height=zeros(1);                       % height of rocket
fuelmass=zeros(1);                   % mass of fuel
maxheighttime=zeros(1);          % time of maximum height of rocket
maxveltime=zeros(1);               % time of maximum velocity of rocket
tpeak=zeros(1);                        % time to peak height
hpeak=zeros(1);                       % height at peak time
thit=zeros(1);                           % time to hit gound
maxheight=zeros(1);                 % maximum height of rocket
maxvel=zeros(1);                      % maximum velocity of rocket
% additional variables:
% emptymass - mass of rocket without fule
% q - rate at which rocket burns fuel
% u - velocity of rocket thrust
% m0- total mass of rocket (emptymass+fuelmass)
% burntime - total time rocket burns fuel (fuelmass/q)
% maximumheight - maximum height rocket must attain
% addfuel - mass of fuel added each itteration
answer='no';
%
% input section
%
    unittype=menu('unit type:','SI (g=9.81 ft/sec^2)','gravitational(g=32.2 ft/sec^2)');
    if unittype==1
        g=9.81;
    else
        g=32.2;
    end
    name='Weather Sat';
    if unittype==1
        emptymass=1460;
        fuelmass(1)=1460;
        q=14.6;
        u=2440;
        maximumheight=57700;
        addfuel=200;
    else
        emptymass=100;
        fuelmass(1)=100;
        q=1;
        u=8000;
        maximumheight=200000;
        addfuel=20;
    end
    burntime=fuelmass/q;
    m0=emptymass+fuelmass;
    home
%
% Calculation section
%
profile=1;
while maxheight(profile) < maximumheight
    burntime(profile)=round(fuelmass(profile)/q);
    m0=emptymass+fuelmass(profile);
    %
    % Calculations while rocket is burning fuel
    %
    for t=1:burntime(profile)
        time(t,profile)=t;
        vel(t,profile)=u*log(m0/(m0-q*t))-g*t;
        height(t,profile)=((u/q)*(m0-q*t)*log(m0-q*t))+u*(log(m0)+1)*t-((g*t^2)/2)-((m0*u)/q)*log(m0);
        if maxvel(profile) < vel(t,profile)
            maxvel(profile)=vel(t,profile);
            maxveltime(profile)=t;
        end
        if maxheight(profile)<height(t,profile)
            maxheight(profile)=height(t,profile);
            maxheighttime(profile)=t;
        end
    end
    tpeak(profile)=burntime(profile)+(vel(burntime(profile),profile)/g);
    hpeak(profile)=height(burntime(profile),profile)+((vel(burntime(profile),profile)^2)/(2*g));
    thit(profile)=tpeak(profile)+sqrt((2*hpeak(profile))/g);
    thit(profile)=round(thit(profile));
    %
    % Calculation when rocket is out of fuel
    %
    for t=burntime(profile)+1:thit(profile)
        time(t,profile)=t;
        vel(t,profile)=vel(burntime(profile),profile)-g*(t-burntime(profile));
        height(t,profile)=height(burntime(profile),profile)+vel(burntime(profile),profile)*(t-burntime(profile))-(g*(t-burntime(profile))^2)/2;
        if maxvel(profile) < vel(t,profile)
            maxvel(profile)=vel(t,profile);
            maxveltime(profile)=t;
        end
        if maxheight(profile)<height(t,profile)
            maxheight(profile)=height(t,profile);
            maxheighttime(profile)=t;
        end
    end
    profile=profile+1;
    maxheight(profile)=maxheight(profile-1);
    maxvel(profile)=maxvel(profile-1);
    fuelmass(profile)=fuelmass(profile-1)+addfuel;
end
% output section
fprintf('\n\nrocket name: %s\n',name)
if unittype==1
    %output to display
    fprintf('\nto reach the desired height you need %4.0f kg of fuel \n',fuelmass(profile-1))
    fprintf('max velocity =  %8.4f meters/sec at %3.2f sec \n', maxvel(profile-1), maxveltime(profile-1))
    fprintf('max height =  %8.4f meters at %3.2f sec \n', maxheight(profile-1), maxheighttime(profile-1))
    fprintf('total flight time = %8.2f seconds \n',thit(profile-1))
    fprintf('the rocket hits the ground at %8.4f meters/sec \n',min(vel(:,profile-1)))
    % plot velocity vrs time
    figure(1)
    legendtext='';
    for ii=1:profile-1
        plot(1:thit(ii),vel(1:thit(ii),ii))
        hold on
        legendtext=[legendtext;strcat(num2str(fuelmass(ii)),' kg')];
    end
    xlabel('time (sec)')
    ylabel('velocity (meters/sec)')
    title('velocity of rocket for different fuel mass')
    legend(legendtext)
    hold off
    % plot height vrs time
    figure(2)
    for ii=1:profile-1
        plot(1:thit(ii),height(1:thit(ii),ii))
        hold on
    end
    xlabel('time (sec)')
    ylabel('height (meters)')
    title('height of rocket for different fuel mass')
    legend(legendtext)
    hold off
else
    % output to display
    fprintf('\nto reach the desired height you need %4.0f slugs of fuel \n',fuelmass(profile-1))
    fprintf('max velocity =  %8.4f feet/sec at %3.2f sec \n', maxvel(profile-1), maxveltime(profile-1))
    fprintf('max height =  %8.4f feet at %3.2f sec \n', maxheight(profile-1), maxheighttime(profile-1))
    fprintf('total flight time = %8.2f seconds \n',thit(profile-1))
    fprintf('the rocket hits the ground at %8.4f feet/sec \n',min(vel(:,profile-1)))
    % plot velocity vrs time
    figure(1)
    legendtext='';
    for ii=1:profile-1
        plot(1:thit(ii),vel(1:thit(ii),ii))
        hold on
        legendtext=[legendtext;strcat(num2str(fuelmass(ii)),' slugs')];
    end
    xlabel('time (sec)')
    ylabel('velocity (ft/sec)')
    title('velocity of rocket for different fuel mass')
    legend(legendtext)
    hold off
    % plot height vrs time
    figure(2)
    for ii=1:profile-1
        plot(1:thit(ii),height(1:thit(ii),ii))
        hold on
    end
    xlabel('time (sec)')
    ylabel('height (ft)')
    title('height of rocket for different fuel mass')
    legend(legendtext)
    hold off
end
fprintf('\n\nif you selected SI units make sure to check the output to display\n')
fprintf('is the total flight time correct?\n\n')
fprintf('if you selected gravatation units make sure both plots have titles and labels\n')