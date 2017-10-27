function Fv = viscousForce(b, alpha, u, dT)

% b and alpha are material parameters
% u is the array of deflections at past time steps
% dT is the delta T of solver

    sum = 0;
    
    % considers a truncated history of deflections
    % since gamma(173) or above is too large for vanilla matlab
    for i = 0:min(length(u)-1,170)
        sum = sum + u(length(u)-i)*gamma(i-alpha)/gamma(i+1);
    end
    
    Fv = b *dT^(-alpha)*sum/gamma(-alpha);
end