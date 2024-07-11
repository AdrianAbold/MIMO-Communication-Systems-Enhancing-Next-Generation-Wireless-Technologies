% Parameters
Nt = 2; % Number of transmit antennas
Nr = 2; % Number of receive antennas
Ne = 2; % Number of eavesdropper antennas
P = 10; % Transmit power
N0 = 1; % Noise power

% Channel matrices
H = [1 0.5; 0.5 1]; % Legitimate receiver
He = [0.8 0.3; 0.2 0.9]; % Eavesdropper

% Transmitted signal and artificial noise
x = [1; 0];
n_a = randn(Nt, 1);

% Received signal at legitimate receiver
y = H * x + H * n_a + sqrt(N0/2) * (randn(Nr,1) + 1j * randn(Nr,1));

% Received signal at eavesdropper
y_e = He * x + He * n_a + sqrt(N0/2) * (randn(Ne,1) + 1j * randn(Ne,1));

disp('Received signal at legitimate receiver:');
disp(y);
disp('Received signal at eavesdropper:');
disp(y_e);

% Plot received signals
figure;
subplot(1, 2, 1);
plot(real(y), imag(y), 'o');
title('Legitimate Receiver');
xlabel('Real Part');
ylabel('Imaginary Part');
grid on;

subplot(1, 2, 2);
plot(real(y_e), imag(y_e), 'o');
title('Eavesdropper');
xlabel('Real Part');
ylabel('Imaginary Part');
grid on;
