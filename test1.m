%输入信号即冲激信号δ(n) 
deltan=impseq(1,1,4000);

%设置差分方程的各个系数
%响应前的系数
b697=[1,-1.7077,1];
b770=[1,-1.6453,1];
b852=[1,-1.5687,1];
b941=[1,-1.4782,1];
b1209=[1,-1.1641,1];
b1336=[1,-0.9964,1];
b1477=[1,-0.7986,1];
b1633=[1,-0.5685,1];
%输入前的系数
a697=[0,0.5204];
a770=[0,0.5686];
a852=[0,0.6203];
a941=[0,0.6736];
a1209=[0,0.8131];
a1336=[0,0.8671];
a1477=[0,0.9168];
a1633=[0,0.9652];

%解差分方程，通过滤波法获得单频信号
h697=filter(a697,b697,deltan);
h770=filter(a770,b770,deltan);
h852=filter(a852,b852,deltan);
h941=filter(a941,b941,deltan);
h1209=filter(a1209,b1209,deltan);
h1336=filter(a1336,b1336,deltan);
h1477=filter(a1477,b1477,deltan);
h1633=filter(a1633,b1633,deltan);

%获取号码0~9对应的双频信号
p1=h697+h1209;
p2=h697+h1336;
p3=h697+h1477;
p4=h770+h1209;
p5=h770+h1336;
p6=h770+h1477;
p7=h852+h1209;
p8=h852+h1336;
p9=h852+h1477;
p0=h941+h1336;

%手机号XXXXXXXXXXX
z=zeros(1,4000);%剩余50ms设置为静音，并追加到已有信号之后
%自行填充手机号码
sound=[p1,z,p2,z,p3,z,p4,z,p5,z,p6,z,p7,z,p8,z,p9,z,p1,z,p2,z];
sound=sound/max(abs(sound));

%写出音频,audiowrite是Matlab中目前使用的音频写出函数，wav开头的函数会逐渐废弃
audiowrite('my_phone_number_sound.wav',sound,8000);

%读出音频文件，绘制图线
[phone_sound,fs]=audioread('my_phone_number_sound.wav');
plot(phone_sound);