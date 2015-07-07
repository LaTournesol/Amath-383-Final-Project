clear all; close all; clc
t_total = 2000;
%%  phase 1
t_phase1 = 5;
X_init = [11 4];
P = phase1(t_phase1, X_init);
plot(0:0.1:(t_phase1-1.1), P(1, 1:end), 'b', 0:0.1:(t_phase1-1.1), P(2, 1:end), 'k'); hold on;

%% phase 2
t_vacc = 335;

inits_phase2 = [P(1, end), P(2, end)];
tspan_phase2 = [0, t_vacc];
tspan_phase2_novacc = [0, t_total];
[t, x] = ode45(@phase2, tspan_phase2, inits_phase2);
[t_conti, x_conti] = ode45(@phase2, tspan_phase2_novacc, inits_phase2);

index = 1;
for i = 1:t
    if i >= t_vacc
        break;
    end
    index = index + 1;
end

%% phase 3

inits_phase3 = [x(end, 1), x(end, 2)];
tspan_phase3 = [0, t_total];
[t2, x2] = ode45(@phase3, tspan_phase3, inits_phase3);

t2 = t2 + t_vacc + t_phase1;
t = t + t_phase1;

%plot(t_conti, x_conti(:,1), 'm', t_conti, x_conti(:, 2), 'c');
plot(t, x(:,1), 'b', t, x(:, 2), 'k');
plot(t2, x2(:, 1), 'b', t2, x2(:, 2), 'k');

plot(t2(1), x(end, 1), 'ro');
plot(t2(1), x(end, 2), 'ro'); 
xvalue = 2 * ones(1, tspan_phase3(2));
T = 1:tspan_phase3(2);
plot(T, xvalue);
%title_str = sprintf('Human-Zombie populations graph with vaccine deploy time = %i', t_vacc);
%title('Human-Zombie populations graph without vaccine');
%title(title_str)
xlabel('Time');
ylabel('Population');
legend('Human population in Phase 1', 'Zombie pupulation in Phase 1', 'Human population in Phase 2', 'Zombie pupulation in Phase 2');
