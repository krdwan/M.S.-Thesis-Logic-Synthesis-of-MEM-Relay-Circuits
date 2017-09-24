function [boolean] = checkPrimaryInputs(input,primaryInputs)
%takes a string input and returns true if it is in the 
%primaryInputs cell array

boolean=0;
for i=1:length(primaryInputs)
    if strcmp(primaryInputs{i},input)
        boolean=1;
        break;
    end
end