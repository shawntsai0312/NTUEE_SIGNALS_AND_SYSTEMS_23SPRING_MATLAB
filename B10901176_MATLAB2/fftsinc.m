N=1001;
T=100;
N1=(N-1)/2;
Ts=T/N1;
leftEnd=-500;
rightEnd=500;
n=(leftEnd:rightEnd);
x=sin(2*pi*n*Ts)./(2*pi*n*Ts) ;
x(rightEnd+1)=1;
figure
plot(n, x), xlabel('n'), ylabel('x');

X=fft(x);
X2=abs(X);
X2=fftshift(X2);
figure
plot(n*2*pi/N, X2), xlabel('omega'), ylabel('X');

myfft(x, leftEnd, rightEnd, n, N)

w=zeros(size(n));
w=1/2*(1+cos(2*pi.*abs(n*Ts)/(T/2)));
w(n<-(T/(4*Ts)))=0;
w(n>(T/(4*Ts)))=0;
figure
plot(n, w),  xlabel('n'), ylabel('w');

figure
y=x.*w;
plot(n, y),  xlabel('n'), ylabel('y');

Y=fft(y);
Y1=abs(Y);
Y2=fftshift(Y1);
figure
plot(n*2*pi/N, Y2),  xlabel('omega'), ylabel('Y');

function[]=myfft(x1, leftEnd, rightEnd, n, N)
y=zeros((rightEnd-leftEnd+1));
n1=(leftEnd:rightEnd);
for a = 1:(rightEnd-leftEnd+1)
    for b = 1:(rightEnd-leftEnd+1)
        y(a)= y(a)+x1(b)*exp(-1i*a*2*pi*n(b)/N);
    end
end
y1=abs(y);
y2=zeros(rightEnd-leftEnd+1);
y2(-leftEnd+2:rightEnd-leftEnd+1)=y1(1:-leftEnd);
y2(1:-leftEnd+1)=y1(-leftEnd+1:rightEnd-leftEnd+1);
figure
plot(2*pi*n1/N,  y2),  xlabel('omega'), ylabel('X');
end
