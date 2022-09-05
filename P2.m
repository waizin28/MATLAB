result = '##p: 2\n##id: wlinn\n##Code attribution: P2 example solution.\n';
% Code attribution: P2 example solution. 

%Q1
lstYears = [0 1 7 17];
principal = 500;
interest_rate = 0.05;
principal * (1+interest_rate) .^ lstYears
result = [result '##1: ' mat2str(ans) '\n'];

%Q2
principal = [100 300 500 600 700]';
interest_rate = 0.17;
principal * (1+interest_rate) .^ lstYears
result = [result '##2: ' mat2str(ans) '\n'];

%Q3
principal = (100:100:7300)';
interest_rate = 0.17;
principal * (1+interest_rate) .^ lstYears
result = [result '##3: ' mat2str(ans) '\n'];

%Q4
pressure_lst = [1 11 19 32 47];
temp = 61;
gas_constant = 166;
pressure_lst/(gas_constant * 5/9 * (temp+459.67))
result = [result '##4: ' mat2str(ans) '\n'];

%Q5
pressure = 85;
temp_lst = (0:2:100)';
pressure ./ (gas_constant * 5/9 * (temp_lst+459.67))
result = [result '##5: ' mat2str(ans) '\n'];

%Q6
pressure_lst = 0:5:100;
temp_lst = (0:3:99)';
1 ./ (gas_constant * 5/9 * (temp_lst+459.67)) * pressure_lst
result = [result '##6: ' mat2str(ans) '\n'];

%Q7
x = [-4 3 10];
mu = 3;
sigma = 7;
[x; 0.5 * (1+erf((x - mu) / (sigma * sqrt(2))))]
result = [result '##7: ' mat2str(ans) '\n'];

%Q8
x = -32:7:38;
[x; 0.5 * (1+erf((x - mu) / (sigma * sqrt(2))))]
result = [result '##8: ' mat2str(ans) '\n'];

%Q9
x = -11:0.28:17;
[x; 0.5 * (1+erf((x - mu) / (sigma * sqrt(2))))]
result = [result '##9: ' mat2str(ans) '\n'];

file = fopen('P2.txt', 'wt');
fprintf(file, result);
fclose(file);

