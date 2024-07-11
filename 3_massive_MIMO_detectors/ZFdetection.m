close all;
clear all;

% Declare useful constants
N_users = 2;
N_tx = 1;
N_rx = 2;
s_variance = 10;
Rayleigh_fading_scaling_factor = sqrt(0.5);
detection_threshold = 2;

SNR = 15 : 2 : 55;
SNR_linear = 10 .^ (SNR ./ 10);

% SER
M = length(SNR); % number of SNR steps
SER_MMSE = zeros(1, M);
SER_ZF = zeros(1, M);

for idx = 1 : M
    a = (2e6 - 1e4) / (M - 1);
    b = 1e4 - a;
    L = a * idx + b;
    fprintf("Processing SNR = %d, number of realisations = %d\n", SNR(idx), L);
    for l = 1 : L
        s = 2 * randi(4, N_users, N_tx) - 5 + 1.0j * (2 * randi(4, N_users, N_tx) - 5);

        n_scaling_factor = sqrt(N_rx * s_variance / (2 * SNR_linear(idx)));
        n = n_scaling_factor * complex(randn(N_rx, N_tx), randn(N_rx, N_tx));
        H = Rayleigh_fading_scaling_factor .* complex(randn(N_rx, N_users), randn(N_rx, N_users));

        y = H * s + n;
        
        y_mmse = (H' * H + (1 / SNR_linear(idx) * eye(N_users, N_users))) \ (H' * y);
        s_hat_mmse = sign(real(y_mmse)) .* (1 * (abs(real(y_mmse)) < detection_threshold) + 3 * (abs(real(y_mmse)) > detection_threshold)) + 1.0j * sign(imag(y_mmse)) .* (1 * (abs(imag(y_mmse)) < detection_threshold) + 3 * (abs(imag(y_mmse)) > detection_threshold));
        SER_MMSE(idx) = SER_MMSE(idx) + sum(s_hat_mmse ~= s, 'all');
        
        y_zf = (H' * H) \ (H' * y);
        s_hat_zf = sign(real(y_zf)) .* (1 * (abs(real(y_zf)) < detection_threshold) + 3 * (abs(real(y_zf)) > detection_threshold)) + 1.0j * sign(imag(y_zf)) .* (1 * (abs(imag(y_zf)) < detection_threshold) + 3 * (abs(imag(y_zf)) > detection_threshold));
        SER_ZF(idx) = SER_ZF(idx) + sum(s_hat_zf ~= s, 'all');
    end
    SER_MMSE(idx) = SER_MMSE(idx) / (L * N_tx * N_users);
    SER_ZF(idx) = SER_ZF(idx) / (L * N_tx * N_users);
end

figure;
semilogy(SNR, SER_MMSE);
hold on;
semilogy(SNR, SER_ZF);
grid on;
legend('MMSE', 'ZF', 'Location', 'NorthEast');
xlabel('SNR E_s / N_0 [dB]');
ylabel('BER');
title('BER vs SNR');