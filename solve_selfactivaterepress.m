set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')

%Parameter Values
gamma1 = 1; gamma2 = 1;
L1_1 = 0.78809095340484481; L1_2 = 0.030633909893265789;
%L2_1 = 1.2555708432405928; U1_2 = 1.0713919360828748;
L2_1 = 0.5; U1_2 = 0.9;
L2_2 = 0.10738814339450141;
U1_1 = 2.7983639507336959; 
U2_1 = 1.661359475378124; U2_2 = 1.5200650595272398;
theta11 = 1.935023025378543; theta12 = 1.0883352563154025;
theta21 = 0.63688745043694273; theta22 = 1.0674089393708561;

%Other Parameter Values to Fit to the Equations
epsilon = 0.05; 
delta1_1 = U1_1 - L1_1; delta1_2 = U1_2 - L1_2;
delta2_1 = U2_1 - L2_1; delta2_2 = U2_2 - L2_2;
zeta11 = [theta11 - epsilon, theta11 + epsilon];
zeta12 = [theta12 - epsilon, theta12 + epsilon];
zeta21 = [theta21 - epsilon, theta21 + epsilon];
zeta22 = [theta22 - epsilon, theta22 + epsilon];

%Solve the ODE and Graph Solution
f = @(t,x)self_activationrep(x,gamma1,gamma2,L1_1,L1_2,L2_1,L2_2,delta1_1,delta1_2,delta2_1,delta2_2,zeta11,zeta12,zeta21,zeta22);

t_span_pos = [0, 1];
t_span_neg = [0, -0.05];

x0 = [0.01; 0.01];

% Solve ode forward (positive time)
[t1, y1] = ode45(f, t_span_pos, x0);
% Solve ode backwards (negative time)
[t2, y2] = ode45(f, t_span_neg, x0);

plot(y1(:, 1), y1(:, 2), 'b', 'LineWidth', 2)
plot(y2(:, 1), y2(:, 2), 'r', 'LineWidth', 2)

