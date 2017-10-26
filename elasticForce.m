function Fe = elasticForce(u,D,L,mu)
    Fe = ((3*pi*mu*D^2*u)/(4*(L-u)))*(1+((D^2*(2*L-u))/(16*L^2*(L-u))));
end