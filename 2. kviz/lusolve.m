function [L,U,x] = lusolve(A,b)
% funkcija ki resi sistem Ax=b z uporabo LU razcepa
% brez pivotiranja

n = size(A,1);
L = eye(n);

for j = 1:n-1
    for i = j+1:n
        L(i,j) = A(i,j)/A(j,j);
        for k = j+1:n
        A(i,k) = A(i,k) - L(i,j)*A(j,k);    
        end
    end
end
U = triu(A);

%do sem nardimo LU razcep matrike A
%zaj pa resimo se sistem

%resimo Ly=b prema substitucija
y = b;
for i = 2:n
    for j = 1:i-1
        y(i) = y(i) - L(i,j)*y(j);       
    end
end

%resimo Ux=y obratna substitucija
x = y; %to ti naredi x prave velikosti
x(n) = y(n)/U(n,n);
for i = n-1:-1:1
    for j = n:-1:i+1
        x(i) = (x(i) - U(i,j)*x(j));       
    end
    x(i) = x(i) / U(i,i);
end

end









