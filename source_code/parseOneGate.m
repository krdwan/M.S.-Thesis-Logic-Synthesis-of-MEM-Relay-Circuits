function [gate] = parseOneGate(line,Lib)

%   line='NEM_NOR2 g128(.A (\state[0] ), .B (\state[1] ), .Y (n_1));';
%   line='NEM_NOR2 g128(.A (\state[0] ), .B (    ), .Y (n_1));';
  line_function=regexp(line, '\w+', 'match', 'once');
  gate=checkLib(line_function,Lib);
  connections=regexp(line, '\.\s*\w+\s*\(\s*[\w\[\]\\]*\s*\)', 'match');
   
  %create a table of the gate ports and nets from parsed line
  connTable=cell(1,length(connections));
  for i=1:length(connections)
      temp=regexp(connections{i},'\(','split');
      connTable{i}.port=regexprep(temp{1},'[\s\.]*','');
      connTable{i}.net= regexprep(temp{2},'[\s\)]*','');
  end
  
  %replace 'gate' connections from Lib /w
  %net names from connTable
  for i=1:length(gate.inputs)
      gate.inputs{i}=getNet(gate.inputs{i},connTable);    
  end
  for i=1:length(gate.outputs)
      gate.outputs{i}=getNet(gate.outputs{i},connTable);
  end

  
