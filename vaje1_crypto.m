M = load('cryptomarket.csv');

p = ones(10,1);
c = M * p; %vektor se množi z matriko

%MATRIÈNE NORME
A = M(15:24,1:10); %naredimo kvadratno 10x10 matriko

N1 =  norm(A,1);
N2 =  norm(A,2); %dela za normo 2 tudi norm(A)
N_inf =  norm(A,Inf);
N_fro = norm(A,'fro');

%VEKTORSKE NORME
n1 = norm(c,1);
n2 = norm(c,2);       %dela za normo 2 tudi norm(c)
n_inf = norm(c,Inf);

%norme brez funkcije norm
N1_brez = max(sum(abs(A)));
N2_brez = max(sqrt(eig(A'*A)));
N_inf_brez = max(sum(abs(A')));
N_fro_brez = norm(A(:)); %N_fro_brez = sqrt(sum(A.^2))


% Izracun sistema Ax = b
b = [49366; 49474; 49932; 49937; 49928; 49783; 50078; 50467; 50434; 50957];
x = A\b;
%norma x
x1 = norm(x,1);

%A = LU ... razcep
[L,U,x] = lusolve(A,b);
U_inf = norm(U, inf);

%PA = LU ... razcep z delnim pivotiranjem
[L1,U1] = lu(A);
L1_fro = norm(L1,'fro')







