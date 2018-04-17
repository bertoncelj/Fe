% Funkcija izvede glejenje z vnaprej dolocenim nizko-propustnim filtrom
% 
% Vhod: 
%       Grey ... vhodna siva slika (velikosti axb)
% 
% Izhod:
%       SmoothGrey ... glajena razlicica vhodne slike (velikosti axb)             
% 
% Avtor: Vitomir Štruc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function SmoothGrey = smooth_grey_image(Grey);

%% Inicializacija izhoda
SmoothGrey = [];

%% Zacetne operacije
[a,b,c] = size(Grey);
SmoothGrey = zeros(a,b);

%% Izgradnja filtra in filtriranje



