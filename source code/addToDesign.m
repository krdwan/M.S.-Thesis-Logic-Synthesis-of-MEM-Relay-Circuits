function [design] = addToDesign(gate,design)
%adds a gate to a design
%if design.data cell array is full
%doubles the length of it then adds new gate

if(design.length==length(design.data))
    temp=cell(1,2*length(design.data));
    temp(1:design.length)=design.data(1:design.length);
    design.data=temp;
end

design.length=design.length+1;
design.data{design.length}=gate;