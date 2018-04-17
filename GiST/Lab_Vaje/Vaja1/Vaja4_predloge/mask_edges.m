% Funkcija odstrani morebitne robove, ki ne pripadajo podrocju z barvo koze
% 
% Vhodi: 
%       Binary_edges   ... binarna slika robov (velikosti axb)
%       Skin_corrected ... binarna maska, ki ustreza podrocju koze (dim: axb)
% 
% Izhod:
%       Valid_edges ... binarna slika z relevantnimi robovi (velikosti axb)             
% 
% Avtor: Vitomir Štruc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function Valid_edges = mask_edges(Binary_edges, Skin_corrected);

%% Inicializacija izhoda
Valid_edges = [];

%% Zacetne operacije
[a,b,c] = size(Binary_edges);
Valid_edges = zeros(a,b);

%% Upragovljanje



