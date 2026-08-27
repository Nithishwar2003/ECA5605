clc;
clear;
close all;

%% =========================================================
% IoT Smart Agriculture
% Soil Moisture Monitoring, Pump Control and Irrigation Efficiency
% =========================================================

%% Common Data

time = 1:10;

soil_moisture = [30 35 28 25 20 18 22 30 40 45];

threshold = 40;

%% =========================================================
% Create Output Folder
% =========================================================

scriptPath = fileparts(mfilename('fullpath'));

if isempty(scriptPath)
    scriptPath = pwd;
end

outputFolder = fullfile(scriptPath,...
    'IoT_Smart_Agriculture_Output');

if ~exist(outputFolder,'dir')
    mkdir(outputFolder);
end

%% =========================================================
% OBJECTIVE 1
% Soil Moisture Monitoring
% =========================================================

figure1 = figure;

% Graph 1: Soil Moisture Variation

subplot(2,1,1)

plot(time,soil_moisture,'-o','LineWidth',2)

hold on

yline(threshold,'--','Threshold')

title('Soil Moisture Monitoring in IoT Smart Agriculture')

xlabel('Time (Hours)')
ylabel('Soil Moisture (%)')

grid on

% Graph 2: Moisture Status

status = soil_moisture >= threshold;

subplot(2,1,2)

stem(time,status,'filled','LineWidth',2)

title('Soil Condition Status (1=Wet, 0=Dry)')

xlabel('Time (Hours)')
ylabel('Status')

ylim([-0.2 1.2])

grid on

% Save Objective 1

exportgraphics(figure1,...
    fullfile(outputFolder,...
    'Objective1_Soil_Moisture_Monitoring.png'),...
    'Resolution',300);


%% =========================================================
% OBJECTIVE 2
% Automatic Water Pump Control
% =========================================================

figure2 = figure;

% Pump Control Logic
% 1 = Pump ON
% 0 = Pump OFF

pump_status = soil_moisture < threshold;

% Graph 1: Soil Moisture vs Pump Status

subplot(2,1,1)

plot(time,soil_moisture,'-o','LineWidth',2)

hold on

yline(threshold,'--','Threshold')

title('Soil Moisture vs Pump Control')

xlabel('Time (Hours)')
ylabel('Soil Moisture (%)')

grid on

% Graph 2: Pump Status

subplot(2,1,2)

stem(time,pump_status,'filled','LineWidth',2)

title('Water Pump Status (1=ON, 0=OFF)')

xlabel('Time (Hours)')
ylabel('Pump Status')

ylim([-0.2 1.2])

grid on

% Save Objective 2

exportgraphics(figure2,...
    fullfile(outputFolder,...
    'Objective2_Pump_Control.png'),...
    'Resolution',300);


%% =========================================================
% OBJECTIVE 3
% Irrigation Efficiency
% =========================================================

figure3 = figure;

% Calculate Irrigation Efficiency

efficiency = ...
    (soil_moisture ./ threshold) * 100;

% Limit maximum efficiency to 100%

efficiency(efficiency > 100) = 100;

% Graph 1: Soil Moisture Variation

subplot(2,1,1)

plot(time,soil_moisture,'-o','LineWidth',2)

hold on

yline(threshold,'--','Threshold')

title('Soil Moisture Variation')

xlabel('Time (Hours)')
ylabel('Soil Moisture (%)')

grid on

% Graph 2: Irrigation Efficiency

subplot(2,1,2)

plot(time,efficiency,'-s','LineWidth',2)

title('Irrigation Efficiency (%) in Smart Agriculture')

xlabel('Time (Hours)')
ylabel('Efficiency (%)')

ylim([0 110])

grid on

% Save Objective 3

exportgraphics(figure3,...
    fullfile(outputFolder,...
    'Objective3_Irrigation_Efficiency.png'),...
    'Resolution',300);


%% =========================================================
% Display Results
% =========================================================

disp(' ');
disp('================================================');
disp('      IoT SMART AGRICULTURE SIMULATION');
disp('================================================');

disp(' ');
disp('Soil Moisture Values (%):');
disp(soil_moisture);

disp(' ');
disp(['Irrigation Threshold = ',num2str(threshold),' %']);

disp(' ');
disp('Moisture Status (1 = Wet, 0 = Dry):');
disp(status);

disp(' ');
disp('Pump Status (1 = ON, 0 = OFF):');
disp(pump_status);

disp(' ');
disp('Irrigation Efficiency (%):');
disp(efficiency);

disp(' ');
disp('================================================');
disp('PNG FILES SAVED SUCCESSFULLY');
disp('================================================');

disp('1. Objective1_Soil_Moisture_Monitoring.png');
disp('2. Objective2_Pump_Control.png');
disp('3. Objective3_Irrigation_Efficiency.png');

disp(' ');
disp(['Saved in folder: ',outputFolder]);

disp(' ');
disp('Simulation completed successfully.');