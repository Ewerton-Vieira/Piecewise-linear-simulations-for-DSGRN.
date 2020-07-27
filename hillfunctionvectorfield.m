set(0, 'DefaultAxesFontSize', 18)
set(0, 'DefaultAxesFontWeight', 'bold')
% Parameter Values
gamma1 = 1; gamma2 = 1;
L1_2 = 0.1304899623422861; L1_1 = 0.62594052272260226;
L2_1 = 0.44977930684799039;L2_2 = 0.12876076658470859;
theta12 = 0.42235374740305959; theta11 = 0.52946506413953576;
theta21 = 0.39387583673668836; theta22 = 0.48;
U1_2 = 0.34667707724240154; U1_1 = 1.7138592018233012;
U2_1 = 1.6487298458543411; U2_2 = 2.436598154183689;
n1_1 = 20; n1_2 = 20; n2_1 = 20; n2_2 = 20;
delta1_1 = U1_1 - L1_1; delta1_2 = U1_2 - L1_2;
delta2_1 = U2_1 - L2_1; delta2_2 = U2_2 - L2_2;

% Set axis grids
x1_grid = 0:1:3;
x2_grid = 0:1:3;

% Plot the toggle switch vector field

% Define a grid on the (x, y) plane
[t, x] = meshgrid(x1_grid, x2_grid);

% Evaluate the toggle switch vector field
u = -gamma1 * t + (H_plus(t,L1_1,delta1_1,theta11,n1_1) * H_minus(x,L2_1,delta2_1,theta21,n2_1));
v = -gamma2 * x + H_plus(t,L1_2,delta1_2,theta12,n1_2) + H_plus(x,L2_2,delta2_2,theta22,n2_2);

% Get a coarser grid to plot the vector field
% The finner grid is used to plot the contours
x_c = t(1:10:end, 1:10:end);
y_c = x(1:10:end, 1:10:end);
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
contour(t, x, z, num_contours, 'LineWidth', 2) % Plot contour curves of z
quiver(x_c, y_c, u_c, v_c, 'LineWidth', 1.5) % Plot the vector field
% quiver(x, y, u, v, 'LineWidth', 1.5) % Plot the vector field

% Add colorbar
colorbar

xlabel('$$x$$', 'Interpreter', 'latex', 'FontSize', 35)
ylabel('$$y$$', 'Interpreter', 'latex', 'FontSize', 35)
title('Vector Field Hill Function');