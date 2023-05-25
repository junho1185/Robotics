% Input string with float numbers
input_string = 'The numbers are 3.14 and 2.718';

% Regular expression pattern to match float numbers
pattern = '[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?';

% Find all float numbers in the input string
numbers = regexp(input_string, pattern, 'match');

% Round up each float number to the nearest whole number (0.xxx)
for i = 1:numel(numbers)
    number = str2double(numbers{i});
    rounded_number = num2str(round(number, 0.001));
    input_string = strrep(input_string, numbers{i}, rounded_number);
end

% Display the updated string with rounded up numbers
disp(input_string);
