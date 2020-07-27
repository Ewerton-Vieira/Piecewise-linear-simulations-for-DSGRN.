function y = L_minus(x, L, delta, zeta)
% Decreasing linear ramp function, that is, defined by:
% y = L + delta, if x <= zeta1
% y = L,         if x >= zeta2
% y = line from (zeta1, L + delta) to (zeta2, L), otherwise

% Get zeta1 and zeta2
zeta1 = zeta(1);
zeta2 = zeta(2);

% The varibale x could be a vector, so need to split the
% vector into the parts x <= zeta1, zeta1 < x < zeta2,
% and x >= zeta2 to compute the function y
x1 = x(x <= zeta1); % Get values x <= theta1
x2 = x((x > zeta1) & (x < zeta2)); % Get values zeta1 < x < zeta2
x3 = x(x >= zeta2); % Get values x >= zeta2

% Define the functions by parts: y1, y2, and y3

% Define y = L + delta for x <= zeta1
if isempty(x1)
  y1 = []; % Empty if x1 is empty
else
  y1 = (L + delta) * ones(size(x1));
end

% Define y = line for zeta1 < x < zeta2
if isempty(x2)
  y2 = []; % Empty if x2 is empty
else
  m = delta / (zeta1 - zeta2); % Slope
  % Line from (zeta1, L + delta) to (zeta2, L)
  y2 = L + delta + m * (x2 - zeta1);
end

% Define y = L for x >= zeta2
if isempty(x3)
  y3 = []; % Empty if x3 is empty
else
  y3 = L * ones(size(x3));
end

% Join y1, y2, and y3
y = [y1, y2, y3];

end
