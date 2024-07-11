% Define criteria and metrics for comparison
criteria = {
    'Criteria', 'SISO System', 'MIMO System';
    'Antennas', '1', 'Multiple (Nt x Nr)';
    'Channel Diversity', 'Low', 'High';
    'Spatial Multiplexing Gain', 'None', 'High';
    'Interference Mitigation', 'Limited', 'Effective';
    'Data Rate', 'Low', 'High';
    'Bandwidth Efficiency', 'Low', 'High';
    'System Complexity', 'Low', 'High';
    'Channel Estimation', 'Simple', 'Complex';
    'Robustness to Fading', 'Low', 'High';
    'Energy Efficiency', 'High', 'Medium'
};

% Create a table
figure;
uitable('Data', criteria, 'Position', [50 100 500 250], 'ColumnWidth', {120});

% Formatting the table
title('Comparison of SISO and MIMO Systems');
set(gca, 'visible', 'off');
