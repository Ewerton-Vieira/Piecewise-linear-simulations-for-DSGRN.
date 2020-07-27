function y = self_activationrep(x,gamma1,gamma2,L1_1,L1_2,L2_1,L2_2,delta1_1,delta1_2,delta2_1,delta2_2,zeta11,zeta12,zeta21,zeta22)
y = [-gamma1 * x(1) + (L_plus(x(1),L1_1,delta1_1,zeta11) * L_minus(x(2),L1_2,delta1_2,zeta12));...
     -gamma2 * x(2) + L_plus(x(1),L2_1,delta2_1,zeta21) + L_plus(x(2),L2_2,delta2_2,zeta22)];
end
