% Funkcija popravi binarno masko podrocja koze tako, da zapolni luknje in
% podrocje nekoliko razsiri
% 
% Vhod: 
%       Skin ... binarna slika s prvo oceno maske podrocja koze (velikosti axb)
% 
% Izhod:
%       Skin_corrected ... popravjena binarna maska podrocja koze 
%                          (velikosti axb) brez lukenj; slikovni
%                          elementi, ki ustrezajo barvi koze imajo vrednost 
%                          1, ostali vrednost 0               
% 
% Avtor: Vitomir �truc
% Datum: 25.4.2012
% Copyright (c) 2012 FE UL

function Skin_corrected = clean_skin_mask(Skin);

%% Inicializacija izhoda
Skin_corrected = [];

%% Zacetne operacije
[a,b,c] = size(Skin);
Skin_corrected = zeros(a,b);

%% Popravljanje maske
SE = strel('square', 5);
Skin_corrected = imfill(Skin, 'holes');
Skin_corrected = imdilate(Skin, SE);

