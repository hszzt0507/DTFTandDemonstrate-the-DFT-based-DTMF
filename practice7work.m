%------------参数---------------------
Wstop=0.3;%Stopband edge
Wpass=0.55;%Passband edge
Wc=(Wstop+Wpass)/2;%cutoff frenquency
Ap=0.1;%Maximum passband attenuation
delatp=1-10^(-Ap/20);%ripple of passband
As=42;%minimum stopband attenuation
delats=10^(-As/20);%ripple of stopband
deltaW=Wpass-Wstop;%transimission band
%--------------------------------
WindowKind=3;     %0=Hann window 1=Hanning window 2=Blackman window 3=Kaiser window
switch WindowKind
    case 0
        N=2*(3.11*pi/(deltaW*pi))+1;%阶数
        N=ceil(N);%向上取整
        b=fir1(N,Wc,'high',hann(N+1));%设计滤波器
        figure(1);
        freqz(b,1);%幅度相位图像
        figure(2);
        stem(b);
        title('Impulse Response Coefficients');
        xlabel('Time index n');ylabel('h[n]');
    case 1
        N=2*(3.32*pi/(deltaW*pi))+1;
        N=ceil(N);
        b=fir1(N,Wc,'high',hamming(N+1));
        figure(1);
        freqz(b,1);
        figure(2);
        stem(b);
        title('Impulse Response Coefficients');
        xlabel('Time index n');ylabel('h[n]');
    case 2
        N=2*(5.56*pi/(deltaW*pi))+1;
        N=ceil(N);
        b=fir1(N,Wc,'high',blackman(N+1));
        figure(1);
        freqz(b,1);
        figure(2);
        stem(b);
        title('Impulse Response Coefficients');
        xlabel('Time index n');ylabel('h[n]');
    case 3
        fcuts=[Wstop,Wpass];%频率范围
        mags=[0,1];%0，1为高通；1，0为低通；0，1，0为带通
        devs=[delats,delatp];%阻通带波纹
        [N,Wc,beta,ftype] = kaiserord(fcuts,mags,devs);%估计阶数
        b=fir1(N,Wc,ftype,kaiser(N+1,beta),'noscale');%设计滤波器
        figure(1);
        freqz(b,1);
        figure(2);
        stem(b);
        title('Impulse Response Coefficients');
        xlabel('Time index n');ylabel('h[n]');
    otherwise
end
%-----------------------------------
