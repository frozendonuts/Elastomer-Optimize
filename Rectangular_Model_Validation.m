W = 0.75*2.54/100;
L = 2.5*2.54/100;
H = 0.75*2.54/100;

v = 0.4066;
Ec = 0.76*0.124 * 10^6;
% nomial compression E estimated from fitting to be 94.24 kPa

Et = 0.0896 * 10^6;
% nomial tensile E estimated from sorbothane datasheet

u = linspace(-H*4,0.015,100);
stepSize = 0.0000001;

strain = 100*u/H;
Fe = zeros(1,length(u));

for i = 1:length(u)
    Fe(i) = rectangularForce(u(i),W,L,H,v,Ec,Et,stepSize);
end


plot(strain,10^-6*Fe/(W*L))

hold on

x = [-300 -200 -100 5 10 15 20 25];
y = [-0.255106 -0.179264 -0.0896318 0.00344738 0.0124 0.02137 0.0324 0.04619];

scatter(x,y)

figure, plot(u,Fe)




