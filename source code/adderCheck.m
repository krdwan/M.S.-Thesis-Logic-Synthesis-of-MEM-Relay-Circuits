function [ logic ] = adderCheck( ftree )
%checks if a flattened tree can be made into an adder structure
%logic is the output structure, null if no adder is created

%assumes that the flattened tree only has one output column in its
%table

%Atable stands for Adder Table
[Atable,indices]=subnetCheck(ftree.table,size(ftree.table,2),ftree.Dtable);
logic=ftree;
if (isempty(Atable))
    logic=[];
else
    %logic.name=outputs{1};
    if (size(indices,2)==3) %non base case
        logic.table=Atable;
        logic.inputs=cell(1,3);
        logic.inputs{1}=ftree.inputs{indices(1)};
        logic.inputs{2}=ftree.inputs{indices(2)};
%        logic.inputs{3}=ftree.dependencies{indices(3)};
        logic.outputs=ftree.outputs;
        
        %%%%%%%%
        child=ftree;
        inputIndex=[];
        for i=1:length(child.inputs)
            if (i~=indices(1))
                if (i~=indices(2))
                    inputIndex=[inputIndex i];
                end
            end
        end
        inputIndex=[inputIndex indices(1:2)];
        %%%%%%%%%
        
        %create a new flattened tree for recursion
        %this tree will lead to generation of the Dsignal
        child=reorderInputs(inputIndex,child);
        child.table(:,size(child.table,2))=child.Dtable(:,indices(3));
        child.outputs=cell(1,1);
        child.outputs{1}=child.dependencies{indices(3)};
        child=deleteDColumn(indices(3),child);
        %%%%%%
%         child
%         child.table
%         child.Dtable
        temp=adderCheck(child);
        
        if (isempty(temp))
            logic=[];
        else
            logic.inputs{3}=temp;
        end
%         logic.inputs{3}=adderCheck(child);
        
        %%%%%%
    else %equals 4 base case
        logic.table=Atable;
        logic.inputs=cell(1,3);
        logic.inputs{1}=ftree.inputs{indices(1)};
        logic.inputs{2}=ftree.inputs{indices(2)};
        logic.inputs{3}=ftree.inputs{indices(4)};
        logic.outputs=ftree.outputs;
    end
end


% blarg1=flattenTree(tree1);
% blarg2=flattenTree(tree2);
% blarg3=flattenTree(tree3);
% blarg4=flattenTree(tree4);
% 
% 
% [a,b]=subnetCheck(blarg3.table,size(blarg3.table,2),blarg3.Dtable) %adder
% [a,b]=subnetCheck(blarg3.table,6,arg) %nothing
% [a,b]=subnetCheck(blarg3.table,6,arg2) %nothing
% [a,b]=subnetCheck(blarg4.table,4,blarg4.Dtable) %base case

% to do, recursively run subnet check and identify an adder structure