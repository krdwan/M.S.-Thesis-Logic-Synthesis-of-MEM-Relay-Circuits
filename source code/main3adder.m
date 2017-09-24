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
RCOut='adder3rc.v';

%Specify a file to write output
OutputFile='blah.v';

%Specify the gate number
gateNumber=1;

%Specify the net names of all the outputs
outputs=cell(0);
outputs{1}='C4';
outputs{2}='S1';
outputs{3}='S0';
outputs{4}='S2';
outputs{5}='S3';
outputs{6}='S4';
% outputs{7}='wsel[0]';
% outputs{8}='wsel[1]';
%outputs{9}='inst[16]'; %wsel[2]

%Specify the net names of all the primary inputs 
primaryInputs=cell(1,16);
primaryInputs{1}='A0';
primaryInputs{2}='A1';
primaryInputs{3}='A2';
primaryInputs{4}='B0';
primaryInputs{5}='B1';
primaryInputs{6}='B2';
primaryInputs{7}='Cin';
primaryInputs{8}='A3';
primaryInputs{9}='B3';
primaryInputs{10}='A4';
primaryInputs{11}='B4';

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
intNetIndex=0;

%%%%%%%%%%%%%%%%%%%%% do for each output %%%%%%%%%

numberOfOutputs=length(outputs);
fforest=cell(0);
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

inputCounter=inputCount(inputCounter,ftree);
fforest{length(fforest)+1}=ftree;
end

inputCounter=inputSort(inputCounter);

for i=1:numberOfOutputs
    ftree=fforest{i};
    ftree=ftreeInputFix(ftree,inputCounter);
    ftree.inputs
    
    % k mapping it
    fprintf('Optimizing tree matrix...\n');
    tic;
    [t1,t0]=kmap(ftree.table,size(ftree.table,2));
    ftree.table=[t0;t1];
    toc;
    
    % making logic
    fprintf('Creating logic...\n');
    tic;
    tempCell=cell(0);
    [status,tempCell]=writeMatrix(ftree,tempCell);
    [tempCell,intNetIndex]=prune4t(tempCell,'AA',intNetIndex);
    toc;
    
    deviceCell=cellAppender(deviceCell,tempCell);
    [deviceCell,intNetIndex]=prune4t(deviceCell,'AA',intNetIndex);
    
end


% status=0;
% newGn=0;
% % if(size(addCheckedTree))
% if(0)
%     fprintf('Printing adder to:%s\n',OutputFile);
%     tic;
%     [status,newGn]=writeAdder(addCheckedTree,fp,gateNumber);
%     toc;
% else
%     fprintf('Optimizing tree matrix...\n');
%     tic;
%     [t1,t0]=kmap(ftree.table,size(ftree.table,2));
%     ftree.table=[t0;t1];
%     toc;
%     fprintf('Creating logic...\n');
%     tic;
%     [status,deviceCell]=writeMatrix(ftree,deviceCell);
%     toc;
% end
% % fclose(fp);

if(status)
    fprintf('\nSynthesis completed successfully\n');
else
    fprintf('\nError During synthesis\n');
end

%%%count frequency of each input%%%


%fprintf('New Gate Number:%d\n',newGn);
