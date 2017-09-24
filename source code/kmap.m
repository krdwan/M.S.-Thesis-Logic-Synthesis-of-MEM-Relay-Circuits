function [blah1,blah2] = kmap(table, outIndex)
%table is a truth table
%outIndex is the column which are the outputs

% outIndex=4;
% table2=[0 0 0 0;
%        0 0 1 0;
%        0 1 0 0;
%        1 0 0 0;
%        1 1 0 0;
%        0 1 1 1;
%        1 0 1 1; 
%        1 1 1 1];

%make two tables, one with outputs = 1, the other with outputs=0
onesTable=[];
zeroTable=[];
for i=1:length(table(:,1))
    if (table(i,outIndex)==1)
        onesTable=[onesTable; table(i,:)];
    else
        zeroTable=[zeroTable; table(i,:)];
    end
end

blah1=kmaphelper(onesTable,outIndex);
blah2=kmaphelper(zeroTable,outIndex);
while(~(isequal(blah1,onesTable)))
    onesTable=blah1;
    blah1=kmaphelper(onesTable,outIndex);
end
while(~(isequal(blah2,zeroTable)))
    zeroTable=blah2;
    blah2=kmaphelper(zeroTable,outIndex);
end

% for i=1:2
%     blah1=kmaphelper(blah1,outIndex);
%     blah2=kmaphelper(blah2,outIndex);
% end


function kmappedTable = kmaphelper(table,outIndex)
% 
kmappedTable=[];
flag=0; %turns to 1 if for a specific row, a reduction was made
skiprows=[];
dothisrow=1;
for i=1:size(table,1)
    dothisrow=1;
    for p=1:(length(skiprows))
        if (i==skiprows(p))
            dothisrow=0;
        end
    end
    if (dothisrow)
        for j=(i+1):length(table(:,1))
            dothisrow=1;
            for k=1:(length(skiprows))
                if (j==skiprows(k))
                    dothisrow=0;
                end
            end
            if (dothisrow)
                temp=rowAnalyzer([table(i,:); table(j,:)],outIndex);
                if (length(temp)~=0)
                    kmappedTable=[kmappedTable; temp];
                    flag=1;
                    skiprows=[skiprows j];
                    break;
                end
            end
        end
        if (flag==0)
            kmappedTable=[kmappedTable; table(i,:)];
        end
        flag=0;
    end
end
            
function result = rowAnalyzer(rows,outIndex)
%takes in 2 rows
%combines them into 1 if appropriate
%fix me later
diffs=[];
for i=1:length(rows(1,:))
    if (i~=outIndex)
        if (rows(1,i)~=rows(2,i))
            diffs=[diffs i];
        end
    end
end

result=[];
if (length(diffs)==1)
    result=[rows(1,1:(diffs-1)) 2 rows(1,(diffs+1):length(rows))];
end
            