function [outputTree] = createOutputTree(output,primaryInputs,design)
%takes a string output wire name and the design
%reorganizes gates into a tree fashion

matches=0;
outputTree=[];%delete me
for i=1:design.length  %iterate through each gate in design
    for j=1:length(design.data{i}.outputs) %iterate through each output in the gate
        if strcmp(design.data{i}.outputs{j},output)  %find the gate
            outputTree=pruneOutputs(output,design.data{i});
            matches=matches+1;
        end
    end
end

if (matches>1)
    fprintf('ERROR: %d Gates have "%s" as an output.\n',matches,output);
end

if (matches==0)
    fprintf('ERROR: No Gates have "%s" as an output.\n',output);
end



for k=1:length(outputTree.inputs) %iterate through inputs 
    if checkPrimaryInputs(outputTree.inputs{k},primaryInputs)
    else
        outputTree.inputs{k}=createOutputTree(outputTree.inputs{k},primaryInputs,design);
    end
end