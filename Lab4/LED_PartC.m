%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAB 4: Starter Code to Check Circuit Function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% house cleaning
clear;      % clears out everything in workspace
close all;  % closes all figures
clc;        % clears out the command window
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% set up communication to DAQ device
fprintf('Setting up connection to DAQ...\n');
devices_found = daq.getDevices;
if isempty(devices_found)
    error('No devices connected: please connect a DAQ device and rerun.');
end
% Set up DAQ Connection to Device
DAQ_Vendor = devices_found.Vendor.ID;                   % determine type of device connected
DAQ_ID = devices_found.ID;                              % determine ID for connected device
DAQ = daq.createSession(DAQ_Vendor);                    % create DAQ session
DAQ.addAnalogOutputChannel(DAQ_ID,0,'Voltage');         % add output voltage channel to play waveform through filter
DAQ.Rate = 10000;                                       % Set the DAQ sampling rate
DAQ.outputSingleScan(0);                                % ensure DAQ output is 0V
fprintf('Connection established...\n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%