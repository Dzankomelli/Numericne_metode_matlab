function x = bisekcija (f,a,b,N)
% f: funckija, katero niclo iscemojj
% [a,b]: interval, na katerem iscemo niclo funkcije f
% N: stevilo korakov bisekcije
% x: priblizek, izracunan z bisekcijo

fa = f(a);
if f(a)*f(b) > 0
    error('Funkcija v robovih intervala ni nasprotno predznacena');
end

for i = 1:N
    c = a + (b-a)/2; % (a+b)/2;
    fc = f(c);
    if fc*fa < 0
        % nadaljujemo na levem intervalu
        b = c;
    else
        % nadaljujemo na desnem intervalu
        a = c;
        fa = fc;
    end
end

x = c;

end