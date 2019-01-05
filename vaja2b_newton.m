
%da uporabnik napise zacetne priblizke
x0 = zeros(3,1);
x0(1) = input('Vnesite približek za x koordinato: ');
x0(2) = input('Vnesite približek za y koordinato: ');
x0(3) = input('Vnesite približek za z koordinato: ');

f = @(x) [x(1)^2+x(2)^2+x(3)^2-1; 2*x(1)^2+x(2)^2-4*x(3); ...
    3*x(1)^2-4*x(2)+x(3)^2];
%odvod po vsaki spremenljivki (vsaka funkcija ena vrstica)
Jf = @(x) [2*x(1) 2*x(2) 2*x(3); 4*x(1) 2*x(2) -4; ...
    6*x(1) -4 2*x(3)];

[x, X, k] = newton(f, Jf, x0, 1e-12, 100);

%oddaljenost resitve od  (0, 0, 0) za tretji priblizek
x1 = X(1:3,4); %zaradi sintakse
d = sqrt(x1(1)^2 + x1(2)^2 + x1(3)^2);