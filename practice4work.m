fs=8000;%采样率
tk=0.5;%the time of the key按键的声音持续时间
t=0:1/fs:(tk-1/fs);%时间点
z=zeros(1,4000);%按键与按键之间空白时间
%--------------------生成每个频率的信号----------------------
s697=sin(2*pi*697*t);
s770=sin(2*pi*770*t);
s852=sin(2*pi*852*t);
s941=sin(2*pi*941*t);
s1209=sin(2*pi*1209*t);
s1336=sin(2*pi*1336*t);
s1477=sin(2*pi*1477*t);
s1633=sin(2*pi*1633*t);
%---------------------生成每个按键的多频-------------------
p1=s697+s1209;
p2=s697+s1336;
p3=s697+s1477;
pa=s697+s1633;
p4=s770+s1209;
p5=s770+s1336;
p6=s770+s1477;
pb=s770+s1633;
p7=s852+s1209;
p8=s852+s1336;
p9=s852+s1477;
pc=s852+s1633;
pxing=s941+s1209;%星号**
p0=s941+s1336;
pjing=s941+s1477;%#号
pd=s941+s1633;
%------------------生成声音序列----------------------------
sound=[p1,z,p6,z,p0,z,p1,z,p0,z,p1,z,p9,z,p9,z,p0,z,p4,z,p4,z,];
sound=sound/max(abs(sound));%归一化声音序列
figure(1);
plot(sound);
%写出音频
audiowrite('my_phone_number_sound_test.wav',sound,8000);

% %读出音频文件，绘制图线
% [phone_sound,fs]=audioread('my_phone_number_sound_test.wav');
% figure(2);
% plot(phone_sound);

%-----------------------------------------------------------------------
%clc
[h,Fs]=audioread('my_phone_number_sound_test.wav');%读出信号，采样率和采样位数。
h=h(:,1);
keytime=0.5;%按键持续时间
zerotime=0.5;%中间为零的时间
n=keytime*Fs;%按键摁下时的点数
n1=zerotime*Fs;%无按键时的点数
for i=1:11
    y=h(1+n1*(i-1)+n*(i-1):n+n1*(i-1)+n*(i-1));%确定声音处理的区间
    H=fft(y);%快速傅里叶变换
    h_d=abs(H/n);%求fft的幅值，并转变为双边谱的幅值(fft的幅值与输入的点数有关，除于n保证原来的幅值)
    h_d1= h_d(1:n/2+1);%将双边谱变为单边谱
    h_d1(2:end-1)=2*h_d1(2:end-1);%双边谱变为单边谱幅度乘2
    f=Fs*(0:n/2)/n;%求归一化后的频率
    %      figure(i);
    %      plot(f,h_d1);
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