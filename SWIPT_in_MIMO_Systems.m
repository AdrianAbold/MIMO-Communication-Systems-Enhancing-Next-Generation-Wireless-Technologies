% Parameters
Nt = 2; % Number of transmit antennas
Nr = 2; % Number of receive antennas
P_t = 10; % Transmit power (W)
h = 0.5; % Channel gain
N0 = 0.1; % Noise power (W)
rho = 0.5; % Power splitting ratio

% Channel matrix
H = h * ones(Nr, Nt);

% Transmitted signal
x = sqrt(P_t/Nt) * ones(Nt, 1);

% Received signal
y = H * x + sqrt(N0/2) * (randn(Nr,1) + 1j * randn(Nr,1));

% Power for information decoding and energy harvesting
P_r = norm(y)^2;
P_d = rho * P_r;
P_h = (1 - rho) * P_r;

disp('Received power:');
disp(P_r);
disp('Power for information decoding:');
disp(P_d);
disp('Power for energy harvesting:');
disp(P_h);

% Plot received power
figure;
bar([P_d, P_h]);
set(gca, 'XTickLabel', {'Info Decoding', 'Energy Harvesting'});
ylabel('Power (W)');
title('Power Splitting in SWIPT');
grid on;
