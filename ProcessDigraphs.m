function data = ProcessDigraphs(dmg,mtr,opp_mtr)

paths = pathbetweennodes(adjacency(dmg),1,height(dmg.Nodes),false);

damage = paths;
meter = paths;
opp_meter = paths;
chains = paths;

for i = 1:length(paths)
    
    damage{i} = pathdistance(paths{i},dmg);
    meter{i} = pathdistance(paths{i},mtr);
    opp_meter{i} = pathdistance(paths{i},opp_mtr);
    
    currentpath = cell(1,length(paths{i})-2);
    pathstring = [];
    
    for j = 1:length(currentpath)
        currentpath{j} = dmg.Nodes{paths{i}(j+1),'Name'};
        pathstring = [pathstring,strjoin(currentpath{j}),' '];
    end
    
    chains{i} = pathstring(1:end-1);
    
end

data = horzcat(chains,damage,meter,opp_meter);

end