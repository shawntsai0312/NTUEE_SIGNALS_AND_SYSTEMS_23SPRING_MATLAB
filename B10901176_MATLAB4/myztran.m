% Transfer function coefficients
a = [1, -0.8, 0.39, -0.062, 0.005];
b = 0.09 * [1, 0, -2, 0, 1];

% Compute partial fraction decomposition
[r, p, k] = residuez(b, a);

% Plot z-plane
figure
subplot(3,3,1)
zplane(b, a)
title('(a) zplane')

n = 0:20;

% Compute impulse response h[n]
h = impz(b, a, length(n));

% Plot h[n] vs n
subplot(3,3,2)
stem(n, h)
xlabel('n')
ylabel('h[n]')
title('(b) h[n] vs n')

% Compute frequency response |H|
[H, w] = freqz(b, a);
Mag_H = abs(H);

% Plot |H| vs ω
subplot(3,3,3)
plot(w, Mag_H)
xlabel('\omega (rad/s)')
ylabel('|H|')
title('(c) |H| vs \omega')

% Compute phase response
degree = rad2deg(unwrap(angle(H)));

% Plot phase vs ω
subplot(3,3,4)
plot(w, degree)
xlabel('\omega (rad/s)')
ylabel('phase(degree)')
title('(c) phase vs \omega')

% Compute second-order sections (SOS) representation
[z, p, k] = tf2zp(b, a);
sos = zp2sos(z, p, k);

% Compute frequency response of H1
[H1, w1] = freqz(sos(1, 1:3), sos(1, 4:6));
MagH1 = abs(H1);

% Plot |H1| vs ω
subplot(3,3,5)
plot(w1, MagH1)
xlabel('\omega (rad/s)')
ylabel('|H1|')
title('(e) |H1| vs \omega')

% Compute frequency response of H2
[H2, w2] = freqz(sos(2, 1:3), sos(2, 4:6));
MagH2 = abs(H2);

% Plot |H2| vs ω
subplot(3,3,6)
plot(w2, MagH2)
xlabel('\omega (rad/s)')
ylabel('|H2|')
title('(e) |H2| vs \omega')

% Compute product of |H1| and |H2|
H1H2 = abs(H1 .* H2);

% Plot |H1*H2| vs ω
subplot(3,3,7)
plot(w1, H1H2)
xlabel('\omega (rad/s)')
ylabel('|H1*H2|')   
title('(e) |H1*H2| vs \omega')

% Generate impulse input signal
d = zeros(1, 21);
d(1) = 1;

% Apply filter to input signal
y = filter(b, a, d);

% Plot y[n] vs n
subplot(3,3,8)
stem(n, y)
xlabel('n')
ylabel('y[n]')
title('(f) y[n] vs n')
