function [ftree]=ftreeInputFix(ftree,inputCounter)

    matrix=zeros(1,length(ftree.inputs));
    mi=1;
    for i=1:length(inputCounter)
        for j=1:length(ftree.inputs)
            if(isequal(inputCounter{i}.net,ftree.inputs{j}))
                matrix(mi)=j;
                mi=mi+1;
                break;
            end
        end
    end

    ftree=reorderInputs(matrix,ftree);
%     ftree.table=sortTable(ftree.table);
end