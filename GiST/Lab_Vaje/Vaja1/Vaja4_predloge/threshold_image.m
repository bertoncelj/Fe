% Funkcija upragovi svhodno sliko s pomocjo praga "threshold"
% 
% Vhodi: 
%       Edges     ... odvod slike - aproksimacija odvoda (velikosti axb)
%       threshold ... prag za upragovljanje
% 
% Izhod:
%       Binary_edges ... izracunana binarna slika robov (velikosti axb)             
% 
% Avtor: Vitomir Štruc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function Binary_edges = threshold_image(Edges, threshold); 

%% Inicializacija izhoda
Binary_edges = [];

%% Zacetne operacije
[a,b,c] = size(Edges);
Binary_edges = zeros(a,b);

%% Upragovljanje


