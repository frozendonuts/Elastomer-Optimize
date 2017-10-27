step = 0.0002;
t = linspace(0,0.3,0.3/step+1);
f = 10;
u = 0.0005*(1 - cos(2*pi*f*t));

fe = zeros(1,length(t));
fv = zeros(1,length(t));
force = zeros(1,length(t));


D = 0.01;
L = 0.0025;
mu = 1.73e6;

b = 9.78e3;
alpha = 0.509;

%assume force is 0 to start with

for i = 2:length(t)
    
    fe(i) = elasticForce(u(i),D,L,mu);
    fv(i) = viscousForce(b,alpha,u(1:i),step);
    force(i) = fe(i) + fv(i);
    
end

plot(t,fe)
hold on
plot(t,fv)