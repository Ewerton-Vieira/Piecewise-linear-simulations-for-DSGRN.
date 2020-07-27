function y = testingparameters(x,gamma1,gamma2,L1_1,L1_2,L2_1,L2_2,delta1_1,delta1_2,delta2_1,delta2_2,theta11,theta12,theta21,theta22,n1_1,n1_2,n2_1,n2_2)
    y = [-gamma1 * x(1) + (H_plus(x(1),L1_1,delta1_1,theta11,n1_1) * H_minus(x(2),L2_1,delta2_1,theta21,n2_1));...
     -gamma2 * x(2) + H_plus(x(1),L1_2,delta1_2,theta12,n1_2) + H_plus(x(2),L2_2,delta2_2,theta22,n2_2)];
end