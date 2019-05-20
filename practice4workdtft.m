fs=44000;%采样率
tk=0.5;%the time of the key按键的声音持续时间
t=0:1/fs:(tk-1/fs);%时间点
z=zeros(1,4000);%按键与按键之间空白时间
% %--------------------生成每个频率的信号----------------------
% s697=sin(2*pi*697*t);
% s770=sin(2*pi*770*t);
% s852=sin(2*pi*852*t);
% s941=sin(2*pi*941*t);
% s1209=sin(2*pi*1209*t);
% s1336=sin(2*pi*1336*t);
% s1477=sin(2*pi*1477*t);
% s1633=sin(2*pi*1633*t);
% %---------------------生成每个按键的多频-------------------
% p1=s697+s1209;
% p2=s697+s1336;
% p3=s697+s1477;
% pa=s697+s1633;
% p4=s770+s1209;
% p5=s770+s1336;
% p6=s770+s1477;
% pb=s770+s1633;
% p7=s852+s1209;
% p8=s852+s1336;
% p9=s852+s1477;
% pc=s852+s1633;
% pxing=s941+s1209;%星号**
% p0=s941+s1336;
% pjing=s941+s1477;%#号
% pd=s941+s1633;
%------------------生成声音序列----------------------------
p1=sin(2*pi*262*t)+sin(2*pi*262*2*t)+sin(2*pi*262*3*t)+sin(2*pi*262*4*t)+sin(2*pi*262*5*t)+sin(2*pi*262*6*t)+sin(2*pi*262*7*t);
sound=[p1,z,p1,z,p1,z,p1,z,p1,z,p1,z,p1,z,p1,z,p1,z,p1,z,p1,z,];
sound=sound/max(abs(sound));%归一化声音序列
figure(1);
plot(sound);
%写出音频
audiowrite('my_phone_number_sound_test.wav',sound,44000);

% %读出音频文件，绘制图线
% [phone_sound,fs]=audioread('my_phone_number_sound_test.wav');
% figure(2);
% plot(phone_sound);
