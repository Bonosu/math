%% Analysis

%% approximation of exp function
syms x
y = exp(x);
T2 = taylor(y, x, 'Order', 2);
T3 = taylor(y, x, 'Order', 3);
T4 = taylor(y, x, 'Order', 4);
T11 = taylor(y, x, 'Order', 11);

fplot([T2 T3 T4 T11 y], 'LineWidth', 1.5)
xlim([-5 5])
ylim([-5 5])
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';


legend('n=2','n=3','n=4','n=11','exp(x)','FontName', 'Arial', 'FontSize', 10 ,'Location','Best')
title('Taylor series of exp(x)' ,'FontName', 'Arial', 'FontSize', 12)

%% approximation of sin function
syms x
y = sin(x);
T2 = taylor(y, x, 'Order', 2);
T3 = taylor(y, x, 'Order', 3);
T4 = taylor(y, x, 'Order', 4);
T11 = taylor(y, x, 'Order', 11);

fplot([T2 T3 T4 T11 y], 'LineWidth', 1.5)
xlim([-5 5])
ylim([-5 5])
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';


legend('n=2','n=3','n=4','n=11','sin(x)','FontName', 'Arial', 'FontSize', 10 ,'Location','Best')
title('Taylor series of sin(x)' ,'FontName', 'Arial', 'FontSize', 12)

%% approximation of sin function
syms x
y = cos(x);
T2 = taylor(y, x, 'Order', 2);
T3 = taylor(y, x, 'Order', 3);
T4 = taylor(y, x, 'Order', 4);
T11 = taylor(y, x, 'Order', 11);

fplot([T2 T3 T4 T11 y], 'LineWidth', 1.5)
xlim([-5 5])
ylim([-5 5])
grid on
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

legend('n=2','n=3','n=4','n=11','cos(x)','FontName', 'Arial', 'FontSize', 10 ,'Location','Best')
title('Taylor series of cos(x)' ,'FontName', 'Arial', 'FontSize', 12)


%% fourier transform
fs = 100;                                % sample frequency (Hz)
t = 0:1/fs:10-1/fs;                      % 10 second span time vector
x = (1.3)*sin(2*pi*15*t) ...             % 15 Hz component
  + (1.7)*sin(2*pi*40*(t-2)); ...        % 40 Hz component

x_noised = x + 2.5*randn(size(x));       % Gaussian noise;

y = fft(x);
n = length(x);          % number of samples
y0 = fftshift(y);         % shift y values
f0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range
power0 = abs(y0).^2/n;    % 0-centered power

y_noised = fft(x_noised);
y_noised0 = fftshift(y_noised);         % shift y values
f_noised0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range
power_noised0 = abs(y_noised0).^2/n;    % 0-centered power

subplot(2,2,1)
plot(x)
xlim([0 300])
xlabel('Frequency')
ylabel('Power')

subplot(2,2,2)
plot(x_noised)
xlim([0 300])
xlabel('Frequency')
ylabel('Power')

subplot(2,2,3)
plot(f0,power0)
xlabel('Frequency')
ylabel('Power')

subplot(2,2,4)
plot(f_noised0,power_noised0)
xlabel('Frequency')
ylabel('Power')




%% stationarity

x = 0:0.05:6*pi;
f1 = sin(40*x);
f2 = sin(0.3*x);
f3 = 0.2*sin(x);
y = f1+f2+f3;

subplot(2,3,1);
plot(f1);
xlim([0 200])
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 3*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')
title('sine 1' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,3,2);
plot(f2);
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 6*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')
title('sine 2' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,3,3);
plot(f3);
title('sine 3' ,'FontName', 'Arial', 'FontSize', 12)
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 6*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')

subplot(2,3,[4,5,6]);
plot(y);
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 6*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')
title('sine 1 + sine 2 + sine 3' ,'FontName', 'Arial', 'FontSize', 12)

%% non stationarity
x = 0:0.05:6*pi;
f1 = sin(40*x);
f2 = f1 + rand(1,length(x));
f3 = 0.5*(sin(0.3*x) + rand(1,length(x)));
f4 = 0.2*(sin(x) + rand(1,length(x)));
f5 = x/3;
f6 = f2 + f3 + f4;
y = f1.*f5;

subplot(2,3,1);
plot(f2);
xlim([0 200])
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 3*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')
title('sine 1' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,3,2);
plot(f3);
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 6*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')
title('sine 2' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,3,3);
plot(f4);
title('sine 3' ,'FontName', 'Arial', 'FontSize', 12)
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 6*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')

