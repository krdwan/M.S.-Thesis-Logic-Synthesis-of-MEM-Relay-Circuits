function [Lib] = createLibrary()
%a function to store the cells from the standard cell library

  %The Library
  Lib=cell(1,6);
  
  NEM_NOR2.name='NEM_NOR2';
  NEM_NOR2.inputs=cell(1,2);
  NEM_NOR2.inputs{1}='A';
  NEM_NOR2.inputs{2}='B';
  NEM_NOR2.outputs=cell(1,1);
  NEM_NOR2.outputs{1}='Y';
  NEM_NOR2.table=[0 0 1; 0 1 0; 1 0 0; 1 1 0;];
  NEM_NOR2.Dtable=[];
  NEM_NOR2.dependencies=cell(0);
  
  NEM_NAND2.name='NEM_NAND2';
  NEM_NAND2.inputs=cell(1,2);
  NEM_NAND2.inputs{1}='A';
  NEM_NAND2.inputs{2}='B';
  NEM_NAND2.outputs=cell(1,1);
  NEM_NAND2.outputs{1}='Y';
  NEM_NAND2.table=[0 0 1; 0 1 1; 1 0 1; 1 1 0;];
  NEM_NAND2.Dtable=[];
  NEM_NAND2.dependencies=cell(0);
  
  NEM_INV.name='NEM_INV';
  NEM_INV.inputs=cell(1,1);
  NEM_INV.inputs{1}='A';
  NEM_INV.outputs=cell(1,1);
  NEM_INV.outputs{1}='Y';
  NEM_INV.table=[0 1; 1 0];
  NEM_INV.Dtable=[];
  NEM_INV.dependencies=cell(0);
  
  NEM_ADDERS.name='NEM_ADDERS';
  NEM_ADDERS.inputs=cell(1,3);
  NEM_ADDERS.inputs{1}='A';
  NEM_ADDERS.inputs{2}='B';
  NEM_ADDERS.inputs{3}='Cin';
  NEM_ADDERS.outputs=cell(1,1);
  NEM_ADDERS.outputs{1}='Sum';
  NEM_ADDERS.table=[0 0 0 0; 0 0 1 1; 0 1 0 1; 0 1 1 0;...
                    1 0 0 1; 1 0 1 0; 1 1 0 0; 1 1 1 1];
  NEM_ADDERS.Dtable=[];
  NEM_ADDERS.dependencies=cell(0);
  
  NEM_ADDERC.name='NEM_ADDERC';
  NEM_ADDERC.inputs=cell(1,3);
  NEM_ADDERC.inputs{1}='A';
  NEM_ADDERC.inputs{2}='B';
  NEM_ADDERC.inputs{3}='Cin';
  NEM_ADDERC.outputs=cell(1,1);
  NEM_ADDERC.outputs{1}='Cout';
  NEM_ADDERC.table=[0 0 0 0; 0 0 1 0; 0 1 0 0; 0 1 1 1;...
                    1 0 0 0; 1 0 1 1; 1 1 0 1; 1 1 1 1];  
  NEM_ADDERC.Dtable=[];
  NEM_ADDERC.dependencies=cell(0);
  
  NEM_MUX2.name='NEM_MUX2';
  NEM_MUX2.inputs=cell(1,3);
  NEM_MUX2.inputs{1}='A';
  NEM_MUX2.inputs{2}='B';
  NEM_MUX2.inputs{3}='S';
  NEM_MUX2.outputs=cell(1,1);
  NEM_MUX2.outputs{1}='Y';
  NEM_MUX2.table=[0 0 0 0; 0 0 1 0; 0 1 0 0; 0 1 1 1;...
                  1 0 0 1; 1 0 1 0; 1 1 0 1; 1 1 1 1];  
  NEM_MUX2.Dtable=[];
  NEM_MUX2.dependencies=cell(0);
  
  NEM_XOR4.name='NEM_XOR4';
  NEM_XOR4.inputs=cell(1,4);
  NEM_XOR4.inputs{1}='A';
  NEM_XOR4.inputs{2}='B';
  NEM_XOR4.inputs{3}='C';
  NEM_XOR4.inputs{4}='D';
  NEM_XOR4.outputs=cell(1,1);
  NEM_XOR4.outputs{1}='Out';
  NEM_XOR4.table=[0 0 0 0 0; 0 0 0 1 1; 0 0 1 0 1; 0 0 1 1 0;...
                  0 1 0 0 1; 0 1 0 1 0; 0 1 1 0 0; 0 1 1 1 1;...
                  1 0 0 0 1; 1 0 0 1 0; 1 0 1 0 0; 1 0 1 1 1;...
                  1 1 0 0 0; 1 1 0 1 1; 1 1 1 0 1; 1 1 1 1 0];
              
  NEM_XOR2.name='NEM_XOR2';
  NEM_XOR2.inputs=cell(1,2);
  NEM_XOR2.inputs{1}='A';
  NEM_XOR2.inputs{2}='B';
  NEM_XOR2.outputs=cell(1,1);
  NEM_XOR2.outputs{1}='Sum';
  NEM_XOR2.table=[0 0 0; 0 1 1; 1 0 1; 1 1 0;];
  
  NEM_AND2.name='NEM_AND2';
  NEM_AND2.inputs=cell(1,2);
  NEM_AND2.inputs{1}='A';
  NEM_AND2.inputs{2}='B';
  NEM_AND2.outputs=cell(1,1);
  NEM_AND2.outputs{1}='Y';
  NEM_AND2.table=[0 0 0; 0 1 0; 1 0 0; 1 1 1;];
  
  NEM_OR2.name='NEM_OR2';
  NEM_OR2.inputs=cell(1,2);
  NEM_OR2.inputs{1}='A';
  NEM_OR2.inputs{2}='B';
  NEM_OR2.outputs=cell(1,1);
  NEM_OR2.outputs{1}='Y';
  NEM_OR2.table=[0 0 0; 0 1 1; 1 0 1; 1 1 1;];
  
  NEM_AND4.name='NEM_AND4';
  NEM_AND4.inputs=cell(1,4);
  NEM_AND4.inputs{1}='A';
  NEM_AND4.inputs{2}='B';
  NEM_AND4.inputs{3}='C';
  NEM_AND4.inputs{4}='D';
  NEM_AND4.outputs=cell(1,1);
  NEM_AND4.outputs{1}='Out';
  NEM_AND4.table=[0 0 0 0 0; 0 0 0 1 0; 0 0 1 0 0; 0 0 1 1 0;...
                  0 1 0 0 0; 0 1 0 1 0; 0 1 1 0 0; 0 1 1 1 0;...
                  1 0 0 0 0; 1 0 0 1 0; 1 0 1 0 0; 1 0 1 1 0;...
                  1 1 0 0 0; 1 1 0 1 0; 1 1 1 0 0; 1 1 1 1 1];
              
  NEM_OR4.name='NEM_OR4';
  NEM_OR4.inputs=cell(1,4);
  NEM_OR4.inputs{1}='A';
  NEM_OR4.inputs{2}='B';
  NEM_OR4.inputs{3}='C';
  NEM_OR4.inputs{4}='D';
  NEM_OR4.outputs=cell(1,1);
  NEM_OR4.outputs{1}='Out';
  NEM_OR4.table= [0 0 0 0 0; 0 0 0 1 1; 0 0 1 0 1; 0 0 1 1 1;...
                  0 1 0 0 1; 0 1 0 1 1; 0 1 1 0 1; 0 1 1 1 1;...
                  1 0 0 0 1; 1 0 0 1 1; 1 0 1 0 1; 1 0 1 1 1;...
                  1 1 0 0 1; 1 1 0 1 1; 1 1 1 0 1; 1 1 1 1 1];
              
  NEM_AND3.name='NEM_AND3';
  NEM_AND3.inputs=cell(1,3);
  NEM_AND3.inputs{1}='A';
  NEM_AND3.inputs{2}='B';
  NEM_AND3.inputs{3}='Cin';
  NEM_AND3.outputs=cell(1,1);
  NEM_AND3.outputs{1}='Sum';
  NEM_AND3.table=[0 0 0 0; 0 0 1 0; 0 1 0 0; 0 1 1 0;...
                  1 0 0 0; 1 0 1 0; 1 1 0 0; 1 1 1 1];  
                
  NEM_OR3.name='NEM_OR3';
  NEM_OR3.inputs=cell(1,3);
  NEM_OR3.inputs{1}='A';
  NEM_OR3.inputs{2}='B';
  NEM_OR3.inputs{3}='Cin';
  NEM_OR3.outputs=cell(1,1);
  NEM_OR3.outputs{1}='Sum';
  NEM_OR3.table=[0 0 0 0; 0 0 1 1; 0 1 0 1; 0 1 1 1;...
                 1 0 0 1; 1 0 1 1; 1 1 0 1; 1 1 1 1];    
                
  Lib{1}= NEM_NOR2;
  Lib{2}= NEM_NAND2;
  Lib{3}= NEM_INV;
  Lib{4}= NEM_ADDERS;
  Lib{5}= NEM_ADDERC;
  Lib{6}= NEM_MUX2;
  Lib{7}= NEM_XOR4;
  Lib{8}= NEM_XOR2;
  Lib{9}= NEM_AND2;
  Lib{10}=NEM_OR2;
  Lib{11}=NEM_AND4;
  Lib{12}=NEM_OR4;
  Lib{13}=NEM_AND3;
  Lib{14}=NEM_OR3;