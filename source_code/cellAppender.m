function [outCell]=cellAppender(cell1, cell2)

    outCell=cell(1,length(cell1)+length(cell2));
    outCell(1:length(cell1))=cell1;
    outCell((length(cell1)+1):length(outCell))=cell2;

end
