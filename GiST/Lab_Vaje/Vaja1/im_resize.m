% Funkcija zmanjsa velikost slike na faktor 0.3 originala
% 
% Vhodi: 
%       Valid_edges  ... vhodna slika (velikosti axb)
% 
% Izhod:
%       Small_valid_edges ... pomanjsana slika (velikosti 0.3a x 0.3b)             
% 
% Avtor: Vitomir �truc
% Datum: 26.4.2012
% Copyright (c) 2012 FE UL

function Small_valid_edges = im_resize(Valid_edges); 

%% Inicializacija izhoda
Small_valid_edges = [];

%% Zacetne operacije
[a,b,c] = size(Valid_edges);

%% Zmanjsamo slikce na faktor 0.3 originala

Small_valid_edges = imresize(Valid_edges, 0.3);