%Parameter Values
gamma1 = 1; gamma2 = 1;
L1_1 = 0.78809095340484481; L1_2 = 0.030633909893265789;
L2_1 = 1.2555708432405928; L2_2 = 0.10738814339450141;
U1_1 = 2.7983639507336959; U1_2 = 1.0713919360828748;
U2_1 = 1.661359475378124; U2_2 = 1.5200650595272398;
theta11 = 1.935023025378543; theta12 = 1.0883352563154025;
theta21 = 0.63688745043694273; theta22 = 1.0674089393708561;

%Zeta Values
epsilon = 0.01;
zeta11 = [theta11 - epsilon, theta11 + epsilon];
zeta12 = [theta12 - epsilon, theta12 + epsilon];
zeta21 = [theta21 - epsilon, theta21 + epsilon];
zeta22 = [theta22 - epsilon, theta22 + epsilon];
zeta11_1 = zeta11(1); zeta11_2 = zeta11(2); zeta12_1 = zeta12(1);
zeta12_2 = zeta12(2); zeta21_1 = zeta21(1); zeta21_2 = zeta21(2);
zeta22_1 = zeta22(1); zeta22_2 = zeta22(2);



x1_grid = 0:0.05:4;
x2_grid = 0:0.05:4;
[x, y] = meshgrid(x1_grid, x2_grid);
%Define the functions for each piecewise part

%piecewise parts for x1
w = Lplus_symbolic(x,zeta11_1,zeta11_2,L1_1,U1_1);%x1 self-activating
f = Lminus_symbolic(x,zeta21_1,zeta21_2,L2_1,U2_1);%x2 repressing x1

%piecewise parts for x2
g = Lplus_symbolic(x,zeta22_1,zeta22_2,L2_2,U2_2);%x2 self-activating
h = Lplus_symbolic(x,zeta12_1,zeta12_2,L1_2,U1_2);%x1 activating x2

u = - gamma1 * x + (w(x) * f(y));
v = - gamma2 * y + g(y) + h(x);

% Get a coarser grid to plot the vector field
% The finner grid is used to plot the contours
x_c = x(1:10:end, 1:10:end);
y_c = y(1:10:end, 1:10:end);
u_c = u(1:10:end, 1:10:end);
v_c = v(1:10:end, 1:10:end);

figure; hold on;
quiver(x_c, y_c, u_c, v_c, 'LineWidth', 1.5) % Plot the vector field
% quiver(x, y, u, v, 'LineWidth', 1.5) % Plot the vector field

xlabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', 35)

% Next we plot the vector field and contour curves
% of the norm squared of the vector field (u, v)
z = u .^ 2 + v .^ 2; % Compute ||(u,v)||^2

num_contours = 50; % Number of contour values to plot

figure; hold on;
contour(x, y, z, num_contours, 'LineWidth', 2) % Plot contour curves of z
quiver(x_c, y_c, u_c, v_c, 'LineWidth', 1.5) % Plot the vector field
% quiver(x, y, u, v, 'LineWidth', 1.5) % Plot the vector field

% Add colorbar
colorbar

xlabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', 35)

