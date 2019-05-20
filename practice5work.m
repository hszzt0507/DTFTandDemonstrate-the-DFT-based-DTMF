
% Determination of the Factored Form
% of a Rational z-Transform
%
%num = input('Type in the numerator coefficients = ');
%den = input('Type in the denominator coefficients = ');
num=[3,-2.4,15.36,3.84,9];
den=[5,-8.5,17.6,4.7,-6];
K = num(1)/den(1);
Numfactors = factorize(num);
Denfactors = factorize(den);
disp('Numerator factors');
disp(Numfactors);
disp('Denominator factors');
disp(Denfactors);
disp('Gain constant');
disp(K);
%-------------------------------------------
figure(1);
zplane(num,den);%零极点
[z1,p1,k1]=tf2zp(num,den);
disp('极点');
disp(p1);
disp('|z|');
disp(abs(p1));
% figure(2);
% [h,w]=freqz(num,den);%幅频响应
% plot(w,abs(h));
%z=(3*z^4-2.4*z^3+15.36*z^2+3.84*z+9)/(5*z^4-8.5*z^3+17.6*z^2+4.7*z-6);
%-------------------------------
a=poly2sym(num);
b=poly2sym(den);
z=a/b;%传输函数的符号表示
figure(2);
fplot(z,[0.6,2]);
xlabel('z');
ylabel('magnitude');
% Z=iztrans(z);
% disp('逆变换');
% disp(Z);
% [n1,d1]=numden(Z);
% num1=coeffs(n1);
% disp(num1);
% den1=coeffs(d1);
% disp(den1);


