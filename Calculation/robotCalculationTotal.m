clear

syms L1 L2 L3 t1 t2 t3;
syms t_dot_1 t_dot_2 t_dot_3 t_dot_4 t_dot_5 t_dot_6;
tdot = [t_dot_1, t_dot_2, t_dot_3, t_dot_4, t_dot_5, t_dot_6];
syms t_ddot_1 t_ddot_2 t_ddot_3 t_ddot_4 t_ddot_5 t_ddot_6;
tdotdot = [t_ddot_1, t_ddot_2, t_ddot_3, t_ddot_4, t_ddot_5, t_ddot_6];
syms l_g_1x l_g_1y l_g_1z l_g_2x l_g_2y l_g_2z l_g_3x l_g_3y l_g_3z;
syms I_G_1zz I_G_2zz I_G_3zz;
syms m1 m2 m3;
syms g

% Setting data

% Denavit-Hatenberg Table
DH = [
        0 0 0 t1;
        L1 0 0 t2;
        L2 0 0 0
        ];

% center of gravity vector
rg{1} = [l_g_1x; 0; 0];
rg{2} = [l_g_2x; 0; 0];
rg{3} = [0.162; 0; 0];

% Inertia Matrix
I_g{1} = [
    0 0 0;
    0 0 0;
    0 0 I_G_1zz
];

I_g{2} = [
    0 0 0;
    0 0 0;
    0 0 I_G_2zz
];

I_g{3} = [
    0.006 0 0;
    0 0.088 0;
    0 0 0.092
];

% mass
m = [m1, m2, m3];

% gravity
g0 = [0; -g; 0];

disp("Calculating Forward Kinematics...");
forwardKinematics;

disp("Calculating Jacobian...");
[v, w] = velocityPropagation(T, tdot);
[v_dot, w_dot] = accelerationPropagation(v, w, T, tdot, tdotdot);

disp("Calculation Equation of Motion...");
[vg_dot, f, n, tau] = forcePropagation(T, w, v_dot, w_dot, m, rg, I_g, g0);

disp("Forward Kinematics:");
finT

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
% tau = vpa(tau, 5);
tau
