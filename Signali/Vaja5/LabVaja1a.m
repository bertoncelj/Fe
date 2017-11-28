%Fouriesr analiza
clear all; close all;

A = 1;                  % amplituda pulzov
T = 1;               % osnovna perioda
w1 = 2*pi/T;            % osnovna frekvenca
tpz = 0;                % začetek obravnavanega pulza
tpk = tpz + T;          % konec obravnavanega pulza
tz = -1; tk = 2; dt = 0.001;
t = tz : dt : tk;       % časovni vektor
nk = 30;

% definiranje idealnega poteka obravnavanega pulza
t1 = tz : dt : tz+T; xp1   = A / T *(t1 + T);
t2 = tz+T : dt : tz+2*T; xp2   = A / T * t2;
t3 = tz+2*T : dt : tz+3*T; xp3 = A / T * (t3 - T);

#funckcije
t_id_sign = [t1 t2 t3];  x_id_sig = [xp1 xp2 xp3];

#
a0 = A / 2;
a0t = ones(size(t))*a0;

for n= 1 : 1 :nk;
an = 0;
bn = -A/(n*pi);
  ancos=an*cos(n*w1*t); bnsin = bn * sin(n*w1*t);
  [N,M] = size(ancos);
  if N < M,
        ancos = ancos'; bnsin = bnsin';
   end
  xn(:,n) = ancos + bnsin;
  if n == 1
      xp(:,n) = a0 + xn(:,n);
     else
    xp(:,n) = xp(:,n-1) + xn(:,n); 
  end
  
%koificjenti cosinusove vrste
cn(n) = sqrt(an^2 + bn^2);
fin(n) = -atan(bn/an);
  if(an<0) && (bn<0)
    fin(n) = fin(n) + pi;
   elseif(an<0) && (bn>0)
   fin(n) = fin(n) -pi;
   end
end


fig1 = figure(1);
set(fig1, 'Units', 'centimeters', 'Position', [5 1.5 20 15]);
subplot(2,1,1)
plot(t,a0t,'k', t,xn(:,1),'b'); legend('a0','x_1');
axis([tz tk -0.4 0.6])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('čas t [s]'); ylabel('a0, x_n(t)');
title('Enosmerna in harmonske komponente Fourierove vrste'); grid on;

hold on
subplot(2,1,2)
plot(t_id_sign,x_id_sig,'r',t,xp(:,1),'b')
axis([tz tk -0.2 A+0.2])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('čas t [s]'); ylabel('x(t)');
title('Aproks. pulzov z naraščajočim št. harmonskih komponent'); grid on;
hold on; 
#-------------------------
subplot(2,1,1)
plot(t, xn(:,3),'g'); legend('a0','x_1','x_3');
subplot(2,1,2)
plot(t, xp(:,3),'g'); hold on;
#-------------------------
subplot(2,1,1)
plot(t, xn(:,5),'m'); legend('a0','x_1','x_3','x_5');
subplot(2,1,2)
plot(t, xp(:,5),'m'); hold on;
subplot(2,1,1)
plot(t, xn(:,27),'c'); legend('a0','x_1','x_3','x_5','x_2_7');
subplot(2,1,2)
plot(t, xp(:,27),'c'); hold on; pause(1);

w = [0 : nk] * w1; % izračun frekvenc komponent spektra

fig2 = figure(2);
set(fig2, 'Units', 'centimeters', 'Position', [5 1.5 20 15]);
subplot(2,1,1)
stem(w, [a0 cn], 'ko', 'MarkerFaceColor', 'r')
axis([0 nk*w1 -0.1 0.4])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('frekvenca w [rad/s]'); ylabel('abs(c_n)');
title('Amplitudni spekter periodičnih pravokotnih pulzov'); grid on;

subplot(2,1,2)
stem(w, [0 fin], 'ko', 'MarkerFaceColor', 'r')
axis([0 nk*w1 -pi pi])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('frekvenca w [rad/s]'); ylabel('fi(w) [rad]');
title('Fazni spekter periodičnih pravokotnih pulzov'); grid on;
pause(1)

An = cn/2;
Anamp = [fliplr(An) a0 An];
Afin = [-fliplr(fin) 0 fin];
wsim = [-nk:nk]*w1;
fig3 = figure(3);
set(fig3, 'Units', 'centimeters', 'Position', [5 1.5 20 15]);
subplot(2,1,1)
stem(wsim, Anamp, 'ko', 'MarkerFaceColor', 'g')
axis([-nk*w1 nk*w1 -0.1 0.2])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('frekvenca w [rad/s]'); ylabel('abs(A_n)');
title('Amplitudni spekter periodičnih pravokotnih pulzov'); grid on;

subplot(2,1,2)
stem(wsim, Afin, 'ko', 'MarkerFaceColor', 'g')
axis([-nk*w1 nk*w1 -pi pi])
set(gca, 'FontName', 'Times New Roman CE', 'FontSize', 10);
xlabel('frekvenca w [rad/s]'); ylabel('fi(w) [rad]');
title('Fazni spekter periodičnih pravokotnih pulzov'); grid on; 
   



