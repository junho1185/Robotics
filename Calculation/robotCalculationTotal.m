syms L1 L2 L3 t1 t2 t3;
syms l_g_1 l_g_2 I_G_1zz I_G_2zz;
syms m1 m2;

% Setting data
DH = [
            0 0 L1 t1;
            0 pi/2 0 t2;
            L2 0 0 t3;
            L3 0 0 0
        ];

rg{1} = [l_g_1; 0; 0];
rg{2} = [l_g_2; 0; 0];

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

m = [m1, m2];

disp("Calculating Forward Kinematics...");
forwardKinematics;

disp("Calculating Jacobian...");
[v, w] = velocityPropagation(T);
[v_dot, w_dot] = accelerationPropagation(v, w, T);

disp("Calculation Equation of Motion");
%[vg_dot, f, n, tau] = forcePropagation(T, w, v_dot, w_dot, m, rg, I_g);