syms t1 t2 t3
% Setting numeric data

% Denavit-Hatenberg Table
DH_Table = [
        0 0 0.85 t1;
        0 -pi/2 0 t2;
        1.7 pi/2 0 t3;
        0.45 0 0 0
        ];

% center of gravity vector
rg{1} = [0; 0; -0.472];
rg{2} = [0.85; 0; 0];
rg{3} = [0.1688; 0; 0];

% Inertia Matrix
I_g{1} = [
    9.819 0 0;
    0 9.816 0;
    0 0 0.896
];

I_g{2} = [
    1.775 0 0;
    0 73.596 0;
    0 0 73.595
];

I_g{3} = [
    0.282 0 0;
    0 0.547 0;
    0 0 0.57
];

% mass
m = [183.62, 369.3, 47.967];

% gravity
g0 = [0; 0; -9.8];