syms L1 L2 L3 t1 t2 t3;
syms L_G1x L_G1y L_G1z L_G2x L_G2y L_G2z L_G3x L_G3y L_G3z;
syms I_G1_x I_G1_y I_G1_z I_G2_x I_G2_y I_G2_z I_G3_x I_G3_y I_G3_z;
syms m1 m2 m3;
syms g

% Setting data

% Denavit-Hatenberg Table
DH_Table = [
        0 0 L1 t1;
        0 -pi/2 0 t2;
        L2 pi/2 0 t3;
        L3 0 0 0
        ];

% center of gravity vector
rg{1} = [L_G1x; L_G1y; L_G1z];
rg{2} = [L_G2x; L_G2y; L_G2z];
rg{3} = [L_G3x; L_G3y; L_G3z];

% Inertia Matrix
I_g{1} = [
    I_G1_x 0 0;
    0 I_G1_y 0;
    0 0 I_G1_z
];

I_g{2} = [
    I_G2_x 0 0;
    0 I_G2_y 0;
    0 0 I_G2_z
];

I_g{3} = [
    I_G3_x 0 0;
    0 I_G3_y 0;
    0 0 I_G3_z
];

% mass
m = [m1, m2, m3];

% gravity
g0 = [0; 0; -g];