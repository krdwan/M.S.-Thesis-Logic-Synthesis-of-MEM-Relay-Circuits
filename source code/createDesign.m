function [design] = createDesign(gateEstimate)
%creates a design that stores gates and logic tables
%initially stores number of gates equal to gateEstimate

design.length=0;
design.data=cell(1,gateEstimate);
