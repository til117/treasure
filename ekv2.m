function f=ekv2(a,b)
tol=10^-6; %default quad tolerans
ha=0.2; %hastighetsändring [20%]
%Simpson approximation av integralen:
S1=quad('bage', 0, 2, tol);
S2=quad('bage', 2, a, tol);
S3=quad('bage', a, b, tol);
S4=sqrt((b-a)^2+(z(a)-z(b))^2);
f=S1+S2/(1+ha)+S3/(1+ha)-S1/(1-ha)-S2-S4/(1+ha);