subplot(2,3,[4,5]);
plot(f6);
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 6*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')
title('sine 1 + sine 2 + sine 3' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,3,6);
plot(y);
xticks((0:pi:6*pi)/0.05)
xticklabels(0:1:6)
xlim([0 6*pi]/0.05)
xlabel('Phase(π)','FontName','Arial')
title('growing sine' ,'FontName', 'Arial', 'FontSize', 12)

%% window-fourier
fs = 100;                                % sample frequency (Hz)
t = 0:1/fs:10-1/fs;                      % 10 second span time vector
x = (1.3)*sin(2*pi*15*t) ...             % 15 Hz component
  + (1.7)*sin(2*pi*40*(t-2)) ...         % 40 Hz component
  + 2.5*randn(size(t)); ...              % Gaussian noise;

segment1 = x(1:length(x)/5);
segment2 = x(length(x)/5+1: 2*length(x)/5);
segment3 = x(2*length(x)/5+1: 3*length(x)/5);
segment4 = x(3*length(x)/5+1: 4*length(x)/5);
segment5 = x(4*length(x)/5+1:length(x));

subplot(2,5,1:5)
plot(x)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('EEG like signal' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,6)
plot(segment1)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('segment1' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,7)
plot(segment2)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('segment2' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,8)
plot(segment3)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('segment3' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,9)
plot(segment4)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('segment4' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,10)
plot(segment5)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('segment5' ,'FontName', 'Arial', 'FontSize', 12)

%% window-tapered fourier

w = gausswin(length(x)/5)';

subplot(2,5,1:5)
plot(x)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('EEG like signal' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,6)
plot(w.*segment1)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('window1' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,7)
plot(w.*segment2)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('window2' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,8)
plot(w.*segment3)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('window3' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,9)
plot(w.*segment4)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('window4' ,'FontName', 'Arial', 'FontSize', 12)

subplot(2,5,10)
plot(w.*segment5)
ylim([-10 10])
xlabel('time(t)','FontName','Arial')
title('window5' ,'FontName', 'Arial', 'FontSize', 12)
%% Time frequency analysis

fs = 1000;
long = 5;
t = 0:1/fs:long;
f1 = 1;
f2 = 5;
f3 = 8;
f4 = 10;
f5 = 50;
f6 = 200;

s1 = 0.5*sin(2*pi*f1*t);
s2 = sin(2*pi*f2*t);
s3 = 1.3*sin(2*pi*f3*t);
s4 = 0.5*sin(2*pi*f4*t);
s5 = sin(2*pi*f5*t);
s6 = 1.3*sin(2*pi*f6*t);

S1 = [s1 s2 s3];
S2 = [s4 s5 s6];

subplot(2,2,1)
plot(S1)
xlim([0 3*length(t)])
xlabel('Time(s)' ,'FontName', 'Arial', 'FontSize', 12)
xticks(0:length(t):3*length(t))
xticklabels(0:5:15)

subplot(2,2,2)
plot(S2)
xlim([0 3*length(t)])
xlabel('Time(s)' ,'FontName', 'Arial', 'FontSize', 12)
xticks(0:length(t):3*length(t))
xticklabels(0:5:15)

subplot(2,2,3)
%pspectrum(S, fs, 'spectrogram', 'Leakage', 1, 'OverlapPercent', 0, ...
%'MinThreshold', -10, 'FrequencyLimits', [0, 10]);

spectrogram(S1,128,120,128,fs,'yaxis','MinThreshold',-30)
ylim([0 10])

subplot(2,2,4)
%pspectrum(S, fs, 'spectrogram', 'Leakage', 1, 'OverlapPercent', 0, ...
%'MinThreshold', -10, 'FrequencyLimits', [0, 10]);

spectrogram(S2,128,120,128,fs,'yaxis','MinThreshold',-30)
ylim([0 250])

%% pspectrum(wavelet transform?)
subplot(2,2,1)
plot(S1)
xlim([0 3*length(t)])
xlabel('Time(s)' ,'FontName', 'Arial', 'FontSize', 12)
xticks(0:length(t):3*length(t))
xticklabels(0:5:15)

subplot(2,2,2)
plot(S2)
xlim([0 3*length(t)])
xlabel('Time(s)' ,'FontName', 'Arial', 'FontSize', 12)
xticks(0:length(t):3*length(t))
xticklabels(0:5:15)

subplot(2,2,3)
pspectrum(S1, fs, 'spectrogram', 'Leakage', 1, 'OverlapPercent', 0, ...
'MinThreshold', -10, 'FrequencyLimits', [0, 10]);

ylim([0 10])

subplot(2,2,4)
pspectrum(S2, fs, 'spectrogram', 'Leakage', 1, 'OverlapPercent', 0, ...
'MinThreshold', -30, 'FrequencyLimits', [0, 250]);