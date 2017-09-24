function [status,deviceCell] = writeMatrix( treeStruct,outputCell,intNode )

status=0;
deviceCell=writeMatrixHelper(outputCell,treeStruct.table,intNode,treeStruct,1,0,'','');
% outputGn=gateNumber+1;
status=1;

function [deviceCell]=writeMatrixHelper(outputCell,table,nodeName,treeS,index,gn,twoindicate,gateSuffix)
    if ((size(table,2)-1)==index)
        deviceCell=writeMatrixBase(outputCell,table,nodeName,treeS,index,gn,gateSuffix);
    else
        
    [table0,table1,table2] = sort012(table,index);    
    if(~isempty(table0))
%         fprintf(outputFile,'NEMR4T t%d_%s0(.s(%s), .d(%s%s0), .b(vdd), .g(%s));\n',...
%         gn,gateSuffix,nodeName,nodeName,twoindicate,treeS.inputs{index});
        OCI=length(outputCell)+1;
        outputCell{OCI}.type='4';
        source=nodeName;
        if (isequal(nodeName(length(nodeName)),'3'))
            source=treeS.outputs{1}
        end
        outputCell{OCI}.s=source;
        outputCell{OCI}.d=strcat(nodeName,twoindicate,'0');
        outputCell{OCI}.b='vdd';
        outputCell{OCI}.g=treeS.inputs{index};
        outputCell=writeMatrixHelper(outputCell,table0,strcat(nodeName,twoindicate,'0'),treeS,index+1,gn,'',strcat(gateSuffix,'0'));
    end
    if(~isempty(table1))
%         fprintf(outputFile,'NEMR4T t%d_%s1(.s(%s), .d(%s%s1), .b(gnd), .g(%s));\n',...
%         gn,gateSuffix,nodeName,nodeName,twoindicate,treeS.inputs{index});
        OCI=length(outputCell)+1;
        outputCell{OCI}.type='4';
        source=nodeName;
        if (isequal(nodeName(length(nodeName)),'3'))
            source=treeS.outputs{1}
        end
        outputCell{OCI}.s=source;
        outputCell{OCI}.d=strcat(nodeName,twoindicate,'1');
        outputCell{OCI}.b='gnd';
        outputCell{OCI}.g=treeS.inputs{index};
        outputCell=writeMatrixHelper(outputCell,table1,strcat(nodeName,twoindicate,'1'),treeS,index+1,gn,'',strcat(gateSuffix,'1'));
    end
    if(~isempty(table2))
        outputCell=writeMatrixHelper(outputCell,table2,nodeName,treeS,index+1,gn,strcat('2',twoindicate),strcat(gateSuffix,'2'));
    end
        deviceCell=outputCell;
    end
end

function [outputCell] = writeMatrixBase(outputCell,table,nodeName,treeS,index,gn,gateSuffix)
    [table0,table1,table2] = sort012(table,index); 
    if(~isempty(table0))
        temp='gnd';
        if(table0(index+1)==1)
            temp='vdd';
        end
%         fprintf(outputFile,'NEMR4T t%d_%s0(.s(%s), .d(%s), .b(vdd), .g(%s));\n',...
%         gn,gateSuffix,nodeName,temp,treeS.inputs{index});
        OCI=length(outputCell)+1;
        outputCell{OCI}.type='4';
        source=nodeName;
        if (isequal(nodeName(length(nodeName)),'3'))
            source=treeS.outputs{1}
        end
        outputCell{OCI}.s=source;
        outputCell{OCI}.d=temp;
        outputCell{OCI}.b='vdd';
        outputCell{OCI}.g=treeS.inputs{index};
    end
    if(~isempty(table1))
        temp='gnd';
        if(table1(index+1)==1)
            temp='vdd';
        end
%         fprintf(outputFile,'NEMR4T t%d_%s1(.s(%s), .d(%s), .b(gnd), .g(%s));\n',...
%         gn,gateSuffix,nodeName,temp,treeS.inputs{index});
        OCI=length(outputCell)+1;
        outputCell{OCI}.type='4';
        source=nodeName;
        if (isequal(nodeName(length(nodeName)),'3'))
            source=treeS.outputs{1}
        end
        outputCell{OCI}.s=source;
        outputCell{OCI}.d=temp;
        outputCell{OCI}.b='gnd';
        outputCell{OCI}.g=treeS.inputs{index};
    end
    if(~isempty(table2))
        temp='gnd';
        if(table2(index+1)==1)
            temp='vdd';
        end
%         fprintf(outputFile,'NEMR4T t%d_%s2short(.s(%s), .d(%s), .b(gnd), .g(vdd));\n',...
%         gn,gateSuffix,nodeName,temp);
        OCI=length(outputCell)+1;
        outputCell{OCI}.type='4';
        source=nodeName;
        if (isequal(nodeName(length(nodeName)),'3'))
            source=treeS.outputs{1}
        end
        outputCell{OCI}.s=source;
        outputCell{OCI}.d=temp;
        outputCell{OCI}.b='gnd';
        outputCell{OCI}.g='vdd';
    end
end

function [table0,table1,table2] = sort012(table,index)
    table0=[];
    table1=[];
    table2=[];
    for i=1:size(table,1)  %sort into three tables
        if (table(i,index)==0)
            table0=[table0; table(i,:)];
        else
            if (table(i,index)==1)
                table1=[table1; table(i,:)];
            else
                if (table(i,index)==2)
                    table2=[table2;table(i,:)];
                end
            end
        end
    end
end

end