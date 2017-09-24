function [status,outputGn,newiNodes] = writeAdder( adderStruct,outputFile,gatenumber,iNodes )
%iNodes are intermediate nodes that have been written previously

%adderStruct=grab2;
% outputFile='hello';


[a,b,c]=writeHelp(outputFile,adderStruct,iNodes,gatenumber);
status=a;
outputGn=b;
newiNodes=c;
%fp=fopen(outputFile,'w');

%fclose(fp);



function [returnVal,newGn,newiN] = writeHelp(outputFile,add,iN,gn)
    returnVal=1;
    newiN=iN;
    if (existsInside(add.outputs{1},iN))
        newGn=gn;
        return;
    end
    
    temp=sortTable(add.table);
    if (ischar(add.inputs{3})) %base case
        if (isequal(temp(:,4),[0;0;0;1;0;1;1;1])) %carry
            fprintf(outputFile,'NEMR4T c%da(.s(%s), .d(%s), .b(%s_bar), .g(%s));\n',...
                gn,add.inputs{1},add.outputs{1},add.inputs{2},add.inputs{1});
            fprintf(outputFile,'NEMR4T c%db(.s(%s), .d(%s), .b(%s), .g(%s));\n',...
                gn,add.inputs{3},add.outputs{1},add.inputs{2},add.inputs{1});
            fprintf(outputFile,'NEMR4T c%dc(.s(%s_bar), .d(%s_bar), .b(%s_bar), .g(%s));\n',...
                gn,add.inputs{2},add.outputs{1},add.inputs{2},add.inputs{1});
            fprintf(outputFile,'NEMR4T c%dd(.s(%s_bar), .d(%s_bar), .b(%s), .g(%s));\n',...
                gn,add.inputs{3},add.outputs{1},add.inputs{2},add.inputs{1});
            newiN{size(newiN,2)+1}=add.outputs{1};
            newiN{size(newiN,2)+1}=strcat(add.outputs{1},'_bar');
            newGn=gn+1;
        else
            if (isequal(temp(:,4),[0;1;1;0;1;0;0;1])) %sum
                fprintf(outputFile,'NEMR4T s%da(.s(%s), .d(%s), .b(%s_bar), .g(%s));\n',...
                    gn,add.inputs{3},add.outputs{1},add.inputs{2},add.inputs{1});
                fprintf(outputFile,'NEMR4T s%db(.s(%s_bar), .d(%s), .b(%s), .g(%s));\n',...
                    gn,add.inputs{3},add.outputs{1},add.inputs{2},add.inputs{1});
                newiN{size(newiN,2)+1}=add.outputs{1};
                newGn=gn+1;
            else %not an adder
                returnVal=0;
                newGn=gn;
            end
        end
    else
        if (isequal(temp(:,4),[0;0;0;1;0;1;1;1])) %carry
            [blah,newGn,newiN]=writeHelp(outputFile,add.inputs{3},iN,gn);
            if (blah)
                fprintf(outputFile,'NEMR4T c%da(.s(%s), .d(%s), .b(%s_bar), .g(%s));\n',...
                    newGn,add.inputs{1},add.outputs{1},add.inputs{2},add.inputs{1});
                fprintf(outputFile,'NEMR4T c%db(.s(%s), .d(%s), .b(%s), .g(%s));\n',...
                    newGn,add.inputs{3}.outputs{1},add.outputs{1},add.inputs{2},add.inputs{1});
                fprintf(outputFile,'NEMR4T c%dc(.s(%s_bar), .d(%s_bar), .b(%s_bar), .g(%s));\n',...
                    newGn,add.inputs{2},add.outputs{1},add.inputs{2},add.inputs{1});
                fprintf(outputFile,'NEMR4T c%dd(.s(%s_bar), .d(%s_bar), .b(%s), .g(%s));\n',...
                    newGn,add.inputs{3}.outputs{1},add.outputs{1},add.inputs{2},add.inputs{1});
                newiN{size(newiN,2)+1}=add.outputs{1};
                newiN{size(newiN,2)+1}=strcat(add.outputs{1},'_bar');
                newGn=newGn+1;
            else
                returnVal=0;
                newGn=gn;
            end
        else
            if (isequal(temp(:,4),[0;1;1;0;1;0;0;1])) %sum
                [blah,newGn,newiN]=writeHelp(outputFile,add.inputs{3},iN,gn);
                if (blah)
                    fprintf(outputFile,'NEMR4T s%da(.s(%s), .d(%s), .b(%s_bar), .g(%s));\n',...
                        newGn,add.inputs{3}.outputs{1},add.outputs{1},add.inputs{2},add.inputs{1});
                    fprintf(outputFile,'NEMR4T s%db(.s(%s_bar), .d(%s), .b(%s), .g(%s));\n',...
                        newGn,add.inputs{3}.outputs{1},add.outputs{1},add.inputs{2},add.inputs{1});
                    newiN{size(newiN,2)+1}=add.outputs{1};
                    newGn=newGn+1;
                else
                    returnVal=0;
                    newGn=gn;
                end
            else
                returnVal=0;
                newGn=gn;
            end
        end
    end
end

function [returnMe] = existsInside(string,cellarray)
%if string is an item within the cellarray: returnMe == 1, else 0
    returnMe=0;
    for z=1:(size(cellarray,2))
        if (isequal(string,cellarray{z}))
            returnMe=1;
        end
    end
end

end