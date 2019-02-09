student_table = studentmat;

vars = student_table.Properties.VariableNames;
for i = [1,2,4,6,9,10,11,12,16,17,18,19,20,21,22,23]
    student_table.(vars{i}) = grp2idx(student_table.(vars{i}));
end

student_array = table2array(student_table);

for i = 1: max(student_array(:,1))
    task = student_array(student_array(:,1)==i, :);
    X{i} = task(:,2:32);
    Y{i} = task(:,33);
end
save('C:\Users\Joe\Documents\University\Year 3\Individual Project\Code\Data\StudentPerformance\Formatted\t_schools','X','Y');
clear X;
clear Y;
for i = 1:3
    X{i} = student_array(:,1:30);
    Y{i} = student_array(:,30+i);
end
save('C:\Users\Joe\Documents\University\Year 3\Individual Project\Code\Data\StudentPerformance\Formatted\t_exams','X','Y');
