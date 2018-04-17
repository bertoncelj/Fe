% Funkcija prikaze logaritem amplitudnega spektra slike X. ?e je X barvna
% slika, prikaze spekter sive slike X1 = mean(X,3);
% 
% Avtor: Vitomir Štruc
% Datum: 12.4.2012
% Copyright (c) 2012 FE UL

function show_log_mag_spectrum(X)

[a,b,c] = size(X);

if c==1
    %to je siva slika    
elseif c==3
    %to je barvna slika - pretvorimo v sivo
    X=mean(X,3);
else 
    error('show_log_mag_spectrum:wrgInput','Vhod ni ne barvna, ne siva slika');
end

% figure,
imshow(log(abs(fftshift(fft2(X)))),[])
title('Logaritem amplitudnega spektra slike')
