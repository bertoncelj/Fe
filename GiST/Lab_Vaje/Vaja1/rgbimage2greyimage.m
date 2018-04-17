% Funkcija pretvori barvno vhodno sliko X v sivo sliko Grey
% 
% Vhod: 
%       X ... vhodna barvna slika zapisana v RGB prostoru (velikosti axb)
% 
% Izhod:
%       Grey ... izhodna siva slika enakih dimenzij kot X              
% 
% Avtor: Vitomir �truc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function Grey = rgbimage2greyimage(X); 

%% Inicializacija izhoda
Grey = [];

%% Zacetne operacije
[a,b,c] = size(X);
Grey = zeros(a,b);

%% Pretvorba
Grey = uint8(mean(X, 3));
