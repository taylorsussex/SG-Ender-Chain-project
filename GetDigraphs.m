function [dmg,mtr,opp_mtr] = GetDigraphs(filename)

[num,txt,raw] = xlsread(filename);

edgeinfo = cell(length(num),1);
edgesum = 0;

for i = 1:length(num)-1
    if ischar(raw{i+1,6})
        currentnode = str2double(strsplit(raw{i+1,6},','));
    else
        currentnode = raw{i+1,6};
    end
    edgeinfo{i} = currentnode;
    edgesum = edgesum + length(currentnode);
end

s = zeros(1,edgesum);
t = s;
dmg_w = s;
mtr_w = s;
opp_mtr_w = s;
currentedge = 1;
names = cell(1,length(num));

for i = 1:length(num)
    
    currentnode = edgeinfo{i};
    if ~isempty(currentnode)
        for j = 1:length(currentnode)
            s(currentedge) = i;
            t(currentedge) = currentnode(j);
            dmg_w(currentedge) = num(currentnode(j),3);
            mtr_w(currentedge) = num(currentnode(j),4);
            opp_mtr_w(currentedge) = num(currentnode(j),5);
            currentedge = currentedge+1;
        end
    end
    
    names{i} = txt{i+1,2};
    
end

dmg = digraph(s,t,dmg_w, names);
mtr = digraph(s,t,mtr_w, names);
opp_mtr = digraph(s,t,opp_mtr_w, names);

end