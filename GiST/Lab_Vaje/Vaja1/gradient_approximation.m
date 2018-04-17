% Funkcija poisce robove na sliki z uporabo Sobelovega operatorja
% 
% Vhod: 
%       SmoothGrey ... glajena vhodna siva slika (velikosti axb)
% 
% Izhod:
%       Edges ... izracunana binarna slika robov (velikosti axb)             
% 
% Avtor: Vitomir �truc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function Edges = gradient_approximation(SmoothGrey);

%% Inicializacija izhoda
Edges = [];

%% Zacetne operacije
[a,b,c] = size(SmoothGrey);
Edges = zeros(a,b);

%% Izgradnja filtra in filtriranje

hv = fspecial('sobel');
% generiraj
hh = hv';
% generiraj
Gx = (imfilter(double(SmoothGrey),hv,'replicate')); %
Gy = (imfilter(double(SmoothGrey),hh,'replicate')); 
Edges = sqrt(Gx.^2+Gy.^2);


