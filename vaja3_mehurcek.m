D = load('dot-com.csv');
X = D(195:940,1);   %trgovalni dnevi
Y = D(195:940,2);   %indeks

clf
hold on

plot(X,Y);

%A = ones(length(X), 3);
%for i = 1:length(X)
%    A(i,1) = X(i)^2;
%    A(i,2) = X(i);
%end

%to je ena pot z zanko, lahko pa tudi tak nardis:

A = [X.^2, X.^1, X.^0];
b = Y;

%RESIMO PREDOLOCEN SISTEM PREKO NORMALNEGA
a1 = (A' * A)\(A' * b);     % a1... koeficienti

%narisemo polinom tak, da samo nastejemo koeficiente
%od tistega za najvecjo potenco do prostega clena
x = X;
plot(x, polyval(a1,x)) %polyvale naredi polinom
%polinom, ko smo minimizirali napake


%RESIMO PREDOLOCEN SISTEM PREKO QR RAZCEPA
[Q,R] = qr(A);
a2 = R\(Q'*b);

x = X;
plot(x, polyval(a2,x))


%RESIMO PREDOLOCEN SISTEM PREKO VGRAJENE METODE
a = A\b;

x = X;
plot(x, polyval(a,x), 'r')



%do zdaj smo aproksimirali s parabolo, zdaj bomo pa 
%z eksponentno

%RESIMO PREDOLOCEN SISTEM ZA EKSPONENTNO FUNKCIJO

%matrika A ostane kr ista

%priblizek
b0 = A\log(Y);

%naredli bomo funkcijo ki nadomesti polyval
f = @(b,x) exp(b(1)*x.^2 + b(2)*x + b(3));

%tocna resitev
FUN = @(b)norm(f(b,X)-Y)^2;
b1 = fminsearch(FUN,b0);
plot(x, f(b1,x), 'm')


plot(x, f(b0,x), 'g');

hold off

























