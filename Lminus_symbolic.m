function f = Lminus_symbolic(x,zeta1,zeta2,L,U)
    m = (L - U)/(zeta2 - zeta1);
    b = U - (m * zeta1);
    syms f(x);
    f(x) = piecewise(x < zeta1, U, x > zeta2, L, zeta1 < x < zeta2, m*x +b);
end
