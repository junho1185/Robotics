function [v_dot, w_dot] = accelerationPropagation(v, w, T, tdot, tdotdot) 
    v_dot{1} = [0; 0; 0];
    w_dot{1} = [0; 0; tdotdot(1)];

    for i = 2:size(T, 2)
        R = transpose(T{i}(1:3, 1:3));
        r = T{i}(1:3, 4);

        w_dot{i} = simplify(R*w_dot{i-1} + ([0; 0; tdotdot(i)] + cross(R*w{i-1}, [0; 0; tdot(i)])));
        v_dot{i} = simplify(R*v_dot{i-1} + R*cross(w_dot{i-1}, r) + R*cross(w{i-1}, R*cross(w{i-1}, r)));
    end
end

% WARNING: All joints must be revolutte.