function [gate_struct] = checkLib(gate,Lib)
%checks to see if the string is a gate in the library
%returns the gate structure or empty matrix
gate_struct=[];
for i=1:length(Lib)
    %fprintf('Iterations:%d\n',i);
    if(strcmp(Lib{i}.name,gate))
        gate_struct=Lib{i};
        break;
    end
end
