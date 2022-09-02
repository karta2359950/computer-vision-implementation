function [ output, N] = mybwlabel (Im)

[R,C] = size(Im);
Im = [zeros(1,C+2);[zeros(R,1), Im, zeros(R,1)]];% �קKj+1�W�X��ɤβĤ@�C���@��Ʀb���W�k�[0
[R,C] = size(Im);

output_L = zeros(size(Im));

labelcnt = 0;
linked = [];

for i = 2:R                       
    for j = 2:C-1                 
        if Im(i,j) ~= 0         
            % �b�w�]�L���|���I�䦳�L�۾F
            [r,c,neighbours] = find([Im(i-1,j-1), Im(i-1,j), Im(i-1,j+1),Im(i,j-1)]==1);            
            
            % �L�۾F
            if isempty(neighbours)
                labelcnt = labelcnt+1;
                linked{labelcnt} = labelcnt; 
                output_L(i,j) = labelcnt; 
                
            %���۾F    
            else
                neighbours_label = [output_L(i-1,j-1), output_L(i-1,j), output_L(i-1,j+1),output_L(i,j-1)];
                L = neighbours_label(c);
                output_L(i,j) = min(L);
                for x = 1:length(L)
                    label = L(x);
                    linked{label} = unique([L linked{label}]);
                end
            end
        end
    end
end

% �N�}�Y�[����t��0�h��
output_L = output_L(2:end,2:end-1);

% �N���۳s��label�����Xunion
hasunion = 1;
while hasunion == 1
    change = 0;
    for i = 1:length(linked)
        for j = 1:length(linked)
            if i ~= j
                if sum(ismember(linked{i},linked{j}))>0 && sum(ismember(linked{i},linked{j})) ~= length(linked{i})                    
                    linked{i} = union(linked{i},linked{j});
                    linked{j} = linked{i};
                    change = 1;
                end
            end
        end
    end
    
    if change == 0
        hasunion = 0;
    end
end

% �N���ƪ����X����
linked = cellfun(@num2str,linked,'UniformOutput',false);
linked = unique(linked);
linked = cellfun(@str2num,linked,'UniformOutput',false);

N = length(linked);
output = zeros(size(output_L));

% �N�Ҧ��ݩ�ۦP���X��label������
for n = 1:N
    for x = 1:length(linked{n})
        output(output_L == linked{n}(x)) = n;
    end
end

end