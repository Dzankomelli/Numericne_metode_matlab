% sistem
b = 5; t = 4; L = -5; U = 5;
% mantise
c = 0:b -1;
M = zeros ( b ^t ,1) ;
i = 1;
for c1 = c
    for c2 = c
        for c3 = c
            for c4 = c
                M(i) = (b .^ -(1: t ) ) *[ c1 ; c2 ; c3 ; c4 ];
                i = i +1;
            end
        end
    end
end
% normalizirana števila
d = U - L +1;
bm = b ^( t -1) ;
Xpn = zeros (( b -1) * bm , d ) ;
for i = 0: d -1
    Xpn (: , i +1) = M ( bm +1: end) * b ^( L + i ) ;
end
Xpn = Xpn (:) ;
Xn = [- Xpn( end : -1:1) ; Xpn ];

% denormalizirana števila
Xpd = M (2: b ^( t -1) ) * b ^ L;
Xd = [- Xpd(end: -1:1) ; Xpd ];

% predstavljiva števila ( brez 0 , Inf , -Inf in NaN)
X = [ Xn(1: end /2) ; Xd(1: end /2) ; Xpd ; Xpn ];

%delez denormaliziranih stevil
delezXd = length(Xd) / length(X)

%stevilo normaliziranih stevil, manjsih od ()

stevec1 = 0;
for i = (1: length(Xn));
    if Xn(i) < pi
        stevec1 = stevec1 +1
    end
end



st_pi = [];
for i = (1 : length (X));
    if abs(X(i) - pi) < 1;
        st_pi = [st_pi; X(i)];
    end
end

razmiki = [];
for i = [2: length(st_pi)];
    razmiki = [razmiki; (st_pi(i) - st_pi(i-1))];
end

povprecni_razmiki = sum(razmiki) / length(razmiki)


stevilo = 0;
razdalja = 1000;
for i = [1: length(X)];
    st = X(i);
    d = abs(pi - st);
    if d < razdalja
        razdalja = d;
        stevilo = st;
    end
end
nablizje_stevilo = stevilo
        



