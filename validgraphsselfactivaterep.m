%Parameter Values
gamma1 = 1; gamma2 = 1;
L1_1 = 0.78809095340484481; L1_2 = 0.030633909893265789;
L2_1 = 1.2555708432405928; L2_2 = 0.10738814339450141;
U1_1 = 2.7983639507336959; U1_2 = 1.0713919360828748;
U2_1 = 1.661359475378124; U2_2 = 1.5200650595272398;
theta11 = 1.935023025378543; theta12 = 1.0883352563154025;
theta21 = 0.63688745043694273; theta22 = 1.0674089393708561;

%Other Parameter Values to Fit to the Equations
epsilon = 0;
while epsilon <= 0.3
%Vary epsilons for each theta
delta1_1 = U1_1 - L1_1; delta1_2 = U1_2 - L1_2;
delta2_1 = U2_1 - L2_1; delta2_2 = U2_2 - L2_2;
zeta11 = [theta11 - epsilon, theta11 + epsilon];
zeta12 = [theta12 - epsilon, theta12 + epsilon];
zeta21 = [theta21 - epsilon, theta21 + epsilon];
zeta22 = [theta22 - epsilon, theta22 + epsilon];
f = @(t,x)self_activationrep(x,gamma1,gamma2,L1_1,L1_2,L2_1,L2_2,delta1_1,delta1_2,delta2_1,delta2_2,zeta11,zeta12,zeta21,zeta22);



x1_grid = 1:0.05:1.2;
x2_grid = 0.5:0.05:0.8;

t_span_pos = [0, 0.5];
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
epsilon = epsilon + 0.025;
end


