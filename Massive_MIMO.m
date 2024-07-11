% Parameters
Nt = 64; % Number of transmit antennas
Nr = 8; % Number of receive antennas
K = 8; % Number of users
P_t = 10; % Transmit power (W)
N0 = 1; % Noise power

% Channel matrix
H = (randn(Nr, Nt) + 1j * randn(Nr, Nt)) / sqrt(2);

% Transmitted signal
x = sqrt(P_t/Nt) * ones(Nt, K);

% Received signal
y = H * x + sqrt(N0/2) * (randn(Nr, K) + 1j * randn(Nr, K));

disp('Received signal:');
disp(y);

% Plot received signal constellation
figure;
plot(real(y(:)), imag(y(:)), 'o');
title('Received Signal Constellation (Massive MIMO)');
xlabel('Real Part');
ylabel('Imaginary Part');
grid on;
