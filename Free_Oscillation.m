% material parameter
D = 0.01;
L = 0.0025;
mu = 1.73e6;
b = 9.78e3;
alpha = 0.509;

% load
M = 50;
g = 9.81;

% time domain
step = 3.3e-4;
t = linspace(0,0.3,0.3/step+1);

u = zeros(1,length(t));
u_d = zeros(1,length(t));
u_dd = zeros(1,length(t));
u0 = 0;
u_d0 = 0;
u_dd0 = g;

force = zeros(1,length(t));


% Newmark time step integration
for i = 2:length(t)-1
   
    u(i) = u(i-1) + step*u_d(i-1) + 0.5*step^2*u_dd(i-1);
    
    force(i) = elasticForce(u(i),D,L,mu) + viscousForce(b,alpha,u(1:i),step);
    
    u_dd(i) = (M*g - force(i))/M;
    
    u_d(i) = u_d(i-1) + step*0.5*(u_dd(i-1)+u_dd(i));
    
end