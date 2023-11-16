% Define input signal
n = 1:100;
Ts = 1/20;
x = cos(2*pi*(n-1)*Ts);
figure
plot(n, x), xlabel('n'), ylabel('x');

% Design and apply 3 filters with different order and cutoff frequency
[b1, a1] = butter(3, 0.05);
y1 = filter(b1, a1, x);
[b2, a2] = butter(7, 0.05);
y2 = filter(b2, a2, x);
[b3, a3] = butter(3, 0.5);
y3 = filter(b3, a3, x);

% Compute frequency response of each filter
[H1, w1] = freqz(b1, a1);
[H2, w2] = freqz(b2, a2);
[H3, w3] = freqz(b3, a3);

% Plot frequency response and output signal of each filter
figure
subplot(3,3,1), plot(w1, 20*log10(abs(H1))), xlabel('omega (rad/s)'), ylabel('20log|H1| (db)')
title('20log|H1| vs omega')
subplot(3,3,2), plot(w1, rad2deg(unwrap(angle(H1)))), xlabel('omega (rad/s)'), ylabel('Angle of H1 (degree)')
title('Angle of H1 vs omega')
subplot(3,3,3), plot(n, y1), xlabel('n'), ylabel('y1[n]')
title('y1[n] vs n')
subplot(3,3,4), plot(w2, 20*log10(abs(H2))), xlabel('omega (rad/s)'), ylabel('20log|H2| (db)')
title('20log|H2| vs omega')
subplot(3,3,5), plot(w2, rad2deg(unwrap(angle(H2)))), xlabel('omega (rad/s)'), ylabel('Angle of H2 (degree)')
title('Angle of H2 vs omega')
subplot(3,3,6), plot(n, y2), xlabel('n'), ylabel('y2[n]')
title('y2[n] vs n')
subplot(3,3,7), plot(w3, 20*log10(abs(H3))), xlabel('omega (rad/s)'), ylabel('20log|H3| (db)')
title('20log|H3| vs omega')
subplot(3,3,8), plot(w3, rad2deg(unwrap(angle(H3)))), xlabel('omega (rad/s)'), ylabel('Angle of H3 (degree)')
title('Angle of H3 vs omega')
subplot(3,3,9), plot(n, y3), xlabel('n'), ylabel('y3[n]')
title('y3[n] vs n')
