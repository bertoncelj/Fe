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
% Avtor: Vitomir Štruc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function Skin = skin_color_filter_RGB(X)

%% Inicializacija izhoda
Skin = [];

%% Zacetne operacije
[a,b,c] = size(X);
Skin = zeros(a,b);

%% Filter
R=X(:,:,1);
G=X(:,:,2);
B=X(:,:,3);




