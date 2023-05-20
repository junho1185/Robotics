function [v_dot, w_dot] = accelerationPropagation(v, w, T)

    syms t_dot_1 t_dot_2 t_dot_3 t_dot_4 t_dot_5 t_dot_6;
    tdot = [t_dot_1, t_dot_2, t_dot_3, t_dot_4, t_dot_5, t_dot_6];
    syms t_ddot_1 t_ddot_2 t_ddot_3 t_ddot_4 t_ddot_5 t_ddot_6;
    tdotdot = [t_ddot_1, t_ddot_2, t_ddot_3, t_ddot_4, t_ddot_5, t_ddot_6];
    
    v_dot{1} = [0; 0; 0];
    w_dot{1} = [0; 0; tdotdot(1)];

    for i = 2:size(T, 2)
        R = transpose(T{i}(1:3, 1:3));
        r = T{i}(1:3, 4);

        w_dot{i} = simplify(R*w{i-1} + ([0; 0; tdotdot(i)] + cross(R*w{i-1}, [0; 0; tdot(i-1)])));
        v_dot{i} = simplify(R*v_dot{i-1} + R*cross(w_dot{i-1}, r) + cross(R*w{i-1}, R*cross(w{i-1}, r)));
    end
end

% WARNING: All joints must be revolutte.