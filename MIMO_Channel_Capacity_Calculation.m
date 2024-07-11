% Parameters
Nt = 2; % Number of transmit antennas
Nr = 2; % Number of receive antennas
N0 = 1; % Noise power

% Channel matrix
H = [1 0.5; 0.5 1];

% SNR range
SNR_dB = 0:2:20;
capacity = zeros(length(SNR_dB), 1);

for i = 1:length(SNR_dB)
    SNR = 10^(SNR_dB(i) / 10);
    I = eye(Nr);
    capacity(i) = log2(det(I + (SNR/Nt) * (H * H')));
end

disp('Channel capacity (bps/Hz):');
disp(capacity);

% Plot capacity vs SNR
figure;
plot(SNR_dB, capacity, 'b-o');
title('MIMO Channel Capacity vs SNR');
xlabel('SNR (dB)');
ylabel('Capacity (bps/Hz)');
grid on;
