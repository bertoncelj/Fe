# 3. VAJA: KONVOLUCIJSKI INTEGRAL IN ODZIV NA VHODNI SIGNAL

1. Napišite MATLAB programe, ki bodo s pomočjo konvolucijskega integrala (oz. vsote)
   izračunali in narisali časovne odzive na: 
   *  enotino stopnico u(t)
   *  sinusni signal sin(t)

* za paralelni RLC nihajni krog, pri katerem naj bosta odzivna signala tok skozi tuljavo
in napetost na kondenzatorju (R = 3Ω, L = 1H, C = 1F),

![vaja3_1](https://user-images.githubusercontent.com/4838487/32390412-a955b28a-c0ce-11e7-8ca3-78978dfe8836.png)

Solutions:

![tok iL](http://latex.codecogs.com/gif.latex?LC%5Cfrac%7Bd%5E2i_L%28t%29%7D%7Bdt%5E2%7D%20&plus;%20%5Cfrac%7BL%7D%7BR%7D%20%5Cfrac%7Bdi_L%28t%29%7D%7Bdt%7D%20&plus;%20i_L%20%3D%20i_g)


1.g Poseben primer: Če imamo Differencialno enacbo 2 reda in forsing function je 2 reda potem je

![h definicija](http://latex.codecogs.com/gif.latex?h%3Db_%7B2%7D%5Cfrac%7Bd%5E%7B2%7Dh_v%7D%7Bdt%5E%7B2%7D%7D%20&plus;%20b_%7B1%7D%5Cfrac%7Bdh_v%7D%7Bdt%7D%20&plus;%20b_%7B0%7Dh_%7Bv%7D)

1.f.