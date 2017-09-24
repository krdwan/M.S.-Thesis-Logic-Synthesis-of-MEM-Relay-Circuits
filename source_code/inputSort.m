function [outputCell]=inputSort(inputCell)
    outputCell=cell(1,length(inputCell));
    
    for j=1:length(inputCell)
        lowest=[];
        chosenOne=0;
        for k=1:length(inputCell)
            if ~(isempty(inputCell{k}))
                if (isempty(lowest))
                    lowest=inputCell{k};
                    chosenOne=k;
                else
                    if (lowest.count>inputCell{k}.count)
                        lowest=inputCell{k};
                        chosenOne=k;
                    end
                end
            end
        end
        inputCell{chosenOne}=[];
        outputCell{j}=lowest;
    end
    
end