close;
N = 96;
n = 1:N;
x = sin(44/30*n); % Generate the sinusoidal sequence
y = rand(1,N)-0.5; % Generate the noise sequence
figure(1);
subplot(3,1,1);
stem(n, x)
title('Signal--x');
subplot(3,1,2);
stem(n, y);
title('Signa2--y');
subplot(3,1,3);
d=x+y;
stem(n, d);
title('Signa3--d');
%---------------------------------------
figure(2);
subplot(2,1,1);
rxd = conv(d, fliplr(x)); 
k = -95:95;
stem(k, rxd(1:191));
title('x与d的互相关');
subplot(2,1,2);
rd = conv(d, fliplr(d)); 
k = -95:95;
stem(k, rd(1:191));
title('d的自互相关');