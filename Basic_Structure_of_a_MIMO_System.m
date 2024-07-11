% Clear workspace and close all figures
clear; close all; clc;

% Parameters
Nt = 4; % Number of transmit antennas
Nr = 4; % Number of receive antennas
Tx_X = zeros(Nt, 1); % X coordinates of transmit antennas
Tx_Y = linspace(1, Nt, Nt); % Y coordinates of transmit antennas
Rx_X = ones(Nr, 1) * 2; % X coordinates of receive antennas
Rx_Y = linspace(1, Nr, Nr); % Y coordinates of receive antennas

% Plot transmit antennas
figure;
plot(Tx_X, Tx_Y, 'ro', 'MarkerSize', 8, 'LineWidth', 2); hold on;
text(Tx_X, Tx_Y, arrayfun(@(x) ['Tx' num2str(x)], 1:Nt, 'UniformOutput', false), 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

% Plot receive antennas
plot(Rx_X, Rx_Y, 'bo', 'MarkerSize', 8, 'LineWidth', 2);
text(Rx_X, Rx_Y, arrayfun(@(x) ['Rx' num2str(x)], 1:Nr, 'UniformOutput', false), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom');

% Plot lines representing channels between antennas
for i = 1:Nt
    for j = 1:Nr
        plot([Tx_X(i), Rx_X(j)], [Tx_Y(i), Rx_Y(j)], 'k--');
    end
end

% Formatting the plot
title('Basic Structure of a MIMO System');
xlabel('Transmitter and Receiver Antennas');
ylabel('Antenna Index');
xlim([-0.5 2.5]);
ylim([0 Nt+1]);
set(gca, 'XTick', [0 2], 'XTickLabel', {'Transmitter', 'Receiver'}, 'YTick', 1:Nt);
grid on;

% Display the plot
hold off;
