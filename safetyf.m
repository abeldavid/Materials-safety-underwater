
%% Materials charecteristics
ys(1)= 505; % Stainless steel
ys(2) = 31; %HDPE
ys(3) = 79; %Acrylic   % Not sure if yield or ultimate needs more research
ys(4) = 310; %Aluminum  
ys(5)= 0.3; % LDPE
ys(6)= 33; %Polypropylene
%ys(6) = 45; % pvc 40
%ys(7) = 340; % titanium 2
%ys(8) = 880; % titanium 5
%% Design characteristics
depth = 0:1:100;
%depth = 0:0.001:20; 
r = 0.1524/2 ; % in m
t = 1027 ;  % in kg/m^3
p = 101.325 + 9.81*t*depth;
sigmac = p*r/t;
sigmaL = sigmac/2;
%Not sure about the following
To = sigmac;
sigma1 =sigmaL+((sigmaL-sigmaL.^2)/2+To.^2).^0.5 ;% 
sigma2 =sigmaL-((sigmaL-sigmaL.^2)/2+To.^2).^0.5  ;

sigmavm = (((sigma1-sigma2).^2+sigma2.^2+sigma1.^2)/2).^0.5;
for i=1:6
    SF =ys(i)./sigmavm ;
    plot(depth,SF,'LineWidth',2);

    axis([0 100 0 6])
    %axis([0 20 0 80]) to test for 20m
    hold on
end
legend('Stainless Steel','HDPE','Acrylic','Aluminum','LDPE', 'Polypropylene');
xlabel('Depth (m)');
ylabel('Factor of safety')