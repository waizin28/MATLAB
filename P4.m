result = '##p: 4\n##id: wlinn\n##Code attribution: P4 example solution.\n';
% Code attribution: P4 example solution. 

%Q1 and Q2
info = readmatrix('P4Q1.txt');
x = info(1,:);
y = info(2,:);
range = 0:0.01:1;
n = 18;
p = polyfit(x, y, n);
curve = [range; polyval(p, range)];
plot(x, y, 'x', curve(1,:), curve(2,:))
snapnow
result = [result '##1: ' mat2str(p) '\n'];
result = [result '##2: ' mat2str(curve) '\n'];

%Q3 and Q4
info = readmatrix('P4Q3.txt');
x = info(1,:);
y = info(2,:);
range = 0:0.01:1;
s = spline(x,y);
p = s.coefs;
curve = [range; spline(x,y,range)];
plot(x, y, 'x', curve(1,:), curve(2,:))
snapnow
result = [result '##3: ' mat2str(p) '\n'];
result = [result '##4: ' mat2str(curve) '\n'];

%Q5 and Q6
info = readmatrix('P4Q5.txt');
x = info(1,:);
y = info(2,:);
range = 0:0.01:1;
n = 9;
p = polyfit(x, y, n);
curve = [range; polyval(p, range)];
plot(x, y, 'x', curve(1,:), curve(2,:))
snapnow
result = [result '##5: ' mat2str(p) '\n'];
result = [result '##6: ' mat2str(curve) '\n'];

%Q7
n = 3;
m = 3;
Ti = -13;
To = -1;
matrix = createMatrix(n,m);
firstVal = Ti/n;
lastVal = To/n;
emptyVal = zeros(n*m-2,1);
divisor = [firstVal;emptyVal;lastVal];
calMatrix = matrix\divisor;
reshape(calMatrix,n,m)
result = [result '##7: ' mat2str(ans) '\n'];

%Q8
n = 5;
m = 5;
Ti = 14;
To = -19;
matrix = createMatrix(n,m);
firstVal = Ti/3;
lastVal = To/3;
emptyVal = zeros(n*m-2,1);
divisor = [firstVal;emptyVal;lastVal];
calMatrix = matrix\divisor;
reshape(calMatrix,[n,m])
result = [result '##8: ' mat2str(ans) '\n'];

%Q9
n = 17;
m = 17;
Ti = 15;
To = -1;
matrix = createMatrix(n,m);
firstVal = Ti * 1/3;
lastVal = To * 1/3;
emptyVal = zeros(n*m-2,1);
divisor = [firstVal;emptyVal;lastVal];
calMatrix = matrix\divisor;
reshape(calMatrix,[n,m])
result = [result '##9: ' mat2str(ans) '\n'];

file = fopen('P4.txt', 'wt');
fprintf(file, result);
fclose(file);

function coef = createMatrix(n, m) 
    [x, y] = meshgrid(1:(n * m), 1:(n * m));
    coef = abs(mod(x - 1, m) - mod(y - 1, m)) + abs(floor((x - 1) / n) - floor((y - 1) / n)) == 1;
    coef = -coef ./ (sum(coef, 2) + [1; zeros(n * m - 2, 1); 1]);
    coef = coef + diag(ones(1, n * m));
end