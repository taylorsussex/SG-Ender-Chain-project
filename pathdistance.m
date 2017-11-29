function dist = pathdistance(p, d)
% p = path to evaluate distance of
% d = digraph to analyse

% convert tables to arrays for easier access
names = table2array(d.Nodes);
edges = table2cell(d.Edges);

dist = 0;

% cycle through the steps of the path
for i = 1:length(p)-1
    
    % create cell array decscribing current edge
    currentedge = cellstr([names(p(i)), names(p(i+1))]);
    
    % compare currentedge with cell arrays decscribing edges in graph
    for j = 1:length(edges)
        if isequal(currentedge,edges{j,1})
            break
        end
    end
    
    % add weight of current path edge to total 
    dist = dist + edges{j,2};
    
end
return
