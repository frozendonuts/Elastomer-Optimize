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
tend = 5;
t = linspace(0,tend,tend/step+1);

u = zeros(1,length(t));
u_d = zeros(1,length(t));
u_dd = zeros(1,length(t));

fun = @(x) elasticForce(x,D,L,mu)-M*g;
u(1) = fzero(fun,0.001);

u_d(1) = 0;


force = zeros(1,length(t));

forcing = 200*sin(2*pi*10*t);

force(1) = forcing(1) + M*g;
u_dd(1) = force(1)/M;

% Newmark time step integration
for i = 2:length(t)
   
    u(i) = u(i-1) + step*u_d(i-1) + 0.5*step^2*u_dd(i-1);
    
    force(i) = elasticForce(u(i),D,L,mu) + viscousForce(b,alpha,u(1:i),step);
    
    u_dd(i) = (M*g - force(i)+forcing(i))/M;
    
    u_d(i) = u_d(i-1) + step*0.5*(u_dd(i-1)+u_dd(i));
    
end

plot(1000*u,force)
xlabel('compression [mm]')
ylabel('Elastomer Force [N]')

