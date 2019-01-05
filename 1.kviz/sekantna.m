function [x,X,k] = sekantna(f,x0,x1,tol,N)

% f: funkcija, katere niclo iscemo

% x0: zacetni priblizek za sekantno metodo

% tol: toleranca dopustne absolutne razlike med dvema zaporednima priblizkoma

% N: stevilo korakov

% x: koncni priblizek po sekantni metodi metodi

% X: seznam vseh priblizkov

% k: dejansko stevilo opravljenih korakov



k = 1;

X = [x0,x1];

while k < N

    k = k+1;

    X(k+1) = X(k) - f(X(k))*(X(k)-X(k-1))/(f(X(k))-f(X(k-1)));

    if abs(X(k+1) - X(k)) < tol

        break;

    end

end



x = X(k+1);



end