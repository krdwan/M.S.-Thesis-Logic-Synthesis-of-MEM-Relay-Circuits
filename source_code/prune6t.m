function [deviceCell]=prune6t(deviceCell)
%given a deviceCell as an input with 4T devices only
%gets rid of the repeats, basically same D,B,G connections
    while(1)
        oldCell=deviceCell;
        [deviceCell]=prune6tHelper(deviceCell);
        if(isequal(oldCell,deviceCell))
            break;
        end
%         printCell(deviceCell);
    end
end

function [deviceCell]=prune6tHelper(deviceCell)
    for i=1:length(deviceCell)
        if ~(isempty(deviceCell{i}))            %if current device is not empty
            if (isequal (deviceCell{i}.type,'4')) %if current devivce is a 4T 
                for k=(i+1):length(deviceCell)
                    if ~(isempty(deviceCell{k}))      
                        if (isequal (deviceCell{k}.type,'4'))
                            if ((isequal (deviceCell{k}.b,deviceCell{i}.b)) &&...
                                    (isequal (deviceCell{k}.g,deviceCell{i}.g)))
                                blah.type='6';
                                blah.s1=deviceCell{i}.s;
                                blah.d1=deviceCell{i}.d;
                                blah.s2=deviceCell{k}.s;
                                blah.d2=deviceCell{k}.d;
                                blah.g=deviceCell{i}.g;
                                blah.b=deviceCell{i}.b;
                                deviceCell{k}=[];
                                deviceCell{i}=blah;
                                break;
                            end
                        end
                    end
                end
            end
        end
    end
    %clean up EMPTY spots in deviceCell
newCell=cell(0);
nIndex=1;
for i=1:length(deviceCell)
    if ~(isempty(deviceCell{i}))
        newCell{nIndex}=deviceCell{i};
        nIndex=nIndex+1;
    end
end
deviceCell=newCell;
end
