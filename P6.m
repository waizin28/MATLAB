result = '##p: 6\n##id: wlinn\n##Code attribution: P6 example solution.\n';
% Code attribution: P6 example solution. 

%Q1
char_arr = splitlines(fileread('P6Q1.txt'));
output = checkCharArr(char_arr);
result = [result '##1: ' mat2str(output) '\n'];

%Q2
char_arr = splitlines(fileread('P6Q2.txt'));
output = checkCharArr(char_arr);
result = [result '##2: ' mat2str(output) '\n'];

%Q3
char_arr = splitlines(fileread('P6Q3.txt'));
output = checkCharArr(char_arr);
result = [result '##3: ' mat2str(output) '\n'];

%Q4
char_arr = splitlines(fileread('P6Q4.txt'));
output = checkCharArr(char_arr);
result = [result '##4: ' mat2str(output) '\n'];

%Q5
char_arr = splitlines(fileread('P6Q5.txt'));
output = checkCharArr(char_arr);
result = [result '##5: ' mat2str(output) '\n'];

%Q6
inputChar = '0123456789';
lst = '';
for char = inputChar
    lst = [lst 'u' char 'mI '];
end
result = [result '##6: ' mat2str(lst) '\n'];

%Q7
inputChar = 'JIDMXOYWvyuxmtohb0123456789';
lst = '';
for char = inputChar
    lst = [lst '0Y' char 'v '];
end
result = [result '##7: ' mat2str(lst) '\n'];

%Q8
numLst = '0123456789';
charLst = 'vyuxmtohb';
lst = '';
for char = charLst
    for num = numLst
        lst = [lst char num 'YI '];
        lst = [lst num char 'YI '];
    end
end
result = [result '##8: ' mat2str(lst) '\n'];

%Q9
charLst = 'JIDMXOYWvyuxmtohb';
numLst = '0123456789';
lst = '';
for char = charLst
    for num = numLst
        lst = [lst char 'O' num 'y '];
        lst = [lst num 'O' char 'y '];
    end
end
for num1 = numLst
    for num2 = numLst
        lst = [lst num1 'O' num2 'y '];
    end
end

result = [result '##9: ' mat2str(lst) '\n'];

file = fopen('P6.txt', 'wt');
fprintf(file, result);
fclose(file);


function d = validChar(inputTxt, checkTxt)
    d = 1;
    for char = inputTxt
        check = max(char == checkTxt);
        d = d * check;
    end
end

function output = search(inputChar, checkTxt)
    output = 0;
    for char = checkTxt
        checkInput = max(char == inputChar);
        output = max(output,checkInput);
    end
end

function f = checkCharArr(char_arr)
    checkArr = zeros(1,100);
    maxLengthSize = 4;
    checkTxt = 'JIDMXOYWvyuxmtohb0123456789';
    capitalTxt = 'JIDMXOYW';
    smallTxt = 'vyuxmtohb';
    numbers = '0123456789';
    for x = 1:100
        check = ((length(char_arr{x}) == maxLengthSize) && validChar(char_arr{x},checkTxt) && search(char_arr{x},numbers) && search(char_arr{x},smallTxt) && search(char_arr{x},capitalTxt));
        checkArr(x) = check * 1;
    end
    f = checkArr;
end