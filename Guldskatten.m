%Finn Guldskattens position (b,z(b)):
clear all, close all, clc
format long
relfel=10^-4;
[a,b]=Newton(relfel);
%Landskapet:
fplot('z(x)', [0 14])
hold on
%Bergets topp:
stem(2, z(2), 'k:')
hold on
%Tangentkurvan:
xx=[a b];
zz=[z(a) z(b)];
plot(xx, zz, 'g--')
hold on
%Bedas lyftposition:
stem(a, z(a), 'k:')
disp('Bedas lyftposition:')
a
%Guldskattens position:
stem(b, z(b), 'k:')
disp('Guldskattens position:')
b