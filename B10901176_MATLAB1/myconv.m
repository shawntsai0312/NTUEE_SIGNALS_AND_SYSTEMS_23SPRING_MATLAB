% case 1
x11=1:1:20;
x12=19:-1:1;
x1=[x11,x12];

x2=ones(10,1)';

y1=conv(x1,x2);

x13=zeros(length(x1)+length(x2)-1,length(x2))
for i=1:length(x2)
    x13(i:i+length(x1)-1,i)=x1';
end
y2=x13*x2';

f1 = figure();
stem(x1);
f2 = figure();
stem(x2);
f3 = figure();
stem(y1);
f4 = figure();
stem(y2);

% case 2
x3 = [3,9,27];
x4 = [2,4,8,16,32]
w1=conv(x3,x4);

x33=zeros(length(x3)+length(x4)-1,length(x4))
for i=1:length(x4)
    x33(i:i+length(x3)-1,i)=x3';
end
w2=x33*x4';

f5 = figure();
stem(x3);
f6 = figure();
stem(x4);
f7 = figure();
stem(w1);
f8 = figure();
stem(w2);