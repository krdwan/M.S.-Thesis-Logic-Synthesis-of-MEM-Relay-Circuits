function [resultGate] = pruneOutputs(output,gate)
%takes in an output string and a gate structure
%returns a gate where only the truth table with entries of 
%the output string are kept

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%assumes 'output' string is an output of the gate

resultGate=gate;
index=length(resultGate.inputs);

numberOfOutputs=length(resultGate.outputs);
for i=1:numberOfOutputs;
    if (strcmp(resultGate.outputs{i},output))
        resultGate.outputs=cell(1,1);
        resultGate.outputs{1}=output;
        resultGate.table=[resultGate.table(:,1:index) resultGate.table(:,index+i)];
        break;
    end
    if i==numberOfOutputs
        fprintf('ERROR: pruneOutputs: %s is not an output of gate\n', output);
    end
end
