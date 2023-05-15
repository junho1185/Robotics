function finT = ultimateT(T)
    finT = T{1};
    for i = 2:size(T, 2)
        finT = simplify(finT * T{i});
    end
end