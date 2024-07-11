% Parameters
Nt = 2; % Number of transmit antennas
Nr = 2; % Number of receive antennas
P = 10; % Transmit power
N0 = 1; % Noise power

% Channel matrix
H = [1 0.5; 0.5 1];

% Transmitted signal
x = [1; 0];

% Received signal
y = H * x + sqrt(N0/2) * (randn(Nr,1) + 1j * randn(Nr,1));

disp('Received signal:');
disp(y);

% Plot received signal
figure;
plot(real(y), imag(y), 'o');
title('Received Signal Constellation');
xlabel('Real Part');
ylabel('Imaginary Part');
grid on;
