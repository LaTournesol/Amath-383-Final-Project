function xprime = phase1(t, x)
    N = 0.03;             %net growth / decline rate of zombie / human
    s_0 = zeros(1, (t-1) * 10);
    z_0 = zeros(1, (t-1) * 10);
    s_0(1) = x(1, 1);
    z_0(1) = x(1, 2);
    
    for i = 1.1:0.1:(t-0.1)
        index = int64((i - 1) * 10 + 1);
        s_0(index) = s_0(1) * exp(-N * i);
        z_0(index) = z_0(1) * exp(N * i);
    end

    xprime = [s_0; z_0];

end
