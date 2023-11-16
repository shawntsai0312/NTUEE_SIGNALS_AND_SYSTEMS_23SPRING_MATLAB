% Define input signal
M = 1000;
n = 1:M;
Ts = 0.002;
f1 = 100;
x = cos(2*pi*(n-1)*Ts) + 2*cos(2*pi*f1*(n-1)*Ts);

% Design and apply Butterworth filters
[b1, a1] = butter(16, 0.2);
y1 = filter(b1, a1, x);
[b2, a2] = butter(16, [0.2, 0.8], 'bandpass');
y2 = filter(b2, a2, x);

% Plot input and output signals
figure
subplot(3, 1, 1), plot(n, x), xlabel('n'), ylabel('x[n]');
title('Input signal x[n] vs n')
subplot(3, 1, 2), plot(n, y1), xlabel('n'), ylabel('y1[n]');
title('Output signal y1[n] vs n (lowpass filter)')
subplot(3, 1, 3), plot(n, y2), xlabel('n'), ylabel('y2[n]');
title('Output signal y2[n] vs n (bandpass filter)')