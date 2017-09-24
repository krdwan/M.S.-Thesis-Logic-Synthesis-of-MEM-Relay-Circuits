function [ resultTable ] = sortTable( truthTable )
%given a truth table, orders the rows in numerical order

resultTable=[truthTable(1,:)];
for i=2:length(truthTable(:,1))
    for j=1:length(resultTable(:,1))
        if rowCompare(resultTable(j,:),truthTable(i,:))
            resultTable=[resultTable(1:(j-1),:);...
                         truthTable(i,:);...
                         resultTable(j:length(resultTable(:,1)),:)];
            break;
        end
        if j==length(resultTable(:,1))
            resultTable=[resultTable; truthTable(i,:)];
        end
    end
end
                         
   
function boolean = rowCompare(matrixrow1,matrixrow2)
% Subfunction: Returns 1 if matrixrow1 is greater
%              Returns 0 otherwise
boolean=0;
for i=1:length(matrixrow1)
    if matrixrow1(1,i)>matrixrow2(1,i)
        boolean=1;
        break;
    elseif matrixrow1(1,i)<matrixrow2(1,i)
        break;
    end
end
