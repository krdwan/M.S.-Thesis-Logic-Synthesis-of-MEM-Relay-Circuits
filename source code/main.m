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
% RCOut='ints_decode.v';
RCOut='sevenThree.rc.v';
% RCOut='ints_decode.v';
RCOut='Circuit74181b.rc';
% RCOut='Circuit74182.rc';
RCOut='adder3rc.v';
% RCOut='./circuit74181/Summodule.rc';
% RCOut='./circuit74181/EDCLA.rc';
% RCOut='./circuit74181/CLASum.rc';



%Specify a file to write output
OutputFile='multBase6_MEMS.v';

%Specify the gate number
gateNumber=1;

%Specify the net names of all the outputs
outputs=cell(0);
% outputs{1}='Prod[0]';
% outputs{2}='Prod[1]';
% outputs{3}='Prod[2]';
% outputs{4}='Prod[3]';
% outputs{5}='Prod[4]';
% outputs{6}='Prod[5]';
% outputs{7}='Prod[6]';
% outputs{8}='Prod[7]';
% outputs{1}='Z[0]';
% outputs{2}='Z[1]';
% outputs{3}='Z[2]';
outputs{1}='S0';
outputs{2}='S1';
outputs{3}='C1';
% outputs{4}='S3';
% outputs{5}='C3';

% outputs{4}='Z[3]';
% outputs{5}='Z[4]';
% outputs{6}='Z[5]';
% outputs{7}='Z[6]';
% outputs{8}='Z[7]';
% outputs{9}='Z[8]';
% outputs{10}='Z[9]';
% outputs{11}='Z[10]';
% outputs{12}='Z[11]';
% outputs{1}='zsel[0]';
% outputs{2}='zsel[1]';
% outputs{3}='zsel[2]';
% outputs{4}='csel[0]';
% outputs{5}='csel[1]';
% outputs{6}='csel[2]';
% outputs{7}='wsel[0]';
% outputs{8}='wsel[1]';
% outputs{9}='pcsel[1]';
% outputs{10}='pcsel[0]';
% outputs{11}='stsel[0]';
% outputs{12}='stsel[1]';
% outputs{13}='read_strobe';
% outputs{14}='write_strobe';
% outputs{15}='interrupt_ack';
% outputs{16}='next_interrupt_enabled';
% outputs{17}='werf';
% outputs{18}='wesp';
%outputs{9}='inst[16]'; %wsel[2]

%Specify the net names of all the primary inputs 
primaryInputs=cell(0);
% primaryInputs{1}='In[0]';
% primaryInputs{2}='In[1]';
% primaryInputs{3}='In[2]';
% primaryInputs{4}='In[3]';
% primaryInputs{5}='In[4]';
% primaryInputs{6}='In[5]';
% primaryInputs{7}='In[6]';
primaryInputs{1}='A0';
primaryInputs{2}='A1';
primaryInputs{3}='B0';
primaryInputs{4}='B1';
primaryInputs{5}='Cin';
% primaryInputs{6}='B1';
% primaryInputs{7}='B2';
% primaryInputs{8}='B3';
% primaryInputs{9}='Cin';
% primaryInputs{10}='B[5]';
% primaryInputs{11}='A[4]';
% primaryInputs{12}='A[5]';
% primaryInputs{1}='inst[0]';
% primaryInputs{2}='inst[3]';
% primaryInputs{3}='inst[10]';
% primaryInputs{4}='inst[11]';
% primaryInputs{5}='inst[12]';
% primaryInputs{6}='inst[13]';
% primaryInputs{7}='inst[14]';
% primaryInputs{8}='inst[15]';
% primaryInputs{9}='inst[16]';
% primaryInputs{10}='inst[17]';
% primaryInputs{11}='clk';
% primaryInputs{12}='ireset';
% primaryInputs{13}='irq';
% primaryInputs{14}='c';
% primaryInputs{15}='z';
% primaryInputs{16}='interrupt_enabled';

%Specify the net names of all the outputs
% outputs=cell(0);
% outputs{1}='C5';
% outputs{2}='S1';
% outputs{3}='S0';
% outputs{4}='S2';
% outputs{5}='S3';
% outputs{6}='S4';
% outputs{7}='S5';
% outputs{7}='wsel[0]';
% outputs{8}='wsel[1]';
%outputs{9}='inst[16]'; %wsel[2]


