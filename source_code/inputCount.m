function [outputCell]=inputCount(inputCell,ftree)
    for i=1:size(ftree.inputs,2)
        input=ftree.inputs{i};
        counted=0;
        for j=1:length(inputCell)
            if (isequal(input,inputCell{j}.net))
                inputCell{j}.count=inputCell{j}.count+1;
                counted=1;
                break;
            end
        end
        if (counted==0) %base case
            newIndex=length(inputCell)+1;
            inputCell{newIndex}.net=input;
            inputCell{newIndex}.count=1;
        end
    end
    outputCell=inputCell;
end

% takes in an inputCounter cell and a ftree
% in the inputCounter cell, adds to the total count
% each instance of each input from the ftree