% Clear workspace and close all figures
clear; close all; clc;

% Parameters
rho = 0.5; % Power splitting ratio
total_power = 1; % Assume total received signal power is normalized to 1
data_power = rho * total_power;
energy_power = (1 - rho) * total_power;

% Create figure
figure;

% Define x coordinates for visualization
x = [1, 2, 3];
y = [total_power, data_power, energy_power];
colors = [0.6 0.8 1; 0.4 0.6 0.8; 1 0.8 0.4]; % Colors for bars

% Plot received signal power
subplot(1, 2, 1);
bar(1, total_power, 'FaceColor', [0.6 0.8 1], 'EdgeColor', 'k');
text(1, total_power / 2, 'Total Received Power', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
title('Received Signal Power');
ylabel('Power');
xlim([0 2]);
ylim([0 1.2]);
set(gca, 'XTick', []);
grid on;

% Plot power splitting scheme
subplot(1, 2, 2);
h = bar(x, y, 'EdgeColor', 'k');
for k = 1:length(h)
    h(k).FaceColor = colors(k, :);
end
text(1, total_power - 0.1, 'Total Received Power', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'Rotation', 90);
text(2, data_power - 0.1, sprintf('Power for Data Decoding', data_power), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'Rotation', 90);
text(3, energy_power - 0.1, sprintf('Power for Energy Harvesting', energy_power), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top', 'Rotation', 90);
title('Power Splitting Scheme in SWIPT');
ylabel('Power');
xlim([0 4]);
ylim([0 1.2]);
set(gca, 'XTick', x, 'XTickLabel', {'Received', 'Data Decoding', 'Energy Harvesting'});
grid on;

% Add an annotation to show the split
annotation('arrow', [0.42 0.53], [0.6 0.6], 'LineWidth', 2);
annotation('arrow', [0.42 0.68], [0.6 0.45], 'LineWidth', 2);

% Display the plot
sgtitle('Power Splitting Scheme in SWIPT');
