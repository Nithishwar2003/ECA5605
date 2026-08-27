clc;
clear;
close all;

%% =========================================================
% V2X / Vehicular Communication Performance Analysis
%
% Objective 1 : Vehicle Speed vs End-to-End Latency
% Objective 2 : Vehicle Speed vs Packet Delivery Ratio
% Objective 3 : Vehicle Speed vs Communication Range
% =========================================================

%% Create Output Folder

scriptPath = fileparts(mfilename('fullpath'));

if isempty(scriptPath)
    scriptPath = pwd;
end

outputFolder = fullfile(scriptPath,...
    'V2X_Vehicular_Communication_Output');

if ~exist(outputFolder,'dir')
    mkdir(outputFolder);
end


%% =========================================================
% OBJECTIVE 1
% Vehicle Speed vs End-to-End Latency
% =========================================================

speed = 20:20:120;

latency = [18 16 14 12 10 9];

%% Display Results

disp(' ');
disp('==============================================');
disp('OBJECTIVE 1 - END-TO-END LATENCY');
disp('==============================================');

disp('Vehicle Speed (km/h)   End-to-End Latency (ms)');

disp([speed' latency']);


%% Create Figure 1

figure1 = figure;

% Graph 1

subplot(2,1,1)

plot(speed,latency,'-o','LineWidth',2)

title('Vehicle Speed vs End-to-End Latency')

xlabel('Vehicle Speed (km/h)')
ylabel('Latency (ms)')

grid on


% Graph 2

subplot(2,1,2)

plot(1:length(latency),latency,...
    '-s','LineWidth',2)

title('Latency Variation Across Vehicles')

xlabel('Vehicle Index')
ylabel('End-to-End Latency (ms)')

grid on


%% Save Figure 1

exportgraphics(figure1,...
    fullfile(outputFolder,...
    'Objective1_Vehicle_Speed_vs_Latency.png'),...
    'Resolution',300);


%% =========================================================
% OBJECTIVE 2
% Vehicle Speed vs Packet Delivery Ratio
% =========================================================

speed = 20:20:120;

PDR = [99 98 97 95 93 90];


%% Display Results

disp(' ');
disp('==============================================');
disp('OBJECTIVE 2 - PACKET DELIVERY RATIO');
disp('==============================================');

disp('Vehicle Speed (km/h)   Packet Delivery Ratio (%)');

disp([speed' PDR']);


%% Create Figure 2

figure2 = figure;

% Graph 1

subplot(2,1,1)

plot(speed,PDR,'-o','LineWidth',2)

title('Vehicle Speed vs Packet Delivery Ratio')

xlabel('Vehicle Speed (km/h)')
ylabel('Packet Delivery Ratio (%)')

grid on

ylim([85 102])


% Graph 2

subplot(2,1,2)

plot(1:length(PDR),PDR,...
    '-s','LineWidth',2)

title('Packet Delivery Ratio Across Vehicles')

xlabel('Vehicle Index')
ylabel('Packet Delivery Ratio (%)')

grid on

ylim([85 102])


%% Save Figure 2

exportgraphics(figure2,...
    fullfile(outputFolder,...
    'Objective2_Vehicle_Speed_vs_PDR.png'),...
    'Resolution',300);


%% =========================================================
% OBJECTIVE 3
% Vehicle Speed vs Communication Range
% =========================================================

vehicle = 1:6;

speed = [30 45 60 75 90 105];

range = [280 260 240 220 200 180];


%% Display Results

disp(' ');
disp('==============================================');
disp('OBJECTIVE 3 - COMMUNICATION RANGE');
disp('==============================================');

disp('Vehicle   Speed (km/h)   Communication Range (m)');

disp([vehicle' speed' range']);


%% Create Figure 3

figure3 = figure;

% Graph 1

subplot(2,1,1)

plot(vehicle,speed,...
    '-o','LineWidth',2)

title('Vehicle Speed of Different Vehicles')

xlabel('Vehicle Index')
ylabel('Vehicle Speed (km/h)')

grid on


% Graph 2

subplot(2,1,2)

plot(speed,range,...
    '-s','LineWidth',2)

title('Vehicle Speed vs Communication Range')

xlabel('Vehicle Speed (km/h)')
ylabel('Communication Range (m)')

grid on


%% Save Figure 3

exportgraphics(figure3,...
    fullfile(outputFolder,...
    'Objective3_Vehicle_Speed_vs_Communication_Range.png'),...
    'Resolution',300);


%% =========================================================
% Final Display
% =========================================================

disp(' ');
disp('================================================');
disp('       V2X VEHICULAR COMMUNICATION');
disp('================================================');

disp(' ');
disp('PNG files saved successfully:');

disp('1. Objective1_Vehicle_Speed_vs_Latency.png');
disp('2. Objective2_Vehicle_Speed_vs_PDR.png');
disp('3. Objective3_Vehicle_Speed_vs_Communication_Range.png');

disp(' ');
disp(['Output folder: ',outputFolder]);

disp(' ');
disp('All three objectives executed successfully.');