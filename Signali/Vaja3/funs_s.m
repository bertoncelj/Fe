

a2 = 10;
a1 = 1;
a0 = 1;

printf("a2*s^2 + a1*s + a0 == 0 \n");
printf("s^2 + a1/a2 * s + a0/a2 == 0 \n");
printf("s^2 + 2σ*s + ωn^2 == 0 \n");
printf("s^2 + 2ζωn*s + ωn^2 == 0 \n");
printf("s^2 + ωn/Q *s + ωn^2 == 0 \n");
printf("(s - s1)(s - s2) == 0 \n");


wn = sqrt(a0/a2)      % ωn
sigma = 0.5 * (a1/a2) % σ
zeta = sigma / wn     % ζ
Q = 1/(2*zeta)            % Q
wd = wn*sqrt(1 - zeta^2)

 
s1 = -(a1/(2*a2) + sqrt((a1/(2*a2))^2 - (a0/a2)))
s2 = -(a1/(2*a2) - sqrt((a1/(2*a2))^2 - (a0/a2)))

if (sigma > wn)
  printf("Dobimo dve neodvisni rešitivi in komplementarna funkcija je: \n");
  printf("y(t) = C1*e^(s1*t) + C2*e^(s2*t) \n");
elseif (Q > 0.5)
  printf("Dobimo korena konjugiran par kompleksnih stevil:\n")
  printf("e^(-σ*t) * (A*cos(ωd*t) + B*sin(ωd*t)) \n")
  printf("\t s1 = -σ + jωd \t s1 = -%d + j%d \n", sigma, wd);
  printf("\t s2 = -σ - jωd \t s1 = -%d - j%d \n", sigma, wd);
elseif(zeta == 1)
  printf("korena sta enka!\n");
endif