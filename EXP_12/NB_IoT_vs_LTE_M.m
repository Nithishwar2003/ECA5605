clc;
clear;
close all;

%% =========================================================
% NB-IoT vs LTE-M Performance Analysis
% Parameters:
% 1. Throughput
% 2. Latency
% 3. Packet Delivery Ratio
% =========================================================

%% Common SNR Values

SNR = 0:5:30;

%% =========================================================
% Create Output Folder
% =========================================================

scriptPath = fileparts(mfilename('fullpath'));

if isempty(scriptPath)
    scriptPath = pwd;
end

outputFolder = fullfile(scriptPath,...
    'NB_IoT_LTE_M_Output');

if ~exist(outputFolder,'dir')
    mkdir(outputFolder);
end

%% =========================================================
% OBJECTIVE 1 : Throughput vs SNR
% =========================================================

% Simulated Throughput (Mbps)

NB_IoT_Throughput = ...
    0.05*(1-exp(-SNR/8));

LTE_M_Throughput = ...
    1.2*(1-exp(-SNR/8));

%% Display Throughput Results

disp(' ');
disp('==============================================');
disp('OBJECTIVE 1 - THROUGHPUT');
disp('==============================================');

disp('SNR (dB)   NB-IoT (Mbps)   LTE-M (Mbps)');

disp([SNR' NB_IoT_Throughput' LTE_M_Throughput']);

%% Figure 1

figure1 = figure;

subplot(2,1,1)

plot(SNR,NB_IoT_Throughput,...
    '-o','LineWidth',2);

title('NB-IoT Throughput vs SNR');

xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Throughput (Mbps)');

grid on;

subplot(2,1,2)

plot(SNR,LTE_M_Throughput,...
    '-s','LineWidth',2);

title('LTE-M Throughput vs SNR');

xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Throughput (Mbps)');

grid on;

%% Save Figure 1

exportgraphics(figure1,...
    fullfile(outputFolder,...
    'Objective1_Throughput_vs_SNR.png'),...
    'Resolution',300);


%% =========================================================
% OBJECTIVE 2 : Latency vs SNR
% =========================================================

NB_IoT_Latency = ...
    [180 160 145 130 120 110 100];

LTE_M_Latency = ...
    [90 80 70 60 50 45 40];

%% Display Latency Results

disp(' ');
disp('==============================================');
disp('OBJECTIVE 2 - LATENCY');
disp('==============================================');

disp('SNR (dB)   NB-IoT Latency (ms)   LTE-M Latency (ms)');

disp([SNR' NB_IoT_Latency' LTE_M_Latency']);

%% Figure 2

figure2 = figure;

subplot(2,1,1)

plot(SNR,NB_IoT_Latency,...
    '-o','LineWidth',2);

title('NB-IoT Latency vs SNR');

xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Latency (ms)');

grid on;

subplot(2,1,2)

plot(SNR,LTE_M_Latency,...
    '-s','LineWidth',2);

title('LTE-M Latency vs SNR');

xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Latency (ms)');

grid on;

%% Save Figure 2

exportgraphics(figure2,...
    fullfile(outputFolder,...
    'Objective2_Latency_vs_SNR.png'),...
    'Resolution',300);


%% =========================================================
% OBJECTIVE 3 : Packet Delivery Ratio vs SNR
% =========================================================

NB_IoT_PDR = ...
    [82 86 89 92 95 97 99];

LTE_M_PDR = ...
    [88 91 94 96 98 99 100];

%% Display PDR Results

disp(' ');
disp('==============================================');
disp('OBJECTIVE 3 - PACKET DELIVERY RATIO');
disp('==============================================');

disp('SNR (dB)   NB-IoT PDR (%)   LTE-M PDR (%)');

disp([SNR' NB_IoT_PDR' LTE_M_PDR']);

%% Figure 3

figure3 = figure;

subplot(2,1,1)

plot(SNR,NB_IoT_PDR,...
    '-o','LineWidth',2);

title('NB-IoT Packet Delivery Ratio vs SNR');

xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Packet Delivery Ratio (%)');

grid on;

ylim([75 105]);

subplot(2,1,2)

plot(SNR,LTE_M_PDR,...
    '-s','LineWidth',2);

title('LTE-M Packet Delivery Ratio vs SNR');

xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Packet Delivery Ratio (%)');

grid on;

ylim([75 105]);

%% Save Figure 3

exportgraphics(figure3,...
    fullfile(outputFolder,...
    'Objective3_Packet_Delivery_Ratio.png'),...
    'Resolution',300);


%% =========================================================
% Final Display
% =========================================================

disp(' ');
disp('================================================');
disp('       NB-IoT vs LTE-M SIMULATION');
disp('================================================');

disp(' ');
disp('PNG files saved successfully:');

disp('1. Objective1_Throughput_vs_SNR.png');
disp('2. Objective2_Latency_vs_SNR.png');
disp('3. Objective3_Packet_Delivery_Ratio.png');

disp(' ');
disp(['Output folder: ',outputFolder]);

disp(' ');
disp('All three objectives executed successfully.');