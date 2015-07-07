function xprime = phase2(t, x)
    a = 0.00001;            %natural death rate
    b = 0;                  %birth rate
    c = 0.0008;             %rate of turning into zombie when die naturally
    alpha = 0.0001;         %zombie death reate
    beta = 0.0005;          %human death rate during the battle
    gamma = 0.000095;       %human infection rate during battle(not dead)
    
    xprime = [b - a * x(1) - beta * x(1) * x(2) - gamma * x(1) * x(2); (beta - alpha) * x(1) * x(2) + c * a * x(1)];
    
end
