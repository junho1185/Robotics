function [vg_dot, f, n, tau] = forcePropagation(T, w, v_dot, w_dot, m, rg, I_g, g0)
    % init
    f{size(T, 2)} = [0; 0; 0];
    n{size(T, 2)} = [0; 0; 0];

    for i = 1:(size(T, 2)-1)
        vg_dot{i} = v_dot{i} + cross(w_dot{i}, rg{i}) + cross(w{i}, cross(w{i}, rg{i}));
    end

    for i = (size(T, 2)-1):-1:1
        Ri = T{i+1}(1:3, 1:3);
        T0i = calT(T, i);
        Ri0 = transpose(T0i(1:3, 1:3));
        f{i} = simplify(m(i)*vg_dot{i} + Ri*f{i+1} - m(i)*(Ri0 * g0));
        n{i} = simplify((I_g{i}*w_dot{i} + cross(w{i}, I_g{i}*w{i})) + Ri*n{i+1} + (cross(rg{i}, f{i}) - cross(transpose(Ri)*rg{i}, Ri*f{i+1})));

    end

    for i = 1:size(f, 2)
        tau(i, 1) = n{i}(3, 1);
    end
    tau = simplify(tau);
end