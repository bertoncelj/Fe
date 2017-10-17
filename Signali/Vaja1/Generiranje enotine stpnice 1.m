%Generiranje enotine stopnice

clear all; close all;
tz = -4;            %začetek časovne skale
tk =  4;            %konec časone skale
dt = 0.001;         %časovni inkrementi
t = tz : dt : tk;   % časovni vektro = začetek : inkrement : konec
t01 = 0;
u = zeros(size(t));  %amtrika ničel u(t) = 0 za vse t
u((t01 - tz)/dt+1 : (tk - tz)/dt+1) = ones(size((t01 - tz)/dt+1 : (tk -tz)/dt+1));
%izris
plot(t, u, 'LineWidth', 2);
axis([-4 4 -1 2]); grid;
set(gca, 'FontName', 'Times New Roamn', 'FontSize', 12);
xlabel('čas {\itt} [s]'); ylabel('{\itu}({\itt})');
title('Enotina stopnica');

%Generiranje enotine stopnice 2 nacin
clear all; close all;
dt = 0.001; %časovni inkrement
%defeniranje časovnih območjiin vrednosti singlaov
t1 = -4 : dt : 0; u1 = zeros(size(t1));
t2 =  0 : dt : 4; u2 = ones(size(t2));

t = [t1 t2]; %časovni vektor
u = [u1 u2]; % signalni vektor
%risanje
plot(t, u, 'LineWidth', 2);
set(gca, 'FontName', 'Times NEw Roman', 'FontSize', 12);
axis([-4 4 -1 2]); grid;
xlabel('čas {\itt} [s]'); ylabel('{\itu}({\itt})');
title('Enotina stopnica');

%defeniranje časonvnih območji in vrednosti singnalov
%npr.: za potrebe Fourierove analize
t1 = -4 : dt : -dt; u1 = zeros(size(t1));
t2 = 0;             u2 = 0.5;
t3 = dt : dt : 4;   u3 = ones(size(t3));
t = [t1 t2 t3];   % časovni vektor
u = [u1 u2 u3];   % signalni vektor 