t = (0 : 0.1 : 10).';
u = ones(size(t));

sys = ss([0, 1; 2, -3], [0;  1], [1, 0; 0, 1], [0; 0]);

y_imp = impulse(sys, t(end));
[y_sim, t_sim] = lsim(sys, u, t, [-0.8; 1].');

fprintf('Final value of impulse = (%f/%f)\n', y_imp(end, 1), y_imp(end, 2));
fprintf('Final value of simulation = (%f/%f)\n', y_sim(end, 1), y_sim(end, 2));

plot(t_sim, y_sim);