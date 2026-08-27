clc;
clear;
close all;

%% =========================================================
% AI-Based Wireless Optimization Simulation
% =========================================================

N = 100;                         % Number of simulation points
x = 1:N;

%% =========================================================
% Create Output Folder
% =========================================================

scriptPath = fileparts(mfilename('fullpath'));

if isempty(scriptPath)
    scriptPath = pwd;
end

outputFolder = fullfile(scriptPath,'AI_Wireless_Optimization_Output');

if ~exist(outputFolder,'dir')
    mkdir(outputFolder);
end

%% =========================================================
% Prediction Accuracy
% =========================================================

predictionAccuracy = 70 + 25*(1-exp(-x/25));

predictionAccuracy = predictionAccuracy + 1.5*randn(1,N);

predictionAccuracy = min(max(predictionAccuracy,65),99);

%% =========================================================
% Throughput
% =========================================================

throughput = 20 + 80*(1-exp(-x/30));

throughput = throughput + 3*randn(1,N);

throughput = max(throughput,10);

%% =========================================================
% Delay
% =========================================================

delay = 100*exp(-x/35) + 10;

delay = delay + 2*randn(1,N);

delay = max(delay,5);

%% =========================================================
% Resource Allocation
% =========================================================

resourceAllocation = 50 + 45*(1-exp(-x/20));

resourceAllocation = resourceAllocation + 2*randn(1,N);

resourceAllocation = min(max(resourceAllocation,40),100);

%% =========================================================
% Energy Efficiency
% =========================================================

energyEfficiency = 2 + 8*(1-exp(-x/30));

energyEfficiency = energyEfficiency + 0.3*randn(1,N);

energyEfficiency = max(energyEfficiency,1);

%% =========================================================
% Overall Performance
% =========================================================

overallPerformance = ...
    0.2*predictionAccuracy + ...
    0.2*(throughput/max(throughput)*100) + ...
    0.2*(100-delay/max(delay)*100) + ...
    0.2*resourceAllocation + ...
    0.2*(energyEfficiency/max(energyEfficiency)*100);

%% =========================================================
% Create Main Figure
% =========================================================

fig = figure('Color','white');

%% Prediction Accuracy

subplot(2,3,1)

plot(x,predictionAccuracy,'b-o',...
    'LineWidth',1.2,...
    'MarkerSize',3);

title('Prediction Accuracy');
xlabel('Simulation Iteration');
ylabel('Accuracy (%)');

grid on;
ylim([60 100]);

%% Throughput

subplot(2,3,2)

plot(x,throughput,'g-s',...
    'LineWidth',1.2,...
    'MarkerSize',3);

title('Throughput');
xlabel('Simulation Iteration');
ylabel('Throughput (Mbps)');

grid on;

%% Delay

subplot(2,3,3)

plot(x,delay,'r-*',...
    'LineWidth',1.2,...
    'MarkerSize',3);

title('Delay');
xlabel('Simulation Iteration');
ylabel('Delay (ms)');

grid on;

%% Resource Allocation

subplot(2,3,4)

plot(x,resourceAllocation,'m-d',...
    'LineWidth',1.2,...
    'MarkerSize',3);

title('Resource Allocation');
xlabel('Simulation Iteration');
ylabel('Resource Utilization (%)');

grid on;
ylim([40 100]);

%% Energy Efficiency

subplot(2,3,5)

plot(x,energyEfficiency,'c-^',...
    'LineWidth',1.2,...
    'MarkerSize',3);

title('Energy Efficiency');
xlabel('Simulation Iteration');
ylabel('Energy Efficiency (bits/J)');

grid on;

%% Overall Performance

subplot(2,3,6)

plot(x,overallPerformance,'k-o',...
    'LineWidth',1.2,...
    'MarkerSize',3);

title('Overall AI Optimization');
xlabel('Simulation Iteration');
ylabel('Performance (%)');

grid on;

%% Main Title

sgtitle('AI-Based Wireless Optimization Performance');

%% =========================================================
% Save Complete Figure
% =========================================================

exportgraphics(fig,...
    fullfile(outputFolder,...
    'AI_Wireless_Optimization_Performance.png'),...
    'Resolution',300);

%% =========================================================
% Save Individual Graphs
% =========================================================

% Prediction Accuracy
fig1 = figure;
plot(x,predictionAccuracy,'b-o','LineWidth',1.2,'MarkerSize',3);
grid on;
title('Prediction Accuracy');
xlabel('Simulation Iteration');
ylabel('Accuracy (%)');
ylim([60 100]);

exportgraphics(fig1,...
    fullfile(outputFolder,'Prediction_Accuracy.png'),...
    'Resolution',300);

% Throughput
fig2 = figure;
plot(x,throughput,'g-s','LineWidth',1.2,'MarkerSize',3);
grid on;
title('Throughput');
xlabel('Simulation Iteration');
ylabel('Throughput (Mbps)');

exportgraphics(fig2,...
    fullfile(outputFolder,'Throughput.png'),...
    'Resolution',300);

% Delay
fig3 = figure;
plot(x,delay,'r-*','LineWidth',1.2,'MarkerSize',3);
grid on;
title('Delay');
xlabel('Simulation Iteration');
ylabel('Delay (ms)');

exportgraphics(fig3,...
    fullfile(outputFolder,'Delay.png'),...
    'Resolution',300);

% Resource Allocation
fig4 = figure;
plot(x,resourceAllocation,'m-d','LineWidth',1.2,'MarkerSize',3);
grid on;
title('Resource Allocation');
xlabel('Simulation Iteration');
ylabel('Resource Utilization (%)');
ylim([40 100]);

exportgraphics(fig4,...
    fullfile(outputFolder,'Resource_Allocation.png'),...
    'Resolution',300);

% Energy Efficiency
fig5 = figure;
plot(x,energyEfficiency,'c-^','LineWidth',1.2,'MarkerSize',3);
grid on;
title('Energy Efficiency');
xlabel('Simulation Iteration');
ylabel('Energy Efficiency (bits/J)');

exportgraphics(fig5,...
    fullfile(outputFolder,'Energy_Efficiency.png'),...
    'Resolution',300);

% Overall Performance
fig6 = figure;
plot(x,overallPerformance,'k-o','LineWidth',1.2,'MarkerSize',3);
grid on;
title('Overall AI Optimization');
xlabel('Simulation Iteration');
ylabel('Performance (%)');

exportgraphics(fig6,...
    fullfile(outputFolder,'Overall_AI_Optimization.png'),...
    'Resolution',300);

%% =========================================================
% Display Results
% =========================================================

disp(' ');
disp('==============================================');
disp('AI-BASED WIRELESS OPTIMIZATION');
disp('==============================================');

disp(['Output folder: ',outputFolder]);

disp(' ');
disp('PNG files saved successfully:');

disp('1. AI_Wireless_Optimization_Performance.png');
disp('2. Prediction_Accuracy.png');
disp('3. Throughput.png');
disp('4. Delay.png');
disp('5. Resource_Allocation.png');
disp('6. Energy_Efficiency.png');
disp('7. Overall_AI_Optimization.png');

disp(' ');
disp('Simulation completed successfully.');
%% 