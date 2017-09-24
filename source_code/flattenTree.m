function [ gate ] = flattenTree( tree )
%takes a tree and flattens it by combining gates

trigger=0;
gate=tree;
for i=length(gate.inputs)+1-(1:length(gate.inputs))
    if ischar(gate.inputs{i})
    else
        gate=combineGates(gate,flattenTree(gate.inputs{i}),i);
        trigger=1;
    end
end

%if trigger = 0, the gate had no dependencies
%give a placeholder to the Dtable
if (trigger==0)
    gate.Dtable=[];
end