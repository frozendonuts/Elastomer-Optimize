function Fe = rectangularForce(u,W,L,H,v,Ec,Et,stepSize)

    steps = linspace(0,u,(abs(u)/stepSize)+1);
    Fe = 0;

    for i = 1:length(steps)-1
        Fe = Fe + 0.5*(steps(i+1) - steps(i))*(rectangularStiffness(steps(i),W,L,H,v,Ec,Et) + rectangularStiffness(steps(i+1),W,L,H,v,Ec,Et));
    end
    
end