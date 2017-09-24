function [deviceCell,intNetIndex]=prune4t(deviceCell,intNet,intNetIndex,pIn)
%given a deviceCell as an input with 4T devices only
%gets rid of the repeats, basically same D,B,G connections
    while(1)
        oldCell=deviceCell;
        [deviceCell,intNetIndex]=prune4tHelper(deviceCell,intNet,intNetIndex,pIn);
        if(isequal(oldCell,deviceCell))
            break;
        end
%         printCell(deviceCell);
    end
end

function [deviceCell,intNetIndex]=prune4tHelper(deviceCell,intNet,intNetIndex,pIn)
replace=0;
for i=1:length(deviceCell)
    if ~(isempty(deviceCell{i}))
    matches=cell(0);
    mi=1;
    for j=(1+i):length(deviceCell)
        %for each match, go through and replace nets
        %for each match except the original
        if ~(isempty(deviceCell{j}))
            if (repeatDevice(deviceCell{i},deviceCell{j})) %found a match!
                matches{mi}.s=deviceCell{j}.s; %net of source
                matches{mi}.n=j; %index to the current device
                matches{mi}.devices=[];
                mi=mi+1;
%                 replace=strcat(intNet,'_',num2str(intNetIndex));
%                 deviceCell=netReplace(deviceCell,...
%                     replace,...
%                     deviceCell{j}.s);
%                 deviceCell{j}=[];
            end
        end
    end
    % matches is now populated with the matches
    % now we must check each one for an actual match
    if (mi>1)
        matches{mi}.s=deviceCell{i}.s;
        matches{mi}.n=i;
        matches{mi}.devices=[];
%         printCell(matches);
        for k=1:length(deviceCell)
            if ~(isempty(deviceCell{k}))
                for m=1:mi
                    if (isequal(deviceCell{k}.s,matches{m}.s))
                        matches{m}.devices(length(matches{m}.devices)+1)=k;
                    end
                end
            end
        end
%         printCell(matches);
       %check if there are any real matches
       %and replace accordingly
        matches=checkMatches(deviceCell,matches,pIn);
        for q=1:(length(matches)-1)
            if ~(isempty(matches{q}))
                for r=1:length(matches{q}.devices)
                    deviceCell{matches{q}.devices(r)}=[];
                end
                replace=strcat(intNet,'_',num2str(intNetIndex));
                if (inside(matches{length(matches)}.s,pIn))
                    replace=matches{length(matches)}.s;
                end
                deviceCell=netReplace(deviceCell,replace,matches{q}.s);
            end
        end
    end
    if (replace) %if a match was found earlier,
                 %convert original to the newDevice
        deviceCell=netReplace(deviceCell,replace,deviceCell{i}.s);
        printCell(deviceCell);
        intNetIndex=intNetIndex+1
        replace=0;
%         printCell(matches);
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


%returns 1 if the two 4T devices input have the same G,B,D
%this is because these are the inputs and the S is the output
%so the two devices would be performing the same function
function [bool]= repeatDevice(device1,device2)
    bool=(isequal(device1.g,device2.g) && ...
    isequal(device1.b,device2.b) && ...
    isequal(device1.d,device2.d));
end

%goes through entire deviceCell changes all instances'
%of oldNet to instances of newNet, only goes through
%S and D connections
function [outCell]=netReplace(inCell,newNet,oldNet)
    for k=1:length(inCell)
        if ~(isempty(inCell{k}))
            if (isequal(inCell{k}.s,oldNet))
                inCell{k}.s=newNet;
            end
            if (isequal(inCell{k}.d,oldNet))
                inCell{k}.d=newNet;
            end
        end
    end
    outCell=inCell;
end

%given a deviceCell and matches cell arrays
%checks if the "matches" in matches are real matches
%deletes the entries from matches that aren't
function [outMatches]=checkMatches(deviceCell,matches,pIn)
    index=length(matches);
    for z=1:(index-1)
        if (inside(matches{z}.s,pIn))
            matches{z}=[];
        else
        challenger=matches{z}.devices;
        champ=matches{index}.devices;
        for y=1:length(challenger)
            miss=1;
            for x=1:length(champ)
                if (champ(x)>0)
                    if (repeatDevice(deviceCell{challenger(y)},deviceCell{champ(x)}))
                        champ(x)=0;
                        miss=0;
                        break;
                    end
                end
            end
            if (miss)
                matches{z}=[];
                break;
            end
        end
        if ~(isempty(matches{z}))
            if (sum(champ)~=0)
                matches{z}=[];
            end
        end
        end
    end
    outMatches=matches;
end

%returns true if the string is insdie the cellstring
function [bool]=inside(string,cellString)
    bool=0;
    for d=1:length(cellString)
        if (isequal(string,cellString{d}))
            bool=1;
            break;
        end
    end
end