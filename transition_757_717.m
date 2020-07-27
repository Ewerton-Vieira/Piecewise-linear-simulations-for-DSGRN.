%Inequalities that Change Between the two Equations
%717: T[Y,X] < (U[X,Y] + L[Y,Y]) < T[Y,Y]
%757: T[Y,Y] < (U[X,Y] + L[Y,Y])
%Parameters to See Transition Between 757 and 717
%Piecewise Linear Function Parameters and Hill Function Parameters
gamma1 = 1; gamma2 = 1;
L1_2 = 0.1; L1_1 = 0.95342787739038648; 
L2_1 = 0.61803564097219688; L2_2 = 0.3;
theta12 = 0.62197028064715076; theta11 = 0.72879306117983911; 
theta21 = 0.5; theta22 = 0.9; %Varying theta22
U1_2 = 0.7; U1_1 = 3.4328589008428465; 
U2_1 = 2.6355044068462816; U2_2 = 1.5; 
n1_1 = 5; n1_2 = 5; n2_1 = 5; n2_2 = 5;
%Other Parameter Values to Fit to the Equations
epsilon = 0.05;
%Vary epsilons for each theta
delta1_1 = U1_1 - L1_1; delta1_2 = U1_2 - L1_2;
delta2_1 = U2_1 - L2_1; delta2_2 = U2_2 - L2_2;
zeta11 = [theta11 - epsilon, theta11 + epsilon];
zeta12 = [theta12 - epsilon, theta12 + epsilon];
zeta21 = [theta21 - epsilon, theta21 + epsilon];
zeta22 = [theta22 - epsilon, theta22 + epsilon];

f = @(t,x)self_activationrep(x,gamma1,gamma2,L1_1,L1_2,L2_1,L2_2,delta1_1,delta1_2,delta2_1,delta2_2,zeta11,zeta12,zeta21,zeta22);
g = @(t,x)testingparameters(x,gamma1,gamma2,L1_1,L1_2,L2_1,L2_2,delta1_1,delta1_2,delta2_1,delta2_2,theta11,theta12,theta21,theta22,n1_1,n1_2,n2_1,n2_2);

x1_grid = 0:0.1:1;
x2_grid = 0:0.1:1.1;

t_span_pos = [0, 0.1];
t_span_neg = [0, -0.01];

figure; hold on;
%Piecewise Linear Grid
for x1 = x1_grid
  for x2 = x2_grid
    x0 = [x1; x2];

    % Solve ode forward (positive time)
    [t1, y1] = ode45(f, t_span_pos, x0);
    % Plot solution
    plot(y1(:, 1), y1(:, 2), 'b', 'LineWidth', 2)

    % Solve ode backwards (negative time)
    [t1, y1] = ode45(f, t_span_neg, x0);
    % Plot solution
    plot(y1(:, 1), y1(:, 2), 'r', 'LineWidth', 2)
  end
end

figure; hold on;
%Hill Function Grid
for x1 = x1_grid
  for x2 = x2_grid
    x0 = [x1; x2];

    % Solve ode forward (positive time)
    [t2, y2] = ode45(g, t_span_pos, x0);
    % Plot solution
    plot(y2(:, 1), y2(:, 2), 'b', 'LineWidth', 2)

    % Solve ode backwards (negative time)
    [t2, y2] = ode45(g, t_span_neg, x0);
    % Plot solution
    plot(y2(:, 1), y2(:, 2), 'r', 'LineWidth', 2)
  end
end

xlabel('$$x_1$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$x_2$$', 'Interpreter', 'latex', 'FontSize', 35)
