function [outMatches]=checkMatches2(deviceCell,matches)
    index=length(matches);
    for z=1:(index-1)
        challenger=matches{z}.devices;
        champ=matches{index}.devices;
        for y=1:length(challenger)
            miss=1;
            for x=1:length(champ)
                if (champ(x)>0)
                    if (repeatDevice(deviceCell{y},deviceCell{x}))
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
    outMatches=matches;
end

%returns 1 if the two 4T devices input have the same G,B,D
%this is because these are the inputs and the S is the output
%so the two devices would be performing the same function
function [bool]= repeatDevice(device1,device2)
    bool=(isequal(device1.g,device2.g) && ...
    isequal(device1.b,device2.b) && ...
    isequal(device1.d,device2.d));
end

% 
% mach=cell(0);
% n=1;
% mach{n}.devices=[4 5];
% n=2;
% mach{n}.devices=[6 7 8];
% n=3;
% mach{n}.devices=[9 10 11 12];
% n=4;
% mach{n}.devices=[1 2 3];
% 
% %test case
% blah=cell(0);
% n=1;
% blah{n}.type='4';
% blah{n}.s='a';
% blah{n}.d='b';
% blah{n}.g='c';
% blah{n}.b='d';
% 
% n=2;
% blah{n}.type='4';
% blah{n}.s='a';
% blah{n}.d='e';
% blah{n}.g='f';
% blah{n}.b='g';
% 
% n=3;
% blah{n}.type='4';
% blah{n}.s='a';
% blah{n}.d='h';
% blah{n}.g='i';
% blah{n}.b='j';
% n=4;
% blah{n}.type='4';
% blah{n}.s='x';
% blah{n}.d='b';
% blah{n}.g='c';
% blah{n}.b='d';
% n=5;
% blah{n}.type='4';
% blah{n}.s='x';
% blah{n}.d='e';
% blah{n}.g='f';
% blah{n}.b='g';
% n=6;
% blah{n}.type='4';
% blah{n}.s='y';
% blah{n}.d='b';
% blah{n}.g='c';
% blah{n}.b='d';
% n=7;
% blah{n}.type='4';
% blah{n}.s='y';
% blah{n}.d='e';
% blah{n}.g='f';
% blah{n}.b='g';
% n=8;
% blah{n}.type='4';
% blah{n}.s='y';
% blah{n}.d='h';
% blah{n}.g='i';
% blah{n}.b='j';
% n=9;
% blah{n}.type='4';
% blah{n}.s='z';
% blah{n}.d='h';
% blah{n}.g='i';
% blah{n}.b='j';
% n=10;
% blah{n}.type='4';
% blah{n}.s='z';
% blah{n}.d='h';
% blah{n}.g='i';
% blah{n}.b='j';
% n=11;
% blah{n}.type='4';
% blah{n}.s='z';
% blah{n}.d='b';
% blah{n}.g='c';
% blah{n}.b='d';
% n=12;
% blah{n}.type='4';
% blah{n}.s='z';
% blah{n}.d='e';
% blah{n}.g='f';
% blah{n}.b='g';