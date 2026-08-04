clc;
clear;
close all;

%% ==========================================================
% Create Output Folder
%% ==========================================================

scriptPath = fileparts(mfilename('fullpath'));

if isempty(scriptPath)
    scriptPath = pwd;
end

outputFolder = fullfile(scriptPath,'5G_6G_Interference_Output');

if ~exist(outputFolder,'dir')
    mkdir(outputFolder);
end

%% ==========================================================
% Simulation Parameters
%% ==========================================================

numUsers = 20:20:200;          % Number of Users
reuseFactor = [1 3 7];         % Frequency Reuse Factors

BW = 20e6;                     % 20 MHz Bandwidth
noisePower = 1e-10;            % Noise Power (W)
txPower = 1;                   % Base Station Transmit Power (W)

%% ==========================================================
% Preallocate Arrays
%% ==========================================================

SINR = zeros(length(reuseFactor),length(numUsers));
Throughput = zeros(length(reuseFactor),length(numUsers));
SNR = zeros(1,length(numUsers));

%% ==========================================================
% Main Simulation
%% ==========================================================

for r = 1:length(reuseFactor)

    N = reuseFactor(r);

    for i = 1:length(numUsers)

        users = numUsers(i);

        % Desired Signal
        signalPower = txPower/users;

        % Interference
        interferencePower = ((users/N)-1)*0.02;

        % SNR
        snrLinear = signalPower/noisePower;
        SNR(i) = 10*log10(snrLinear);

        % SINR
        sinrLinear = signalPower/(interferencePower + noisePower);
        SINR(r,i) = 10*log10(sinrLinear);

        % Throughput (Shannon Capacity)
        Throughput(r,i) = BW*log2(1+sinrLinear)/1e6;

    end

end

%% ==========================================================
% Graph 1 : User Density vs SNR
%% ==========================================================

fig1 = figure;

plot(numUsers,SNR,'LineWidth',2)

grid on

xlabel('User Density')
ylabel('SNR (dB)')
title('User Density vs SNR')

exportgraphics(fig1,...
    fullfile(outputFolder,'UserDensity_vs_SNR.png'),...
    'Resolution',300);

%% ==========================================================
% Graph 2 : User Density vs SINR
%% ==========================================================

fig2 = figure;

plot(numUsers,SINR(1,:),'-o','LineWidth',2)
hold on
plot(numUsers,SINR(2,:),'-s','LineWidth',2)
plot(numUsers,SINR(3,:),'-^','LineWidth',2)

grid on

xlabel('User Density')
ylabel('SINR (dB)')
title('SINR under Different Frequency Reuse Factors')

legend('Reuse Factor = 1',...
       'Reuse Factor = 3',...
       'Reuse Factor = 7',...
       'Location','best')

exportgraphics(fig2,...
    fullfile(outputFolder,'UserDensity_vs_SINR.png'),...
    'Resolution',300);

%% ==========================================================
% Graph 3 : User Density vs Throughput
%% ==========================================================

fig3 = figure;

plot(numUsers,Throughput(1,:),'-o','LineWidth',2)
hold on
plot(numUsers,Throughput(2,:),'-s','LineWidth',2)
plot(numUsers,Throughput(3,:),'-^','LineWidth',2)

grid on

xlabel('User Density')
ylabel('Throughput (Mbps)')
title('Throughput under Different Frequency Reuse Factors')

legend('Reuse Factor = 1',...
       'Reuse Factor = 3',...
       'Reuse Factor = 7',...
       'Location','best')

exportgraphics(fig3,...
    fullfile(outputFolder,'UserDensity_vs_Throughput.png'),...
    'Resolution',300);

%% ==========================================================
% Graph 4 : SINR vs Throughput
%% ==========================================================

fig4 = figure;

plot(SINR(1,:),Throughput(1,:),'o-','LineWidth',2)
hold on
plot(SINR(2,:),Throughput(2,:),'s-','LineWidth',2)
plot(SINR(3,:),Throughput(3,:),'^-','LineWidth',2)

grid on

xlabel('SINR (dB)')
ylabel('Throughput (Mbps)')
title('SINR vs Throughput')

legend('Reuse = 1',...
       'Reuse = 3',...
       'Reuse = 7',...
       'Location','best')

exportgraphics(fig4,...
    fullfile(outputFolder,'SINR_vs_Throughput.png'),...
    'Resolution',300);

%% ==========================================================
% Display Results
%% ==========================================================

disp('--------------------------------------------------------');
disp(' Users    SNR(dB)   SINR(R1)   Throughput(R1 Mbps)');
disp('--------------------------------------------------------');

for i = 1:length(numUsers)

    fprintf('%5d %10.2f %10.2f %15.2f\n',...
        numUsers(i),SNR(i),SINR(1,i),Throughput(1,i));

end

%% ==========================================================
% Completion Message
%% ==========================================================

disp(' ');
disp('Simulation completed successfully.');
disp(['Images saved in: ',outputFolder]);

disp('Saved Files:');
disp('1. UserDensity_vs_SNR.png');
disp('2. UserDensity_vs_SINR.png');
disp('3. UserDensity_vs_Throughput.png');
disp('4. SINR_vs_Throughput.png');