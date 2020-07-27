%Parameter Values for 757
gamma1 = 1; gamma2 = 1;
L1_1 = 0.95342787739038648; L1_2 = 0.8603666155656533;
L2_1 = 0.61803564097219688; L2_2 = 0.94947232767490408;
U1_1 = 3.4328589008428465; U1_2 = 1.7840643452499936;
U2_1 = 2.6355044068462816; U2_2 = 6.2666525511711564;
theta11 = 0.72879306117983911; theta12 = 0.62197028064715076;
theta21 = 2.0846629267398877; theta22 = 2.3666027092795168;

%{ "inequalities" : "L[X,X] L[Y,X] < T[X,Y] && T[X,X] < U[X,X] L[Y,X] && T[X,Y] < L[X,X] U[Y,X] < T[X,X] 
%&& T[X,X] < U[X,X] U[Y,X] && 0 < T[X,Y] < T[X,X] && 0 < L[X,X] < U[X,X] && 0 < L[Y,X] < U[Y,X] && (L[X,Y] + L[Y,Y]) < T[Y,X] && T[Y,X] < (U[X,Y] + L[Y,Y]) < T[Y,Y] && T[Y,Y] < (L[X,Y] + U[Y,Y]) 
%&& T[Y,Y] < (U[X,Y] + U[Y,Y]) && 0 < T[Y,X] < T[Y,Y] 
%&& 0 < L[X,Y] < U[X,Y] && 0 < L[Y,Y] < U[Y,Y]", 
%"variables" : "{L[X,X], L[Y,X], U[X,X], U[Y,X], T[X,Y], T[X,X], L[X,Y], L[Y,Y], U[X,Y], U[Y,Y], T[Y,X], T[Y,Y]}"}'

%Other Parameter Values to Fit to the Equations
epsilon = 0.01;
%Vary epsilons for each theta
delta1_1 = U1_1 - L1_1; delta1_2 = U1_2 - L1_2;
delta2_1 = U2_1 - L2_1; delta2_2 = U2_2 - L2_2;
zeta11 = [theta11 - epsilon, theta11 + epsilon];
zeta12 = [theta12 - epsilon, theta12 + epsilon];
zeta21 = [theta21 - epsilon, theta21 + epsilon];
zeta22 = [theta22 - epsilon, theta22 + epsilon];

f = @(t,x)self_activationrep(x,gamma1,gamma2,L1_1,L1_2,L2_1,L2_2,delta1_1,delta1_2,delta2_1,delta2_2,zeta11,zeta12,zeta21,zeta22);



x1_grid = 0:0.1:1.5;
x2_grid = 0:0.2:2.5;

t_span_pos = [0, 0.1];
t_span_neg = [0, -0.01];

figure; hold on;

for x1 = x1_grid
  for x2 = x2_grid
    x0 = [x1; x2];

    % Solve ode forward (positive time)
    [t, y] = ode45(f, t_span_pos, x0);
    % Plot solution
    plot(y(:, 1), y(:, 2), 'b', 'LineWidth', 2)

    % Solve ode backwards (negative time)
    [t, y] = ode45(f, t_span_neg, x0);
    % Plot solution
    plot(y(:, 1), y(:, 2), 'r', 'LineWidth', 2)
  end
end

xlabel('$$x_1$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$x_2$$', 'Interpreter', 'latex', 'FontSize', 35)
