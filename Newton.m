function [a,b]=Newton(relfel);
%Startvärdena:
a1=2; %a-vvärdet
b1=10; %b-värdet
x=[a1 b1]';
maxiter=10;
dxnorm=1;
iter=0;
while dxnorm>relfel && iter<maxiter
%Approximation till jacobianen mha centraldifferenskvoten:
h=10^-6;
J11=(ekv2(x(1)+h, x(2))-ekv2(x(1)-h, x(2)))/(2*h);
J12=(ekv2(x(1), x(2)+h)-ekv2(x(1), x(2)-h))/(2*h);
J21=(ekv1(x(1)+h, x(2))-ekv1(x(1)-h, x(2)))/(2*h);
J22=(ekv1(x(1), x(2)+h)-ekv1(x(1), x(2)-h))/(2*h);
J=[J11 J12
J21 J22];
%Lösningen av linjära ekvationssystemet:
df1=ekv1(x(1),x(2));
df2=ekv2(x(1),x(2));
df=[df2 df1]';
dx=-J\df;
x=x+dx;
% Största relativafelet:
dxnorm=max(abs(dx(1)/x(1)), abs(dx(2)/x(2)));
iter=iter+1;
end
disp('Antal iterationer:')
iter
a=x(1);
b=x(2);