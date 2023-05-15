function [v_dot, w_dot] = accelerationPropagation(v, w, T)
    syms t1_dot t2_dot t3_dot t4_dot t5_dot t6_dot;
    tdot = [t1_dot, t2_dot, t3_dot, t4_dot, t5_dot, t6_dot];
    syms t1_dotdot t2_dotdot t3_dotdot t4_dotdot t5_dotdot t6_dotdot;
    tdotdot = [t1_dotdot, t2_dotdot, t3_dotdot, t4_dotdot, t5_dotdot, t6_dotdot];
    v_dot{1} = [0; 0; 0];
    w_dot{1} = [0; 0; tdotdot(1)];

    for i = 2:size(T, 2)
        R = transpose(T{i}(1:3, 1:3));
        r = T{i}(1:3, 4);

        w_dot{i} = simplify(R*w{i-1} + ([0; 0; tdotdot(i)] + cross(R*w{i-1}, [0; 0; tdot(i-1)])));
        v_dot{i} = simplify(R*v{i-1} + R*cross(w{i-1}, r) + cross(R*w{i-1}, R*cross(w{i-1}, r)));
    end
end

% WARNING: All joints must be revolutte.