function [gateNumber]=outputVerilog(deviceCell,fileName,gateNumber)
%outputs the verilog code from a deviceCell

fp = fopen(fileName,'w');

 nets=cell(0);
 
for i=1:(length(deviceCell))
    if ~(isempty(deviceCell{i}))
        if (isequal(deviceCell{i}.type,'4'))
            fprintf(fp,'NEMR4T g%d(.s(%s), .d(%s), .b(%s), .g(%s));\n',...
                gateNumber, deviceCell{i}.s, deviceCell{i}.d,...
                deviceCell{i}.b, deviceCell{i}.g);
            gateNumber=gateNumber+1;
            nets=addNet(nets,deviceCell{i}.s);
            nets=addNet(nets,deviceCell{i}.d);
        end
        if (isequal(deviceCell{i}.type,'6'))
            fprintf(fp,'NEMR6T g%d(.s1(%s), .d1(%s), .s2(%s), .d2(%s), .b(%s), .g(%s));\n',...
                gateNumber, deviceCell{i}.s1, deviceCell{i}.d1,...
                deviceCell{i}.s2, deviceCell{i}.d2, deviceCell{i}.b, deviceCell{i}.g);
            gateNumber=gateNumber+1;
            nets=addNet(nets,deviceCell{i}.s1);
            nets=addNet(nets,deviceCell{i}.d1);
            nets=addNet(nets,deviceCell{i}.s2);
            nets=addNet(nets,deviceCell{i}.d2);
        end
        if (isequal(deviceCell{i}.type,'s'))
            %do something
        end
    end
end

nets=sort(nets);
fprintf(fp,'  wire ');
count=0;
for i=1:(length(nets)-1)
    if (count==10)
        fprintf(fp,'\n       ');
        count=0;
    end
    count=count+1;
    fprintf(fp,'%s, ', nets{i});
end
fprintf(fp,'%s;', nets{length(nets)});

fclose(fp);

end

function [netsCell] = addNet(netsCell,netName)
    add=1;
    if ~(isequal(netName,'vdd'))
        if ~(isequal(netName,'gnd'))
            for k=1:length(netsCell)
                if (isequal(netsCell{k},netName))
                    add=0;
                    break;
                end
            end
        else
            add=0;
        end
    else
        add=0;
    end
    if (add)
        netsCell{length(netsCell)+1}=netName;
    end
end