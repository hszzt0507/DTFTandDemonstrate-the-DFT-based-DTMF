clc
[h,Fs]=audioread('test.wav');%读出信号，采样率和采样位数。
h=h(:,1);
t=1:length(h);
plot(t,h);