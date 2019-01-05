M = load('marketcap.csv') %load, nujno v ''
%plot(1:size(M,1),M(:4), 1:size(M,1), M(:,6));
%legend('Microsoft', 'Apple', 'Google')

m = size(M,1);
C = zeros(m,1);
C(1) = sum(M(1,4:end));
I = [1000; zeros(m-1,1)];
Ifloor = I;
Iceil = I;
Iround = I;
for d = 2:m;
    C(d) = sum(M(d,4:end));
    r = C(d) / C(d-1);
    I(d) = I(d-1)*r
    Ifloor(d) = Ifloor(d-1)*floor(r*1000)/1000;
    Iceil(d) = Iceil(d-1)*ceil(r*1000)/1000;
    Iround(d) = Iround(d-1)*round(r*1000, 3)/1000;
end

plot(1:m, I, 1:m, Ifloor, 1:m, Iceil, 1:m, Iround)
%stevilka dneva:
st_dneva = 0;
for i =size(M,1);
    if M(i,1) == 2015;
        if M(i,2) == 12;
            if M(i,3) == 31;
                st_dneva = i;
            end
        end
    end
end
        

