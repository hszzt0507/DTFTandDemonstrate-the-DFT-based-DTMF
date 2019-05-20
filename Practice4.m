fl=[697 770 852 941];%低频频率
fh=[1209 1336 1477];%高频频率

Fs=8000;%采样频率8kHz
last_time=0.5;
compound=[];
numString='';

for i=1:length(numString)
    switch numString(i)
        case'1'
            freq_low=fl(1);freq_hgh=fh(1);
        case'2'
            freq_low=fl(1);freq_hgh=fh(2);
        case'3'
            freq_low=fl(1);freq_hgh=fh(3);
        case'4'
            freq_low=fl(2);freq_hgh=fh(1);
        case'5'
            freq_low=fl(2);freq_hgh=fh(2);
        case'6'
            freq_low=fl(2);freq_hgh=fh(3);
        case'7'
            freq_low=fl(3);freq_hgh=fh(1);
        case'8'
            freq_low=fl(3);freq_hgh=fh(2);
        case'9'
            freq_low=fl(3);freq_hgh=fh(3);
        case'0'
            freq_low=fl(4);freq_hgh=fh(1);
        case'*'
            freq_low=fl(4);freq_hgh=fh(2);
        case'#'
            freq_low=fl(3);freq_hgh=fh(3);
        otherwise
            error('naive!');
 end  
    single=wav(freq_low,freq_hgh,Fs,last_time);
    single=[single,zeros(1,1000)];
    compound=[compound,single];

sound(compound,Fs);

end
audiowrite('test.wav',compound,Fs);
    
  
       