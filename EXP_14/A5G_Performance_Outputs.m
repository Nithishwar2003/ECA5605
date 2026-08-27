clc;
clear;
close all;

%% =========================================================
% 5G PERFORMANCE ANALYSIS
% Objective 1: Throughput vs SNR
% Objective 2: BER and Reliability vs SNR
% Objective 3: Modulation, SNR and Spectral Efficiency
% =========================================================

%% Create Output Folder

outputFolder = fullfile(pwd,'5G_Performance_Outputs');

if ~exist(outputFolder,'dir')
    mkdir(outputFolder);
end

disp('Output folder:');
disp(outputFolder);


%% =========================================================
% OBJECTIVE 1
% 5G Throughput vs SNR
% =========================================================

% SNR values (dB)
SNR = 0:5:30;

% Maximum Throughput (Mbps)
Max_TP = 100;

% Throughput calculation
Throughput = Max_TP*(1-exp(-SNR/10));

% Display Results
disp(' ');
disp('==========================================');
disp('OBJECTIVE 1 - 5G THROUGHPUT');
disp('==========================================');
disp('SNR(dB)    Throughput(Mbps)');
disp([SNR' Throughput']);

% Create Figure
figure('Name','5G Throughput vs SNR');

% -------- Graph 1 --------
subplot(2,1,1)

plot(SNR,Throughput,'-o','LineWidth',2);

title('5G Throughput vs SNR');
xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Throughput (Mbps)');
grid on;

% -------- Graph 2 --------
subplot(2,1,2)

bar(Throughput);

title('Throughput at Different SNR Levels');
xlabel('SNR Index');
ylabel('Throughput (Mbps)');
grid on;

% Save Objective 1
exportgraphics(gcf, ...
    fullfile(outputFolder,'Objective1_5G_Throughput_vs_SNR.png'), ...
    'Resolution',300);


%% =========================================================
% OBJECTIVE 2
% BER and Communication Reliability vs SNR
% =========================================================

% SNR values (dB)
SNR = 0:5:30;

% Simulated Bit Error Rate
BER = [0.30 0.18 0.10 0.05 0.02 0.008 0.001];

% Reliability
Reliability = (1-BER)*100;

% Display Results
disp(' ');
disp('==========================================');
disp('OBJECTIVE 2 - BER AND RELIABILITY');
disp('==========================================');
disp('SNR(dB)    BER       Reliability(%)');
disp([SNR' BER' Reliability']);

% Create Figure
figure('Name','5G BER and Reliability');

% -------- Graph 1 --------
subplot(2,1,1)

semilogy(SNR,BER,'-o','LineWidth',2);

title('SNR vs Bit Error Rate in 5G');
xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Bit Error Rate (BER)');
grid on;

% -------- Graph 2 --------
subplot(2,1,2)

plot(SNR,Reliability,'-s','LineWidth',2);

title('SNR vs Communication Reliability');
xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Reliability (%)');
grid on;

ylim([0 105]);

% Save Objective 2
exportgraphics(gcf, ...
    fullfile(outputFolder,'Objective2_5G_BER_Reliability.png'), ...
    'Resolution',300);


%% =========================================================
% OBJECTIVE 3
% Modulation, Required SNR and Spectral Efficiency
% =========================================================

% Modulation schemes
Modulation = {'QPSK','16-QAM','64-QAM','256-QAM'};

% Required SNR (dB)
SNR_Mod = [5 10 18 25];

% Spectral Efficiency (bits/s/Hz)
Efficiency = [2 4 6 8];

% Display Results
disp(' ');
disp('==========================================');
disp('OBJECTIVE 3 - MODULATION PERFORMANCE');
disp('==========================================');

Result = table(Modulation',SNR_Mod',Efficiency', ...
    'VariableNames', ...
    {'Modulation','SNR_dB','Efficiency_bits_per_Hz'});

disp(Result);

% Create Figure
figure('Name','Modulation and Spectral Efficiency');

% -------- Graph 1 --------
subplot(2,1,1)

plot(1:4,SNR_Mod,'-s','LineWidth',2);

xticks(1:4);
xticklabels(Modulation);

title('Required SNR for Different Modulation Schemes');
xlabel('Modulation Scheme');
ylabel('Required SNR (dB)');
grid on;

% -------- Graph 2 --------
subplot(2,1,2)

plot(SNR_Mod,Efficiency,'-o','LineWidth',2);

title('SNR vs Spectral Efficiency');
xlabel('Signal-to-Noise Ratio (dB)');
ylabel('Spectral Efficiency (bits/s/Hz)');
grid on;

% Save Objective 3
exportgraphics(gcf, ...
    fullfile(outputFolder,'Objective3_Modulation_Spectral_Efficiency.png'), ...
    'Resolution',300);


%% =========================================================
% COMPLETION MESSAGE
% =========================================================

disp(' ');
disp('==========================================');
disp('ALL OBJECTIVES COMPLETED SUCCESSFULLY');
disp('==========================================');

disp('PNG files saved in:');
disp(outputFolder);

disp(' ');
disp('Saved Files:');
disp('1. Objective1_5G_Throughput_vs_SNR.png');
disp('2. Objective2_5G_BER_Reliability.png');
disp('3. Objective3_Modulation_Spectral_Efficiency.png');