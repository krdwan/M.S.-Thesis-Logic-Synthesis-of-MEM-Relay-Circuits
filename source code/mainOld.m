% NEMS Synthesis Tool
% Kevin Dwan
% 2nd Version   03-21-11

% Instructions:
% The tool will synthesize logic for one output net as
% a function of the given input nets and output it as
% relay based structural verilog into the output file.
% An indexing number, gateNumber, needs to be changed for
% each successive run of the tool to insure no duplicate
% named gates at the output file.  For larger designs
% run the tool once for each output bit.  Update the
% gateNumber parameter for each successive run using
% the output of the previous run.
%
% Specify the following 5 parameters in the section below.
% 1. RCOut: The filename of the structural verilog to be
%           synthesized.  Should contain no newlines.
%           Follow formatting in sample file.
% 2. OutputFile: Specify the name of the file to write
%           the output verilog to.  Change name for
%           successive runs or older outputs will be
%           overwritten.
% 3. gateNumber: Initially set to 1.  After running the
%           tool, a New Gate Number will be output.  Use
%           this new number as the input for successive
%           synthesis runs.  This ensures gates in the
%           output synthesized design will not have 
%           duplicate names.
% 4. output: The name of the net to be synthesized.  Can
%           only be a single bit, not a bus.
% 5. primaryInputs: A cell array that should be filled with
%           the net names of the inputs to the logic block.
%           This ensures 1 mechanical delay between these 
%           inputs and the output from step 4.
%
% This file is already configured to run the sample input.
% View the files specified as an example.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% User Defined Parameters %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%The output from the RC synthesis tool
RCOut='ints_decode.v';

%Specify a file to write output
OutputFile='ints_decode_out.v';

%Specify the gate number
gateNumber=1;

%Specify the net names of all the outputs
outputs=cell(0);
outputs{1}='zsel[0]';
outputs{2}='zsel[1]';
outputs{3}='zsel[2]';
outputs{4}='csel[0]';
outputs{5}='csel[1]';
outputs{6}='csel[2]';
outputs{7}='wsel[0]';
outputs{8}='wsel[1]';
outputs{9}='pcsel[1]';
outputs{10}='pcsel[0]';
outputs{11}='stsel[0]';
outputs{12}='stsel[1]';
outputs{13}='read_strobe';
outputs{14}='write_strobe';
outputs{15}='interrupt_ack';
outputs{16}='next_interrupt_enabled';
outputs{17}='werf';
outputs{18}='wesp';
%outputs{9}='inst[16]'; %wsel[2]

%Specify the net names of all the primary inputs 
primaryInputs=cell(1,16);
primaryInputs{1}='inst[0]';
primaryInputs{2}='inst[3]';
primaryInputs{3}='inst[10]';
primaryInputs{4}='inst[11]';
primaryInputs{5}='inst[12]';
primaryInputs{6}='inst[13]';
primaryInputs{7}='inst[14]';
primaryInputs{8}='inst[15]';
primaryInputs{9}='inst[16]';
primaryInputs{10}='inst[17]';
primaryInputs{11}='clk';
primaryInputs{12}='ireset';
primaryInputs{13}='irq';
primaryInputs{14}='c';
primaryInputs{15}='z';
primaryInputs{16}='interrupt_enabled';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do Not Modify Below This Line %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Lib=createLibrary();  
fid=fopen(RCOut);

design=createDesign(1);
%Lib=createLibrary();  
while(1)
    line=fgetl(fid);
    if(line==-1)
        break;
    end
    %add me later a thing to check for white space
    gate=parseOneGate(line,Lib);
    design=addToDesign(gate,design);
end
fclose(fid);

deviceCell=cell(0);
inputCounter=cell(0);

%%%%%%%%%%%%%%%%%%%%% do for each output %%%%%%%%%

numberOfOutputs=length(outputs);
for i=1:numberOfOutputs

output=outputs{i};
fprintf('\n\n%%%%%%%% Synthesizing Output %d/%d %%%%%%%%:%s\n',i,numberOfOutputs,output); 
fprintf('Reading in design...\n');
tic;
tree=createOutputTree(output,primaryInputs,design);
toc;

fprintf('Building design...\n');
tic;
ftree=flattenTree(tree);
toc;
 
% fprintf('Checking for adder structure...\n');
% tic;
% addCheckedTree=adderCheck(ftree);
% toc;

% fp = fopen(OutputFile,'w');
status=0;
newGn=0;
% if(size(addCheckedTree))
if(0)
    fprintf('Printing adder to:%s\n',OutputFile);
    tic;
    [status,newGn]=writeAdder(addCheckedTree,fp,gateNumber);
    toc;
else
    fprintf('Optimizing tree matrix...\n');
    tic;
    [t1,t0]=kmap(ftree.table,size(ftree.table,2));
    ftree.table=[t0;t1];
    toc;
    fprintf('Creating logic...\n');
    tic;
    [status,deviceCell]=writeMatrix(ftree,deviceCell);
    toc;
end
% fclose(fp);

if(status)
    fprintf('\nSynthesis completed successfully\n');
else
    fprintf('\nError During synthesis\n');
end

%%%count frequency of each input%%%
inputCounter=inputCount(inputCounter,ftree);
end
%fprintf('New Gate Number:%d\n',newGn);
