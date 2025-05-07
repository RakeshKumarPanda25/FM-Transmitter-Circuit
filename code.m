clc;
clear all ;
close all;
fc = 10; %carrier frequency
fm = 1; %message freuqency
B = 35; %modulation index
k =0; %used for drawing
tp = 0:0.005:500; %time
delay = 0.05; %delay when plotting
carrier = cos(2*pi*fc*tp); %the carrier
%% Message
syms ti;
M = cos(2*pi*fm*ti); %generic message
Mi = int(M,ti); % integrated message
ti = tp; % to substitute
Mii = eval(Mi); %substitute
M = eval(M);% message but as array to plot
FM = cos(2*pi*fc*tp+B.*Mii); % the Fm transmitted message
FM_noise = awgn(FM,20); %adding additive white gaussian noise
%% Plotting
myfigure1 = figure('name','FM transmitter');
while (1)
if ~ishghandle(myfigure1)
    break
end
subplot(4,1,1)
plot(tp,M)
title('Original Signal')
xlabel('time')
ylabel('Amplitude')
xlim([0+k 10+k])
subplot(4,1,2)
plot(tp,carrier)
xlim([0+k 10+k])
title('Carrier')
xlabel('time')
ylabel('Amplitude')
subplot(4,1,3)
plot(tp,FM)
xlim([0+k 10+k])
xlabel('time')
ylabel('Amplitude')
title('FM transmitted signal')
subplot(4,1,4)
plot(tp,FM_noise)
xlim([0+k 10+k])
ylim([-1 1])
xlabel('time')
ylabel('Amplitude')
title('FM transmitted with noise')
k = k+1.33;
drawnow;
pause(delay) %delay
end