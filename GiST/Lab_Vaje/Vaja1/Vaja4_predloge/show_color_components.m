% Funkcija prikaze vse barvne komponente slike v razlicnih slikah in ne
% vrne nicesar
% 
% Avtor: Vitomir Štruc
% Datum: 12.4.2012
% Copyright (c) 2012 FE UL

function show_color_components(X)

[a,b,c] = size(X);

if c~=3
    error('show_color_components:wrgInput','Vhodna slika ne vsebuje 3 barvnih komponent');
end

subplot(2,3,4)
imshow(X(:,:,1),[])
title('R komponenta')

subplot(2,3,5)
imshow(X(:,:,2),[])
title('G komponenta')

subplot(2,3,6)
imshow(X(:,:,3),[])
title('B komponenta')

