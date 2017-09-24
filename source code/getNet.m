function [net] = getNet(io,connTable)
%takes in an io string, and a connTable from parsed line
%checks connTable for that string and returns corresponding net

for i=1:length(connTable)
    if (strcmp(connTable{i}.port,io))
        net=connTable{i}.net;
        break;
    end
end