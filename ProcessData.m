function newdata = ProcessData(data)

% sort data by damage descending then opponent meter ascending
data = sortrows(data,[-2,4]);

% if the damage and meter mitigation is worse that the previous value, 
% remove the current value
i = 2;

while i <= length(data)
   if data{i,2} <= data{i-1,2} && data{i,4} >= data{i-1,4}
       data(i,:) = [];
       continue
   end
   i=i+1;
end

% copy to output
newdata = data;

end