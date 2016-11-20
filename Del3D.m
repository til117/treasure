clear all, close all,  clc
format long
%3D figur av landskapet:
steg=0.1;
x=[-12:steg:12];
y=x;
[X,Y]=meshgrid(x,y);
Z=z3(X,Y);
mesh(X,Y,Z)
xlabel('x')
ylabel('y')
zlabel('z')
hold on
%Guldskattens position (från Guldskatten.m)
b=10.458664937192902;
stem3(b,0,z3(b,0), 'm:')
%hemmets position:
stem3(0,0,z3(0,0), 'm:')
%Gyllenesnittetsökning för z(0,y):
rg=(sqrt(5)-1)/2; 
q=1-rg;
%intervallet i y-axeln
ag=0;
bg=7.5;
tol=10^(-4); %felgränsen
dxg=bg-ag;
x1=0+q*dxg;
z1=z3(0,x1);
x2=ag+rg*dxg;
z2=z3(0,x2);
while bg-ag>tol
  if z1<z2 
      dxg=x2-ag; 
      bg=x2; 
      x2=x1; 
      z2=z1; 
      x1=ag+q*dxg; 
      z1=z3(0,x1);
  else
      dxg=bg-x1; 
      ag=x1; 
      x1=x2; 
      z1=z2; 
      x2=ag+rg*dxg; 
      z2=z3(0,x2);
  end
end
disp('Det minsta y-värdet för styrpunkten:')
ymin=x1 
%Adas stig (Bezierkurvan): 
t=[0:0.05:1]';
F2=[(1-t).^2 2*t.*(1-t) t.^2];
p1=[b 0 z3(b,0)]; %skattens position
p2=[0 0 z3(0,0)]; %hemmets position
styr=[0 ymin z3(0,ymin)]; %styrpunkten
r=F2*[p1; styr; p2];
plot3(r(:,1),r(:,2),r(:,3),'m-')