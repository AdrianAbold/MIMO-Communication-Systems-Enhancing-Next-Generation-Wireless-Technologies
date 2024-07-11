% Parameters
numRealizations = 10000; % Number of channel realizations
nt = 2; % Number of transmit antennas
nr = 2; % Number of receive antennas
P = 10; % Transmit power
N0 = 1; % Noise power

% Initialize array to store mutual information values
mutualInformation = zeros(1, numRealizations);

% Monte Carlo simulation
for i = 1:numRealizations
    % Generate random channel matrix H (Rayleigh fading)
    H = (randn(nr, nt) + 1j*randn(nr, nt)) / sqrt(2);
    
    % Compute mutual information for this realization
    mutualInformation(i) = real(log2(det(eye(nr) + (P/N0) * (H * H'))));
end

% Compute ergodic capacity as the average mutual information
ergodicCapacity = mean(mutualInformation);
disp(['Estimated Ergodic Capacity: ' num2str(ergodicCapacity) ' bits/s/Hz']);

% Plot histogram of mutual information values and ergodic capacity convergence
figure;

% Subplot 1: Histogram of Mutual Information Values
subplot(1, 2, 1);
histogram(mutualInformation, 50);
title('Histogram of Mutual Information Values');
xlabel('Mutual Information (bits/s/Hz)');
ylabel('Frequency');

% Subplot 2: Ergodic Capacity Convergence
subplot(1, 2, 2);
cumulativeMean = cumsum(mutualInformation) ./ (1:numRealizations);
plot(1:numRealizations, cumulativeMean);
title('Ergodic Capacity Convergence');
xlabel('Number of Realizations');
ylabel('Ergodic Capacity (bits/s/Hz)');
grid on;

% Adjust figure properties
sgtitle('Mutual Information and Ergodic Capacity');
