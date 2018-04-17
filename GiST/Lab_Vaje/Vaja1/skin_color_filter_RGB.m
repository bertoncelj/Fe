% Funkcija iz barvne slike izloci vse slikovne elemente, ki ne ustrezajo barvi koze.
% Rezultat je binarna maska podrocja koze.
% 
% Vhod: 
%       X    ... barvna slika v RGB barvnem prostoru (velikosti axb)
% 
% Izhod:
%       Skin ... binarna maska podrocja koze (velikosti axb); slikovni
%                elementi, ki ustrezajo barvi koze imajo vrednost 1, ostali
%                vrednost 0
%                
% 
% Avtor: Vitomir �truc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function Skin = skin_color_filter_RGB(X)

%% Inicializacija izhoda
Skin = [];

%% Zacetne operacije
[a,b,c] = size(X);
Skin = zeros(a,b);

%R>95, G>40, B>20, max{R,G,B}-min{R,G,B}>15, |R-G|>15, R>G, R>B

%% Filter
R=X(:,:,1);
G=X(:,:,2);
B=X(:,:,3);

for i=1:a
    for j=1:b
        v=[R(i,j),G(i,j),B(i,j)];
        if(R(i,j)>95 & G(i,j)>40 & B(i,j)>20 & abs(R(i,j)-G(i,j))>15 & R(i,j)>G(i,j) & R(i,j)>B(i,j))
            if((max(v)-min(v))>15)
                Skin(i,j)=1;
            else
                Skin(i,j)=0;
            end
        end
    end
end


