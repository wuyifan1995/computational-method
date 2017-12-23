%% *************计算方法第一题******************
%作者：吴一帆   学号：3117001130
%编写时间2017年12月11号
%*****************************************************
x=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20]; 
y=[9.01 8.96 7.96 7.97 8.02 9.05 10.13 11.18 12.26 13.28 13.32 12.61 11.29 10.22 9.15 7.9 7.95 8.86 9.81 10.8 10.93];
n=length(y);
yv=zeros(1,100.*(n-1)+1);
%调用三次样条的子函数求出M矩阵
M=SPLINEM(x,y,n);
p=1;
%%
%用FINDK子函数找出x所在的区间，构造拟合方程
for xv=0:0.01:20
k=FINDK(x,n,xv);
h=x(k+1)-x(k);
xa=x(k+1)-xv;
xb=xv-x(k);
yv(p)=(M(k).*xa.^3./6+M(k+1).*xb.^3./6+(y(k)-M(k).*h.^2./6).*xa+(y(k+1)-M(k+1).*h.^2./6).*xb)./h;
p=p+1;
end
%%
%%画拟合图
figure('NumberTitle', 'off', 'Name', '数据拟合图');
plot(x,y,'k *');
hold on;
xv=0:0.01:20;
plot(xv,yv);
figure('NumberTitle', 'off', 'Name', '海底铺线图');
plot(x,-y,'k *');
hold on;
xv=0:0.01:20;
plot(xv,-yv);

%% 采用勾股定理 细分每一段求积
 f=0; %初始长度为0
 h=0.01;%h为每段步长
for i=1:(20/h)
    t=sqrt((abs(yv(i+1)-yv(i)))^2+h^2);
   f=f+t;
end
disp('曲线长度是：');
disp(f);


