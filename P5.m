result = '##p: 5\n##id: wlinn\n##Code attribution: P5 example solution.\n';
% Code attribution: P5 example solution. 

%Q1
fib(1) = 1;
fib(2) = 1;
for g = 3 : 22
    fib(g) = fib(g-1) + fib(g-2);
end
fib
result = [result '##1: ' mat2str(fib) '\n'];

%Q2
lower = ones(29,29)
for k = 3:29
    for v = 2:(k-1)
        lower(k,v) = lower(k-1,v-1) + lower(k-1,v)
    end
end
lower = tril(lower)
result = [result '##2: ' mat2str(lower) '\n'];

%Q3
numTimes = 1;
searchNum = 2;
probLst = [0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125];
output = calProb(numTimes, searchNum, probLst);
result = [result '##3: ' mat2str(output) '\n'];

%Q4
numTimes = 12;
searchNum = 4;
probLst = [0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125];
output = calProb(numTimes, searchNum, probLst);
result = [result '##4: ' mat2str(output) '\n'];

%Q5
numTimes = 1;
searchNum = 9;
probLst = [0.0217 0.0217 0.1522 0.1304 0.0652 0.1087 0.087 0.0217 0.1739 0.2174];
output = calProb(numTimes, searchNum, probLst);
result = [result '##5: ' mat2str(output) '\n'];

%Q6
numTimes = 19;
searchNum = 1;
probLst = [0.0217 0.1522 0.1304 0.0652 0.1087 0.087 0.0217 0.1739 0.2174 0.0217];
output = calProb(numTimes, searchNum, probLst);
result = [result '##6: ' mat2str(output) '\n'];

%Q7
possbilities = ones(1, 59);
check = (mod(1:59, 6) == 0);
possbilities = mod(possbilities + check, 2)
result = [result '##7: ' mat2str(possbilities) '\n'];

%Q8
possbilities = ones(1, 92);
lstNum = [2 4 6 7 8]
for num = lstNum
    check = (mod(1:92, num) == 0);
    possbilities = mod(possbilities + check, 2)
end
possbilities
result = [result '##8: ' mat2str(possbilities) '\n'];

%Q9
possbilities = ones(1, 93);
lstNum = 1:93;
for num = lstNum
    check = (mod(1:93, num) == 0);
    possbilities = mod(possbilities + check, 2)
end
possbilities
result = [result '##9: ' mat2str(possbilities) '\n'];

file = fopen('P5.txt', 'wt');
fprintf(file, result);
fclose(file);

function resultLst = calProb(numTimes, searchNum, probLst) 
    Lst = probLst;
    cdf = cumsum(Lst);
    lst = [];
    counter = 0;
    while counter < numTimes
        percentage = rand();
        x = sum(cdf < percentage) + 1;
        lst = [lst [percentage; x]];
        counter = counter + (x == searchNum);
     resultLst = lst;
    end
end