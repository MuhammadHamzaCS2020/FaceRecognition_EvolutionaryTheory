        % Muhammad Hamza 1602028
        % Mahad Asif     1602009
clc, clear
SIZE=999;
[boothi,groupImage]=loadImages(); % Load images from same directory
[rand1,rand2]=genRandoms();       % Generate the Random No
population = [rand1, rand2];      % Create a Population Matrix
fprintf('size of population is : %d', size(population));    % print the SIZE of population

[boothirow,boothicol]=size(boothi); % get the row and col size of boothi/input image.
fitness=[];                       % create fitness Matrix

    % This loop Match first time small image with groupimage on randomlly generated 999 different points
for i=1:SIZE
                % This condition tell the limit of group image e.g group
                % iamge pixel size is 512*1024
    if ((population(i,1)<=476)&&(population(i,2)<=994))
        SubMatrix = groupImage(population(i,1):population(i,1)+boothirow-1,population(i,2):population(i,2)+boothicol-1);
        fitness(i)=corr2(boothi,SubMatrix); % Store the First 1 thousands fitness points
    end
end
[Values, XIndex] = sort(fitness,'descend'); % Sorting of fitness array in descending order
YIndex=XIndex;                              % XIndex copy from x to y
YIndex;
n=1;

Highest = [];    % This matrix will store the top thousands that will match from input image
% This while loop run SIZE time
while(n<SIZE)
                % Below for loop work exactlly same like above form loop
                % and calculate the fitness in every iteration
    for i=1:SIZE
        if ((population(XIndex(i),1)<=477)&&(population(YIndex(i),2)<=995))
            SubMatrix = groupImage(population(XIndex(i),1):population(XIndex(i),1)+boothirow-1,population(YIndex(i),2):population(YIndex(i),2)+boothicol-1);
            fitness(i)=corr2(boothi,SubMatrix);
        end
    end
    [Values, XIndex] = sort(fitness,'descend'); % Sorting of fitness array in descending order
    [Values, YIndex] = sort(fitness,'descend');
                % This for loop swap the Indexes values. Increament with 2
    for j=1:2:(SIZE-1)
        [XIndex(j+1), XIndex(j)] = deal(XIndex(j), XIndex(j+1));
    end
        % Highest Array stored only one value from top in every iteration
    Highest(n) = Values(1)
    n=n+1;
end
        % This line sort the highest Values array just we need first index
        % value after sorting
[V, I] = sort(Highest, 'descend');
V(1)            % Print/show highest accuracy...
