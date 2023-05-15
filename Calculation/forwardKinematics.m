syms L_1 L_2 L_3 t1 t2 t3
DH = [0 0 0 t1;
        L_1 pi/2 0 t2;
        L_2 0 0 t3;
        L_3 0 0 0
        ];
T = dh_to_T(DH);