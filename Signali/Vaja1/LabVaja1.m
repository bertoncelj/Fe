% 1 Lab Vaja
clear all; close all;

%1.A) Enotina stopnica od -1 do 3, Amp = 2
  dt = 0.01;    %casovni inkremnt
  A = 2;
  t1 = -5 : dt : -1; u1 = zeros(size(t1));
  t2 = -1 : dt : 3;  u2 = A * ones(size(t2));
  t3 =  3 : dt : 4;  u3 = zeros(size(t3));
t = [t1 t2 t3];
u = [u1 u2 u3];

% 1.A Drawing 
plot(t, u, 'LineWidth', 2);
set(gca, 'FontName', 'Times NEw Roman', 'FontSize', 12);
axis([-5 4 -1 4]); grid;
xlabel('čas {\itt} [s]'); ylabel('{\itu}({\itt})');
title('1.A) Enotina stopnica od -1 do 3, Amp = 2');




























%1.B Signal trikotne oblike s casom 5s, start t = 2s in vrh B = 6 v casu t =6s
%clear all; close all;
%
%dt = 0.001;  %časovni inkrement
% 
%%definiranje časovnih območji in vrednosti signalov
%
%tz = -4;            %začetek časovne skale
%tk =  4;            %konec časone skale
%       
%t = tz : dt : tk;   % časovni vektor = začetek : inkrement : konec
%t01 = 2;            %cas preklopa signala za 0 do 1
%u = zeros(size(t)); %amtrika ničel u(t) = 0 za vse t
%u((t01 - tz)/dt+1 : (tk - tz)/dt+1) = ones(size((t01 - tz)/dt+1 : (tk -tz)/dt+1));
%
%%1.B Drawing 
%plot(t, u, 'LineWidth', 2);
%axis([-8 8 -1 2]); grid;
%set(gca, 'FontName', 'Times New Roamn', 'FontSize', 12);
%xlabel('čas {\itt} [s]'); ylabel('{\itu}({\itt})');
%title('Enotina stopnica');

% 1.C) Cos signal z amp = 2,5 periodo T = 2, fazni phi = Pi/3
%clear all; close all;
%
%tz = -0.5; tk = 4; dt = 0.025; % podatki o casovni skali, casovni inkrement
%t = tz : dt: tk;
%A = 2.5;  T = 2.0;  phi = pi/3;    %podaki o signalu
%f1 = A * cos(2*pi/T*t + phi);   %signal


%Izris slike

%plot(t, f1, 'r', 'LineWidth', 1.5);
%axis([tz tk -6 6]);
%set(gca, 'FontName', 'Times New Roman', 'FontSite', 12);
%grid;
%xlabel('cas {\itt} [s]');
%ylabel('f(t) = A*cos(wt + phi)');
%title('Duseni sinusni signal');

% 1.D) Eksponento upadajoci Cos in tau = 2s
%clear all; close all;
%
%tz = -0.5; tk = 4; dt = 0.025; % podatki o casovni skali, casovni inkrement
%t = tz : dt: tk;
%A = 2.5;  T = 2.0; T1 = 2; phi = pi/3;    %podaki o signalu
%f1 = A * cos(2*pi/T*t + phi).*exp(-t/T1);   %signal
%f2 = A * exp(-t/T1); f3 = -A * exp(-t/T1);  %ovojnica signala
%
%%Izris slike
%plot(t, f1, 'k', t, f2, 'g', t, f3, 'g', 'LineWidth', 1.5);
%axis([tz tk -6 6]);
%set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
%grid;
%xlabel('cas {\itt} [s]');
%ylabel('f(t) = A*cos(wt + phi)*exp(-t/T1)');
%title('Duseni sinusni signal');
%
%%1.E) 
%clear all; 
%close all;
%
%a = 0.92;
%tz = -0.5; tk = 4; dt = 0.025; % podatki o casovni skali, casovni inkrement
%t = tz : dt: tk;
%
%fa = a.^(t);
%
%%Izris: 
%plot(t, fa, 'r');
%xlabel('cas {\itt} [s]');
%ylabel('f(n) = a^n');
%title('Duseni sinusni signal');
