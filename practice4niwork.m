clc
[h,Fs]=audioread('test.wav');%读出信号，采样率和采样位数。
h=h(:,1);
keytime=0.5;%按键持续时间
zerotime=0.125;%中间为零的时间
n=keytime*Fs;
n1=zerotime*Fs;
disp('识别结果');
for i=1:11
    y=h(1+n1*(i-1)+n*(i-1):n+n1*(i-1)+n*(i-1));
    H=fft(y);%快速傅里叶变换
    h_d=abs(H/n);
    h_d1= h_d(1:n/2+1);
    h_d1(2:end-1)=2*h_d1(2:end-1);
    f=Fs*(0:n/2)/n;
%     figure(i);
%     plot(f,h_d1);
    h_d2=h_d1(1:n/8);
    [M,I] = max(h_d2);
    I=Fs*I/n;
    h_d3=h_d1(n/8:n/4-1);
    [A,B] = max(h_d3);
    B=Fs*B/n+1000;
    if I>=690&&I<=700&&B>=1200&&B<=1300
        disp(1);
    end
    if I>=690&&I<=700&&B>=1300&&B<=1400
        disp(2);
    end
    if I>=690&&I<=700&&B>=1400&&B<=1500
        disp(3);
    end
    if I>=690&&I<=700&&B>=1600&&B<=1700
        disp(A);
    end
    if I>=700&&I<=800&&B>=1200&&B<=1300
        disp(4);
    end
    if I>=700&&I<=800&&B>=1300&&B<=1400
        disp(5);
    end
    if I>=700&&I<=800&&B>=1400&&B<=1500
        disp(6);
    end
    if I>=700&&I<=800&&B>=1600&&B<=1700
        disp(B);
    end
    if I>=800&&I<=900&&B>=1200&&B<=1300
        disp(7);
    end
    if I>=800&&I<=900&&B>=1300&&B<=1400
        disp(8);
    end
    if I>=800&&I<=900&&B>=1400&&B<=1500
        disp(9);
    end
    if I>=800&&I<=900&&B>=1600&&B<=1700
        disp(C);
    end
    if I>=900&&I<=1000&&B>=1200&&B<=1300
        disp('*');
    end
    if I>=900&&I<=1000&&B>=1300&&B<=1400
        disp(0);
    end
    if I>=900&&I<=1000&&B>=1400&&B<=1500
        disp('#');
    end
    if I>=900&&I<=1000&&B>=1600&&B<=1700
        disp(D);
    end
end