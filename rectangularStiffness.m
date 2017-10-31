function k = rectangularStiffness(u,W,L,H,v,Ec,Et)

    if u >= 0  % nonlinear in compression
        k = ((Ec*W*L)/(H-u))*((u*v/H + 1)^2 + (W*L)^2/(2*(W+L)^2*(H-u)^2));
        
    else  % linear in tension
        k = Et*W*L/H;
    end
end




