function [blah,indices] = subnetCheck(table, outIndex, dtable)
%takes in a table, dtable and outIndex
%outIndex is the column of outputs in the table
%attempts to find 2 primary inputs and one dtable input
%that can completely characterize output

%blah is the table that is returned either 8 rows long or null
%indices are the index of the two inputs and the index of the dtable
%that yield the blah results

blah=[];
indices=[0 0 0];



breakq=0;
breakj=0;
for q=1:size(dtable,2)
    for j=1:size(table,2)
        if (j~=outIndex)
            for k=(j+1):size(table,2)
                if (k~=outIndex)
%                     a=[table(:,j) table(:,k)...
%                          dtable(:,i) table(:,outIndex)]
%                     blah=sCheckHelper(a, 4);
                    blah=sCheckHelper([table(:,j) table(:,k)...
                         dtable(:,q) table(:,outIndex)], 4);
                    %if the Dtable input characterizes the input
                    if (size(blah,1)==8)
                         if (size(sCheckHelper(blah(:,1:3),3),1)==8)
                              breakj=1;
                              break;
                         end
                    end
                end
            end
        end
        if (breakj)
            breakq=1;
            break;
        end
    end
    if (breakq)
        indices=[j k q];
        break;
    end
    blah=[];
end

breakq=0;
breakj=0;
%parse 3 primary inputs for base case
if (isempty(blah))
    for q=1:size(table,2)
        if (q~=outIndex)
            for j=(q+1):size(table,2)
                if (j~=outIndex)
                    for k=(j+1):size(table,2)
                        if (k~=outIndex)
                            blah=sCheckHelper([table(:,q) table(:,j)...
                                 table(:,k) table(:,outIndex)], 4);
                            %if the Dtable input characterizes the input
                            if (size(blah,1)==8)
                                    breakj=1;
                                    break;
                            end
                        end
                    end
                end
                if (breakj)
                    breakq=1;
                    break;
                end
            end
        end
        if (breakq)
            indices=[q j 0 k];
            break;
        end
        blah=[];
    end
end

function newTable = sCheckHelper(table,outIndex)
%takes in a 4 columned table
%outIndex should be 1 to 4

%switches the outIndex column to the last column of table
    orderedTable=[];
    for i=1:(size(table,2)-1)
        if (i==outIndex)
            orderedTable=[orderedTable table(:,size(table,2))];
        else
            orderedTable=[orderedTable table(:,i)];
        end
    end
    orderedTable=[orderedTable table(:,outIndex)];
 
    %deletes repeat rows
    newTable=[];
    for i=1:size(table,1)
        newTable=sCheckDeleter(table,i);
        table=newTable;
        if (i>=size(table,1))
            break;
        end
    end  
end

function newTable=sCheckDeleter(table,row)
%takes in a table, and a row number
%goes through remaining rows in the table and deletes repeats
%of the row
    newTable=table(1:row,:);
    for z=row:size(table,1)
        if(isequal(table(row,:),table(z,:)))
        else
            newTable=[newTable; table(z,:)];
        end
    end
end


end