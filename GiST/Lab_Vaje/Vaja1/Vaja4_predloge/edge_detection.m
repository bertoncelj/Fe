% Funkcija poiš?e robove na sliki z uporabo Sobelovega operatorja
% 
% Vhod: 
%       SmoothGrey ... glajena vhodna siva slika (velikosti axb)
% 
% Izhod:
%       Edges ... izracunana binarna slika robov (velikosti axb)             
% 
% Avtor: Vitomir Štruc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function Edges = edge_detection(SmoothGrey);

%% Inicializacija izhoda
Edges = [];

%% Zacetne operacije
[a,b,c] = size(Edges);
Edges = zeros(a,b);

%% Izgradnja filtra in filtriranje
Edges = edge(SmoothGrey,'sobel');