% primaryInputs{1}='A[0]';
% primaryInputs{2}='A[1]';
% primaryInputs{3}='A[2]';
% primaryInputs{4}='A[3]';
% primaryInputs{5}='B[0]';
% primaryInputs{6}='B[1]';
% primaryInputs{7}='B[2]';
% primaryInputs{8}='B[3]';
% primaryInputs{9}='S[0]';
% primaryInputs{10}='S[1]';
% primaryInputs{11}='S[2]';
% primaryInputs{12}='S[3]';
% primaryInputs{13}='M';
% primaryInputs{14}='CNb';
% 
% outputs=cell(0);
% outputs{1}='CN4b';
% outputs{2}='Y';
% outputs{3}='X';
% outputs{4}='F[0]';
% outputs{5}='F[1]';
% outputs{6}='F[2]';
% outputs{7}='F[3]';
% outputs{8}='AEB';


% circuit 74182
% primaryInputs{1}='CN';
% primaryInputs{2}='PB[3]';
% primaryInputs{3}='PB[2]';
% primaryInputs{4}='PB[1]';
% primaryInputs{5}='PB[0]';
% primaryInputs{6}='GB[3]';
% primaryInputs{7}='GB[2]';
% primaryInputs{8}='GB[1]';
% primaryInputs{9}='GB[0]';
% outputs{1}='PBo';
% outputs{2}='GBo';
% outputs{3}='CNX';
% outputs{4}='CNY';
% outputs{5}='CNZ';

% E module
% primaryInputs{1}='A[0]';
% primaryInputs{2}='A[1]';
% primaryInputs{3}='A[2]';
% primaryInputs{4}='A[3]';
% primaryInputs{5}='B[0]';
% primaryInputs{6}='B[1]';
% primaryInputs{7}='B[2]';
% primaryInputs{8}='B[3]';
% % primaryInputs{9}='CNb';
% primaryInputs{9}='S[0]';
% primaryInputs{10}='S[1]';
% primaryInputs{11}='S[2]';
% primaryInputs{12}='S[3]';
% primaryInputs{13}='CNb';
% outputs{1}='C[0]';
% outputs{2}='C[1]';
% outputs{3}='C[2]';
% outputs{4}='C[3]';
% outputs{5}='E[0]';
% outputs{6}='E[1]';
% outputs{7}='E[2]';
% outputs{8}='E[3]';
% outputs{9}='D[0]';
% outputs{10}='D[1]';
% outputs{11}='D[2]';
% outputs{12}='D[3]';
% % outputs{5}='X';
% % outputs{6}='Y';
% % outputs{7}='CN4b';

% Summodule
% primaryInputs{1}='E[0]';
% primaryInputs{2}='E[1]';
% primaryInputs{3}='E[2]';
% primaryInputs{4}='E[3]';
% primaryInputs{5}='D[0]';
% primaryInputs{6}='D[1]';
% primaryInputs{7}='D[2]';
% primaryInputs{8}='D[3]';
% % primaryInputs{9}='CNb';
% % primaryInputs{9}='C[0]';
% % primaryInputs{10}='S[1]';
% % primaryInputs{11}='S[2]';
% % primaryInputs{12}='S[3]';
% primaryInputs{9}='M';
% primaryInputs{10}='CNb';
% outputs{1}='F[0]';
% outputs{2}='F[1]';
% outputs{3}='F[2]';
% outputs{4}='F[3]';
% % outputs{5}='AEB';
% outputs{5}='X';
% outputs{6}='Y';
% outputs{7}='CN4b';


% primaryInputs{1}='F[0]';
% primaryInputs{2}='F[1]';
% primaryInputs{3}='F[2]';
% primaryInputs{4}='F[3]';
% outputs{1}='AEB';

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
    fforest{i}=ftree; %for debugging purposes
    ftree.inputs
    
    % k mapping it
%     fprintf('Optimizing tree matrix...\n');
%     tic;
%     [t1,t0]=kmap(ftree.table,size(ftree.table,2));
%     ftree.table=[t0;t1];
%     toc;
    
    % making logic
    fprintf('Creating logic...\n');
    tic;
    tempCell=cell(0);
    [status,tempCell]=writeMatrix(ftree,tempCell,strcat('BB_',num2str(intNetIndex),'_3'));
    intNetIndex=intNetIndex+1;
    [tempCell,intNetIndex]=prune4t(tempCell,'AA',intNetIndex,outputs);
    toc;
    
    deviceCell=cellAppender(deviceCell,tempCell);

    
end

%combine all deviceCells
    [deviceCell,intNetIndex]=prune4t(deviceCell,'AA',intNetIndex,outputs);

% outputVerilog(deviceCell,'CLASum_MEMS.v',1);

if(status)
    fprintf('\nSynthesis completed successfully\n');
else
    fprintf('\nError During synthesis\n');
end

%%%count frequency of each input%%%
