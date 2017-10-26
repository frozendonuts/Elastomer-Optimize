D = 0.001;

L = 0.025;

mu = 1.73 * 10^6;

mg = 101/2.2*9.8;

u = linspace(0,0.024,1000);
Fe = zeros(1,length(u));
for i = 1:length(u)
    Fe(i) = elasticForce(u(i),D,L,mu);
end

plot(u,Fe)



d = linspace(0.005,0.03,100);
f = zeros(length(d),length(u));

for i = 1:length(d)
   for j = 1:length(u)
      f(i,j) = elasticForce(u(j),d(i),L,mu);
   end
end

%figure, surf(u,d,f)