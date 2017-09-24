function [ outputGate] = reorderInputs( inputMatrix,gate )
%input matrix is an array of indices i.e. [2 1 3]
%this would indicate the gates inputs should be ordered
%[current-2nd-input, current-1st-input, current-3rd-input]
%so if currently inputs were [A B C]
%the result would be [B A C]

outputGate=gate;

for i=1:length(inputMatrix)
    outputGate.inputs{i}=gate.inputs{inputMatrix(i)};
    outputGate.table(:,i)=gate.table(:,inputMatrix(i));
end




