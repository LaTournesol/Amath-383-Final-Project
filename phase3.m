function xprime = phase3(t, x)
    a = 0.0001;              %natural death rate
    b = 0.001;               %birth rate
    c = 0;                   %rate of turning into zombie when die naturally
    alpha = 0.001;           %zombie death rate
    beta = 0.0001;           %human death rate during the battle
    gamma = 0.00019;         %human infection rate during battle(not dead)

    xprime = [b - a * x(1) - beta * x(1) * x(2); (beta - gamma - alpha) * x(1) * x(2) + c * a * x(1)];


end
