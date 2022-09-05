result = '##p: 3\n##id: wlinn\n##Code attribution: P3 example solution.\n';
% Code attribution: P3 example solution. 

% Q1 
data = '[11, 32, 1, 61, 74, 13, 11, 63, 54, 3, 47, 76, 35, 33, 48, 89, 12]'; 
grades = str2num(data);
numQz = 9;
numHw = 8;
perQz = 0.3;
perHw = 0.7;

qzFrac = repmat(1 / numQz, numQz, 1);
placementQz = zeros(numQz, 1);
avgQz = repmat(perQz / numQz, numQz, 1);
hwFrac = repmat(1 / numHw, numHw, 1);
placementHw = zeros(numHw, 1);
avgHw = repmat(perHw / numHw, numHw, 1);

append = [qzFrac,placementQz,avgQz;placementHw,hwFrac,avgHw];
grades * append
result = [result '##1: ' mat2str(ans) '\n'];

%Q2
totalNumQz = 8;
totalNumHw = 7;
startIdxHw = 10;
endIdxHw = 17;
avgQz = (sum(grades(1:numQz)) - min(grades(1:numQz))) / totalNumQz;
avgHw = (sum(grades(startIdxHw:endIdxHw)) - min(grades(startIdxHw:endIdxHw))) / totalNumHw;
combineAvg = (avgQz*perQz) + (avgHw*perHw);

[avgQz,avgHw,combineAvg]
result = [result '##2: ' mat2str(ans) '\n'];

%Q3
grades = readmatrix('P3Q3.txt');
newPerQz = 0.95;
newPerHw = 0.05;
newAvgQz = repmat(newPerQz / numQz, numQz, 1);
newAvgHw = repmat(newPerHw / numHw, numHw, 1);
newAppend = [qzFrac,placementQz,newAvgQz;placementHw,hwFrac,newAvgHw];

grades * newAppend
result = [result '##3: ' mat2str(ans) '\n'];

%Q4
lowestQzGrades = min(grades(:,1:numQz), [], 2);
lowestHwGrades = min(grades(:,startIdxHw:endIdxHw), [], 2);
newQzResult = (sum(grades(:,1:numQz), 2)-lowestQzGrades)/totalNumQz;
newHwResult = (sum(grades(:,startIdxHw:endIdxHw), 2)-lowestHwGrades)/totalNumHw;
totalAvg = (newPerQz*newQzResult) + (newHwResult*newPerHw);

[newQzResult, newHwResult,totalAvg]
result = [result '##4: ' mat2str(ans) '\n'];

%Q5
data = '[2, 2, 0, 1, 4, 2, 4, 1, 1, 2, 3, 3, 4, 2, 0, 2, 2, 3, 0, 1, 2, 1, 0, 1, 4, 2, 3, 3, 2, 1, 3, 2, 2, 2, 1, 2, 2, 3, 4, 2, 3, 3, 0, 2, 0, 3, 4, 2, 4, 1, 0, 1, 2, 3, 4, 3, 4, 2, 4, 1, 4, 1, 0, 1]';
data_table = str2num(data); 
numCourses = 32;
emptyOnes = ones(numCourses, 1);
credits = data_table(2:2:numCourses*2);
totalCredits = credits*emptyOnes;
everyCredit = data_table(1:2:numCourses*2);
GPA = credits .* everyCredit * emptyOnes / (credits * emptyOnes);

[numCourses,totalCredits,GPA]
result = [result '##5: ' mat2str(ans) '\n'];

%Q6
data = '[F, 3, F, 3, A, 2, C, 3, C, 2, B, 2, F, 1, F, 3, B, 1, A, 1, D, 3, B, 3, D, 3, D, 1, D, 3, B, 3, D, 2, C, 2, F, 3, C, 3, F, 2, B, 2, F, 1, A, 1, C, 2, B, 2, D, 3, B, 2, F, 1, F, 1, A, 3, B, 3, B, 3, D, 1, D, 3, F, 2, B, 1, A, 3, B, 2, C, 2]';
data_table = str2num(replace(data, ["A", "B", "C", "D", "F"],["4", "3", "2", "1", "0"]));
numCourses = 40;
emptyOnes = ones(numCourses, 1);
credits = data_table(2:2:numCourses*2);
totalCredits = credits*emptyOnes;
everyCredit = data_table(1:2:numCourses*2);
GPA = credits .* everyCredit * emptyOnes / (credits * emptyOnes);

[numCourses,totalCredits,GPA]
result = [result '##6: ' mat2str(ans) '\n'];

%Q7
data_table = readmatrix('P3Q7.txt');
numCourses = 35;
emptyOnes = ones(numCourses, 1);
credits = data_table(:,2:2:numCourses*2);
numPplCourses = (credits > 0);
numTotalCourses = numPplCourses*emptyOnes;
totalCredits = credits*emptyOnes;
everyCredit = data_table(:,1:2:numCourses*2);
GPA = credits .* everyCredit * emptyOnes ./ (credits * emptyOnes);

[numTotalCourses,totalCredits,GPA]
result = [result '##7: ' mat2str(ans) '\n'];

%Q8
data = fileread('P3Q8.txt');
data_table = str2num(['[' replace(data, ["\n", "A", "B", "C", "D", "F", "N"],[";", "4", "3", "2", "1", "0", "0"]) ']']);
numCourses = 28;
emptyOnes = ones(numCourses, 1);
credits = data_table(:,2:2:numCourses*2);
numPplCourses = (credits > 0);
numTotalCourses = numPplCourses*emptyOnes;
totalCredits = credits*emptyOnes;
everyCredit = data_table(:,1:2:numCourses*2);
GPA = credits .* everyCredit * emptyOnes ./ (credits * emptyOnes);

[numTotalCourses,totalCredits,GPA]
result = [result '##8: ' mat2str(ans) '\n'];

% Q9
data = fileread('P3Q9.txt');
data_table = str2num(['[' replace(data, ["\n", "A", "B", "C", "D", "F", "N"],[";", "4", "3", "2", "1", "0", "0"]) ']']);
numCourses = 28;
emptyOnes = ones(numCourses, 1);
credits = data_table(:,2:2:numCourses*2);
numPplCourses = (credits > 0);
numTotalCourses = numPplCourses*emptyOnes;
totalCredits = credits*emptyOnes;
everyCredit = data_table(:,1:2:numCourses*2);
GPA = credits .* everyCredit * emptyOnes ./ (credits * emptyOnes);

[numTotalCourses,totalCredits,GPA]
result = [result '##9: ' mat2str(ans) '\n'];

file = fopen('P3.txt', 'wt');
fprintf(file, result);
fclose(file);