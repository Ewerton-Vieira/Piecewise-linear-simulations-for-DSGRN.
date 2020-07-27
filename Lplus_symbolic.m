function w = Lplus_symbolic(x,zeta1,zeta2,L,U)
    m = (U - L)/(zeta2 - zeta1);
    b = L - (m * zeta1);
    syms w(x);
    w(x) = piecewise(x < zeta1, L, x > zeta2, U, zeta1 < x < zeta2, m*x +b);
end
