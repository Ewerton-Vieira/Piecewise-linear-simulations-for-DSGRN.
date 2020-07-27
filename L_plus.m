function y = L_plus(x, L, delta, zeta)
% Increasing linear ramp function, that is, defined by:
% y = L,         if x <= theta1
% y = L + delta, if x >= theta2
% y = line from (theta1, L) to (theta2, L + delta), otherwise

% Get theta1 and theta2
zeta1 = zeta(1);
zeta2 = zeta(2);

% The varibale x could be a vector, so need to split the
% vector into the parts x <= theta1, theta1 < x < theta2,
% and x >= theta2 to compute the function y
x1 = x(x <= zeta1); % Get values x <= theta1
x2 = x((x > zeta1) & (x < zeta2)); % Get values theta1 < x < theta2
x3 = x(x >= zeta2); % Get values x >= theta2

% Define the parts of the functions y1, y2, and y3

% Define y = L for x <= theta1
if isempty(x1)
  y1 = []; % Empty if x1 is empty
else
  y1 = L * ones(size(x1));
end

% Define y = line for theta1 < x < theta2
if isempty(x2)
  y2 = []; % Empty if x2 is empty
else
  m = delta / (zeta2 - zeta1); % Slope
  % Line from (theta1, L) to (theta2, L + delta)
  y2 = L + m * (x2 - zeta1);
end

% Define y = L + delta for x >= theta2
if isempty(x3)
  y3 = []; % Empty if x3 is empty
else
  y3 = (L + delta) * ones(size(x3));
end

% Join y1, y2, and y3
y = [y1, y2, y3];

end
