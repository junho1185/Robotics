function LaTexStr = latexTranslator(matrix)
    LaTexStr = string(latex(matrix));

    % First replacement: Replace the first '(' with '['
    LaTexStr = regexprep(LaTexStr, '(', '[', 'once');
    
    % Second replacement: Replace the last ')' with ']'
    LaTexStr = regexprep(LaTexStr, '\)$', ']');

    % Remove "{cccccc}"
    LaTexStr = strrep(LaTexStr, '{c}', '');
    LaTexStr = strrep(LaTexStr, '{cc}', '');
    LaTexStr = strrep(LaTexStr, '{ccc}', '');
    LaTexStr = strrep(LaTexStr, '{cccc}', '');
    LaTexStr = strrep(LaTexStr, '{ccccc}', '');
    LaTexStr = strrep(LaTexStr, '{cccccc}', '');

    % Replace "{array}" with "{matrix}"
    LaTexStr = strrep(LaTexStr, '{array}', '{matrix}');

    % Replace cos, sin to c, s
    LaTexStr = strrep(LaTexStr, '\left', '');
    LaTexStr = strrep(LaTexStr, '\right', '');

    LaTexStr = strrep(LaTexStr, '\sin', 's');
    LaTexStr = strrep(LaTexStr, '\cos', 'c');

    % Replace t1 + t2 to 12
    LaTexStr = strrep(LaTexStr, '(t_{1})', '_{1}');
    LaTexStr = strrep(LaTexStr, '(t_{2})', '_{2}');
    LaTexStr = strrep(LaTexStr, '(t_{3})', '_{3}');

    LaTexStr = strrep(LaTexStr, '(t_{1}+t_{2})', '_{12}');
    LaTexStr = strrep(LaTexStr, '(t_{1}+t_{3})', '_{13}');
    LaTexStr = strrep(LaTexStr, '(t_{2}+t_{3})', '_{23}');

    LaTexStr = strrep(LaTexStr, '(t_{1}+t_{2}+t_{3})', '_{123}');

    LaTexStr = strrep(LaTexStr, 't_', '\theta_');

    LaTexStr = strrep(LaTexStr, '{t}', '{\theta}');

    % Processing ending
    LaTexStr = strrep(LaTexStr, '\end', '\\ \end');

    clipboard('copy', LaTexStr);

end