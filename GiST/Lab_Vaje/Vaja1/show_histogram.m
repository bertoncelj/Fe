% Funkcija prikaze histogram slike X. Ce je X barvna slika, prikaze
% histogram sive slike.
% 
% Avtor: Vitomir Štruc
% Datum: 12.4.2012
% Copyright (c) 2012 FE UL

function show_histogram(X)

[a,b,c] = size(X);

if c==1
    %to je siva slika    
    X1=double(X);
elseif c==3
    %to je barvna slika - pretvorimo v sivo
    X1=double(mean(X,3));
else 
    error('show_histogram:wrgInput','Vhod ni ne barvna, ne siva slika');
end

% figure
[n,xout]=hist(X1(:),255);
bar(xout,n)
title('Histogram vhodne slike')
