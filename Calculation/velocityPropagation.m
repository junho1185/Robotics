function [v, w] = velocityPropagation(T)
    index = 1;
    syms t1_dot t2_dot t3_dot t4_dot t5_dot t6_dot;
    tdot = [t1_dot, t2_dot, t3_dot, t4_dot, t5_dot, t6_dot];
    w{index} = [0; 0; tdot(index)];
    v{index} = [0; 0; 0];

    for i = 2:size(T, 2)
        R = transpose(T{i}(1:3, 1:3));
        r = T{i}(1:3, 4);
        w{i} = simplify(R*w{i-1} + [0;0; tdot(i)]);
        v{i} = simplify(R*(v{i-1} + cross(w{i-1},r)));
    end
end

% WARNING: All joints must be revolutte.