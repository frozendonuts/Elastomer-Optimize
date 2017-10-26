mg = 101/2.2*9.8;

n = 11;
D = linspace(0.005,0.03,11);

L = 0.025;
mu = 1.73 * 10^6;
u0 = zeros(1,n);


for i = 1:n
    fun = @(u) elasticForce(u,D(i),L,mu)-mg;
    u0(i) = fzero(fun,0.001);
end

delta_u = 0.000001;
k = zeros(1,n);

for i = 1:n
    k(i) = (elasticForce(u0(i)+delta_u,D(i),L,mu) - elasticForce(u0(i),D(i),L,mu))/delta_u; 
end


plot(D,k)