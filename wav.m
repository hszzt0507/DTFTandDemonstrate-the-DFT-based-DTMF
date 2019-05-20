function single=wav(freq_low,freq_hgh,Fs,last_time)
single=0.25*sin(2*pi*freq_low*[1/Fs:1/Fs:last_time])+...
    0.25*sin(2*pi*freq_hgh*[1/Fs:1/Fs:last_time]);
end