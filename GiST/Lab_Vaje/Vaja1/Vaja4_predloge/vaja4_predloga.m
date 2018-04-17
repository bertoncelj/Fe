%% Krovna skripta za Vajo 4 pri predmetu GST - LOKALIZACIJA OBRAZA
% 
% Skripta vsebuje vse potrebne funkcijske klice za izvedbo postopka 
% lokalizacije obraza na sliki. Studentje implementrijao funkcionalnost 
% funkcij na oznacenih mestih. Po vsakem koraku si ogledajo tudi 
% rezultat procesiranja.  
% 
% Skripto pripravil: Vitomir Štruc
% Datum:             12.4.2012
% Copyright (c) 2012 FE UL

%% Inicializacija
clear all
verbose      = 1;               % 1 - vklopi/ 0 - izklopi osnovno tekstovno porocanje  
verbose_im   = 1;               % 1 - vklopi/ 0 - izklopi prikazovanje rezultatov (slik)

ime_slikce = 'slikce/slika4.bmp';      % ime slikce, ki jo bomo obdelali

%% Izvedba

%% Porocanje
if(verbose)
    disp('Nalagam slikco.');
end

%% Nalaganje slike
X = imread(ime_slikce);             % nalozimo slikco

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(2,3,1)
    imshow(X,[]);
    title('Vhodna RGB slika')
    show_color_components(X) 
    subplot(2,3,2)
    show_histogram(X)
    subplot(2,3,3)
    show_log_mag_spectrum(X)
    subplot(2,3,4)
    imshow(X(:,:,1),[])
    title('R komponenta')

    subplot(2,3,5)
    imshow(X(:,:,2),[])
    title('G komponenta')

    subplot(2,3,6)
    imshow(X(:,:,3),[])
    title('B komponenta')
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Iscem podrocje koze z barvnim filtrom.');
end

%% Barvno filtriranje podro?ja koze
Skin = skin_color_filter_RGB(X);            % IMPLEMENTIRAJ

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,3,1)
    imshow(Skin,[]);
    title('Binarna maska podrocja koze') 
    subplot(1,3,2)
    show_histogram(Skin)
    subplot(1,3,3)
    show_log_mag_spectrum(Skin) 
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Popravljam binarno podrocje koze z morfoloskimi operacijami.');
end


%% Morfološka obdelava binarne maske koze
Skin_corrected = clean_skin_mask(Skin);     % IMPLEMENTIRAJ

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    imshow(Skin_corrected,[]);
    title('Popravljena binarna maska podrocja koze.')
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Pretvarjam vhodno barvno sliko v sivo sliko.');
end


%% Pretvorba v sivo sliko
Grey = rgbimage2greyimage(X);               % IMPLEMENTIRAJ

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,3,1)
    imshow(Grey,[]);
    title('Siva razlicica vhodne slike')
    subplot(1,3,2)
    show_histogram(Grey)
    subplot(1,3,3)
    show_log_mag_spectrum(Grey) 
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Gladim sivo vhodno sliko.');
end

%% Glajenje za boljso detekcijo robov
SmoothGrey = smooth_grey_image(Grey);       % IMPLEMENTIRAJ

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,3,1)
    imshow(SmoothGrey,[]);
    title('Glajena razlicica vhodne slike')
    subplot(1,3,2)
    show_histogram(SmoothGrey)
    subplot(1,3,3)
    show_log_mag_spectrum(SmoothGrey) 
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Iscem robove slike s Sobelovim operatorjem.');
end

%% Iskanje robov
Edges = gradient_approximation(SmoothGrey); % IMPLEMENTIRAJ

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,3,1)
    imshow(Edges,[]);
    title('Slika robov')
    subplot(1,3,2)
    show_histogram(Edges)
    subplot(1,3,3)
    show_log_mag_spectrum(Edges) 
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Upragovljam robove slike.');
end


%% Upragovljanje
Binary_edges = threshold_image(Edges, 40);      % IMPLEMENTIRAJ

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,3,1)
    imshow(Binary_edges,[]);
    title('Slika robov')
    subplot(1,3,2)
    show_histogram(Binary_edges)
    subplot(1,3,3)
    show_log_mag_spectrum(Binary_edges) 
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Maskiram nepotrebne robove.');
end


%% Mnozenje z masko
Valid_edges = mask_edges(Binary_edges, Skin_corrected);   % IMPLEMENTIRAJ

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    imshow(Valid_edges,[]);
    title('Relevantni robovi slike')
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Izvedem zmanjsanje slike na faktor 0.3.')
end

%% Zmanjšanje slike
Small_valid_edges = im_resize(Valid_edges);     % IMPLEMENTIRAJ
%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    imshow(Small_valid_edges,[]);
    title('Relevatni robovi pomanjsane slike')
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Izvajam elipticno Hough-ovo transformacijo.');
end


%% Hough-ova elipticna transformacija
bestMatch = ellipseDetection(Small_valid_edges'>0);

%% Porocanje
if(verbose_im)
    figure('units','normalized','outerposition',[0 0 1 1]);
    imshow(Small_valid_edges,[])
    h=ellipse(bestMatch(:,4),bestMatch(:,3),zeros(1,1),bestMatch(:,2),bestMatch(:,1),'r');
    title('Detektiran obraz na sliki robov')
end
if(verbose)
    disp('Pritisni poljubno tipko za nadaljevanje.')
    pause
    close all
    disp('Vnasam okvircek detektiranega obraza.');
end

%% Izris rezultata na vhodno sliko
imshow(X,[])
h=ellipse((3.33*bestMatch(:,4)),(3.33*bestMatch(:,3)),zeros(1,1),(3.33*bestMatch(:,2)),(3.33*bestMatch(:,1)),'r')
title('Detektiran obraz')

%% Porocanje
if(verbose)
    disp('Postopek je zakljucen.');
end















