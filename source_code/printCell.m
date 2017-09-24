function []=printCell(inputCell)

if (isempty(inputCell))
    fprintf('Cell is empty\n');
    return;
end

blah=fieldnames(inputCell{1});

if (isequal(blah{1},'type')) %cell is a deviceCell
    fprintf('# TYPE  S  D  B  G\n');
for i=1:(length(inputCell))
    if (isempty(inputCell{i}))
        fprintf('%d EMPTY\n',i);
    else
        if (isequal(inputCell{i}.type,'4'))
    fprintf('%d %s %s %s %s %s\n',i, inputCell{i}.type, inputCell{i}.s,...
        inputCell{i}.d,inputCell{i}.b,inputCell{i}.g);
        end
        if (isequal(inputCell{i}.type,'6'))
            fprintf('%d %s %s %s %s %s ### s2:%s d2:%s\n',i, inputCell{i}.type, inputCell{i}.s1,...
        inputCell{i}.d1,inputCell{i}.b,inputCell{i}.g,inputCell{i}.s2,inputCell{i}.d2);
        end
    end
end
end

if (isequal(blah{1},'net')) %cell is a inputCount
    fprintf('# Count Net\n');
for i=1:(length(inputCell))
    fprintf('%d %d %s\n',i, inputCell{i}.count, inputCell{i}.net);
end
end

if (isequal(blah{1},'s')) %cell is a matches cell
    fprintf('# s n, devices\n');
    for i=1:length(inputCell)
        if (isempty(inputCell{i}))
            fprintf('%d EMPTY\n',i);
        else
            fprintf('%d %s %d,',i,inputCell{i}.s,inputCell{i}.n);
            disp(inputCell{i}.devices);
        end
    end
end

if (isequal(blah{1},'inputs')) %cell is a fforest
    for i=1:length(inputCell)
        fprintf('%d output: %s\ninputs(%d): ',i,inputCell{i}.outputs{1},length(inputCell{i}.inputs));
        for k=1:(length(inputCell{i}.inputs)-1)
            fprintf('%s, ',inputCell{i}.inputs{k});
        end
        fprintf('%s;\n',inputCell{i}.inputs{length(inputCell{i}.inputs)});
        [rows,cols]=size(inputCell{i}.table);
        fprintf('rows: %d, cols: %d\n\n', rows,cols);
    end
end

end
