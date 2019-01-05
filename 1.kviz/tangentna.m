function [x,X,k] = tangentna(f,df,x0,tol,N)

% f: funkcija, katere niclo iscemo

% df: odvod funkcije f,

% x0: zacetni priblizek za tangentno metodo

% tol: toleranca dopustne absolutne razlike med dvema zaporednima

% priblizkoma

% N: stevilo korakov

% x: koncni priblizek po tangentni metodi

% X: seznam vseh priblizkov

% k: dejansko stevilo opravljenih korakov



k = 0;

X = x0;

while k < N

    k = k+1;

    X(k+1) = X(k) - f(X(k))/df(X(k));

    if abs(X(k+1) - X(k)) < tol

        break;

    end

end



x = X(k+1);


end
