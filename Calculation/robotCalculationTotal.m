clear
syms t_dot_1 t_dot_2 t_dot_3 t_dot_4 t_dot_5 t_dot_6;
tdot = [t_dot_1, t_dot_2, t_dot_3, 0, 0 ,0];
syms t_ddot_1 t_ddot_2 t_ddot_3 t_ddot_4 t_ddot_5 t_ddot_6;
tdotdot = [t_ddot_1, t_ddot_2, t_ddot_3, 0, 0, 0];


% Setting data
% dataSetting_numbers;
dataSetting_symbols;

disp("Calculating Forward Kinematics...");
forwardKinematics;

disp("Calculating Jacobian...");
[v, w] = velocityPropagation(T, tdot);
[v_dot, w_dot] = accelerationPropagation(v, w, T, tdot, tdotdot);

disp("Calculation Equation of Motion...");
[vg_dot, f, n, tau] = forcePropagation(T, w, v_dot, w_dot, m, rg, I_g, g0);

disp("Forward Kinematics:");
forwardKinematics;

disp("Linear Velocity");
arrayViewer(v);

disp("Angular Velocity");
arrayViewer(w);

disp("Linear Acceleration");
arrayViewer(v_dot);

disp("Angular Acceleration");
arrayViewer(w_dot);

disp("Linear Acceleration of G");
arrayViewer(vg_dot);

disp("Forces: f");
arrayViewer(f);

disp("Moments: n");
arrayViewer(n);

disp("Tau");
tau = vpa(tau, 5);
tau