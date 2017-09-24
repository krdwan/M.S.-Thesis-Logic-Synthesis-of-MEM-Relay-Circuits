function [outFtree] = deleteDColumn(index,ftree)
%takes in a flattened tree or a gate
%looks takes the indexed number of Dtabler signals and
%deletes it
%assumes index is within the range of the Dtable

outFtree=ftree;
dlength=size(outFtree.dependencies,2)-1;
if (dlength==0)
    outFtree.dependencies=cell(0);
else
    outFtree.dependencies=cell(1,size(outFtree.dependencies,2)-1);
end
outFtree.Dtable=[];

counter=1;
for i=1:size(ftree.dependencies,2)
    if(i~=index)
        outFtree.dependencies{counter}=ftree.dependencies{i};
        outFtree.Dtable=[outFtree.Dtable ftree.Dtable(:,i)];
        counter=counter+1;
    end
end