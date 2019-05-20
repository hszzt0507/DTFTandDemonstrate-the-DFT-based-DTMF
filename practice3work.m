fs=4000;%采样率
t=0:1/fs:0.05;
x=3*cos(400*pi*t)+5*sin(1200*pi*t)+6*cos(4400*pi*t)+2*sin(5200*pi*t);
y=x(1:length(t));
plot(t,x,t,y,'r-*');
xlabel('时间');