function finT = calT(T, cap)
    finT = T{1};
    for i = 2:cap
        finT = simplify(finT * T{i});
    end
end