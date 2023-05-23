function T = dh_to_T(DH_Table)
    if size(DH_Table, 1) == 0
        disp('not enough size of DH Table')
    else
        index = 1;
        for i = 1:size(DH_Table, 1)
            a = DH_Table(i, 1);
            alpha = DH_Table(i, 2);
            d = DH_Table(i, 3);
            theta = DH_Table(i, 4);
            T{index} = [cos(theta) -sin(theta) 0 a; 
                    sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -sin(alpha)*d;
                    sin(theta)*sin(alpha) cos(theta)*sin(alpha) cos(alpha) cos(alpha)*d;
                    0 0 0 1];
            T{index} = simplify(T{index});
            index = index + 1;
        end
    end
end

% T{n}: A homogenous Transformation Matrix about n from (n - 1)
% example: T{1} is 0 to 1 T