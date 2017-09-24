function [ combinedGate ] = combineGates( parentGate,childGate,index )
%the child gate's output feeds into the input of the parentGate
%index refers to which input in the parentGate the childGate feeds into
%i.e. index=3, childGate feeds into 3rd input of parentGate

%%%%%%%%%%%%%%%%%%%%%%%%%%
%assumes childGate has already been pruned and only has one output

%create truth table for the new gate
tempvar=1;
newTable=[];
% newDTable=[];
childOutIndex=1+length(childGate.inputs);
parentFinalOutIndex=length(parentGate.inputs)+length(parentGate.outputs);
[PCIndex,childInsertTable] = combineHelper(childGate.table,...
                                parentGate.inputs,childGate.inputs,index);
for i=1:length(parentGate.table(:,1))
    for j=1:length(childGate.table(:,1))
        if ((parentGate.table(i,index)==childGate.table(j,childOutIndex))...
                && tableMatch(i,j,parentGate.table,childGate.table,PCIndex))
%             newTable=[newTable;
%                       parentGate.table(i,1:(index-1))...
%                       childGate.table(j,1:(childOutIndex-1))...
%                       parentGate.table(i,(index+1):parentFinalOutIndex)];
            newTable=[newTable;
                      parentGate.table(i,1:(index-1))...
                      childInsertTable(j,1:(size(childInsertTable,2)-1))...
                      parentGate.table(i,(index+1):parentFinalOutIndex)];
%             if (isempty(childGate.Dtable));
%                 if (length(parentGate.Dtable)==0)
%                     newDTable=[newDTable;
%                                parentGate.table(i,index)];
%                 else
%                     newDTable=[newDTable;
%                                parentGate.Dtable(i,:) ...
%                                parentGate.table(i,index)];
%                 end
%             else
%                 if (length(parentGate.Dtable)==0)
%                     newDTable=[newDTable;
%                                parentGate.table(i,index) ...
%                                childGate.Dtable(j,:)];
%                 else
%                     newDTable=[newDTable;
%                                parentGate.Dtable(i,:) ...
%                                parentGate.table(i,index) ...
%                                childGate.Dtable(j,:)];
%                 end
%             end
        end
    end
end

%Update dependency names for the new gate
% if (isempty(childGate.Dtable))
%     newDependencies=cell(1,length(parentGate.dependencies)+1);
%     newDependencies(1:length(newDependencies)-1)=...
%         parentGate.dependencies(1:length(parentGate.dependencies));
%     newDependencies{length(newDependencies)}=...
%         parentGate.inputs{index}.outputs{1};
% else
%     newDependencies=cell(1,length(parentGate.dependencies)+1+length(childGate.dependencies));
%     newDependencies(1:length(parentGate.dependencies))=...
%         parentGate.dependencies(1:length(parentGate.dependencies));
%     newDependencies{length(parentGate.dependencies)+1}=...
%         parentGate.inputs{index}.outputs{1};
%     newDependencies((length(parentGate.dependencies)+2):length(newDependencies))=...
%         childGate.dependencies(1:(length(childGate.dependencies)));
% end

%Update the inputs cell array for the new gate
newInputs=cell(1,0);
newInputs(1:(index-1))=parentGate.inputs(1:(index-1));
for i=1:length(childGate.inputs)
    addInput=1;
    for j=1:size(PCIndex,2)
        if (i==PCIndex(2,j))
            addInput=0;
        end
    end
    if (addInput)
        newInputs{length(newInputs)+1}=childGate.inputs{i};
    end
end
newInputs((length(newInputs)+1):(length(newInputs)+length(parentGate.inputs)-index))...
    =parentGate.inputs((index+1):length(parentGate.inputs));

%create the new gate
combinedGate.inputs=newInputs;
combinedGate.outputs=parentGate.outputs;
combinedGate.table=newTable;
% combinedGate.Dtable=newDTable;
% combinedGate.dependencies=newDependencies;
end

% creates PCIndex which is a index of parent and child inputs that have the
% same net
% childInsertTable removes those columns which have these repeated nets
function [PCIndex,childInsertTable] = combineHelper(childTable,parentInputs,childInputs,parentIndex)
    PCIndex=[];
    for k=1:length(parentInputs)
        if (k~=parentIndex)
            for g=1:length(childInputs)
                if(strcmp(parentInputs{k},childInputs{g}))
                    PCIndex=[PCIndex [k;g]];
                end
            end
        end
    end
    childInsertTable=[];
    for r=1:size(childTable,2)
        temp=1;
        for s=1:size(PCIndex,2)
            if (r==PCIndex(2,s))
                temp=0;
            end
        end %set temp to 0 if r is a column of child table that is a repeat
        if (temp)
            childInsertTable=[childInsertTable childTable(:,r)];
        end
    end
end

% checks parent and child tables using PCIndex
% sees if the current parent row is suitable for inserting data
function [equal] = tableMatch(pRow,cRow,pTable,cTable,PCI)
    equal=1;
    for f=1:size(PCI,2)
        if (pTable(pRow,PCI(1,f))~=cTable(cRow,PCI(2,f)))
            equal=0;
            break;
        end
    end
end


% example 1
% parentTable = [0 0 0 0;
%                 0 0 1 0;
%                 0 1 0 0;
%                 0 1 1 1;
%                 1 0 0 1;
%                 1 0 1 0;
%                 1 1 0 1;
%                 1 1 1 1]
% childTable = [0 1; 1 0]
% parentInputs=cell(1,3);
% parentInputs{1}='B';
% parentInputs{2}='B_bar';
% parentInputs{3}='A';
% childInputs=cell(1);
% childInputs{1}='B';
% parentIndex=2;

% example 2
% childTable=[0 0 0; 
%             0 1 1;
%             1 0 1;
%             1 1 0];
% parentInputs=cell(1,3);
% parentInputs{1}='A';
% parentInputs{2}='B';
% parentInputs{3}='C';
% parentIndex=2;
% childInputs=cell(1,2);
% childInputs{1}='A';
% childInputs{2}='B';
