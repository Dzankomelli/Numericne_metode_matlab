clf %pobrise prejsno sliko...damo zraven zaradi hold on
hold on

x = linspace(-2,2);
y = linspace(-2,2);
[X,Y] = meshgrid(x,y);

contour(X,Y,X.^2+Y.^2-4,[0 0]);
contour(X,Y,X.^2-Y.^2-1,[0 0]);

hold off
axis equal

%da uporabnik napise zacetne priblizke
x0 = zeros(2,1);
x0(1) = input('Vnesite približek za x koordinato: ');
x0(2) = input('Vnesite približek za y koordinato: ');

f = @(x) [x(1)^2+x(2)^2-4; x(1)^2-x(2)^2-1];
Jf = @(x) [2*x(1) 2*x(2); 2*x(1) -2*x(2)];

[x, X, k] = newton(f, Jf, x0, 1e-12, 100);

%oddaljenost resitve od izhodisca (0.0)
d = 0;
for i = 1:length(x)
    d = d + x(i)^2;
end
d = sqrt(d);

