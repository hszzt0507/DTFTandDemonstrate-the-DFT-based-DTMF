%各项参数
Fs=100000;%sampling rate 采样率
Fstop=25000;%stopband frenquency 阻带频率
Fcutoff=15000;%cutoff frequency 0.3db截止频率
dBcutoff=0.3;%0.3dB at cutoff frequency 0.3db 
dBstop=45;%a minimum stopband attenuation of 45dB最小阻带衰减45dB
Wstop=2*pi*Fstop/Fs;
Wcutoff=2*pi*Fcutoff/Fs;
%----------数字滤波器指标转换为模拟滤波器指标----------
%T=2;
OMEGAstop=tan(Wstop/2);
OMEGAcutoff=tan(Wcutoff/2);
%----------------------求ε和A----------------------------
a=sqrt((10^(dBcutoff/20))^2-1);
A=10^(dBstop/20);
%--------------过度比和分辨参数----------------------------
k=(OMEGAcutoff)/(OMEGAstop);
k1=a/sqrt(A^2-1);
%-----------------求N阶数----------------------------------
N=log(1/k1)/log(1/k);
N=ceil(N);%向上取整
%-----------------求截止频率Wc-----------------------
Wc=OMEGAstop/((A^2-1)^(1/(2*N)));
%------------------设计滤波器----------------------------
[z,p,K]=buttap(N);%设计巴特沃斯模拟滤波器
[num,den]=zp2tf(z,p,K); % Convert to transfer function form转换为传输函数
den=den.*(1/Wc).^(N:-1:0);%将滤波器截止频率移到Wc处，确定分母
[z,p,K]=tf2zp(num,den);%根据分子分母确定零极点
[zd,pd,kd]=bilinear(z,p,K,1/2);%双线性不变法变换
[num2,den2]=zp2tf(zd,pd,kd);%确定传输函数分子分母
[h,w]=freqz(num2,den2,512);%求幅频响应
figure(1);
plot(w/pi,20*log10(abs(h)));
grid;
axis([0,1,-60,5]);
xlabel('\omega/\pi');
ylabel('Gain, dB');
title('Gain response');
figure(2);
plot(w/pi,unwrap(angle(h)));
grid;
axis([0,1,-16,1]);
xlabel('\omega/\pi'); 
ylabel('Phase, radians');
title('Phase response');