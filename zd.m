function f=zd(x)
osak=0; %bergets topp [default 0]
A=4.8+osak;
f=(A./2)*exp(-((x-2).^2)./4).*(2-x);