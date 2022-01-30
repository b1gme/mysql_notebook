#like 的使用
# % 可以代替任何数量的字符
select * from my_contacts where location like '%CA';#找到所有以CA结尾的值
# _ 但是仅代表一个未知的字符
select first_name from my_contacts where first_name like '_im';
#between 的使用 等价于>= 和 <=
select drink_name from drink_info where calories between 30 and 60;
select drink_name from drink_info where drink_name between 'G' and 'O';
select drink_name from drink_info where calories between 60 and 30;(这个结果无法得到任何结果，顺序错误，小大)
#in 关键字使用
select data_name from black_book where rating in ('innovative','fabulous','delightful','pretty good');
# not 关键字 not跟在where的后面，当使用and 或者or时，not都放在它们的后面
select data_name from black_book where rating not in ('innovative','fabulous','delightful','pretty good');
select drink_name from drink_info where not carbs between 3 and 5;
select data_name from black_book where not data_name like 'A%' and not data_name like 'B%';
# not 总是在where后面存在特例
select * from easy_drinks where not main in ('soda','iced tea');
select * from easy_drinks where  main not in ('soda','iced tea');
#上诉的两者等价
#<>f符号表示不等于 not <> 等价于=
#NULL关键字使用
select * from easy_drinks where not main is null;
select * from easy_drinks where main  is not null;
#数据库无法根据数据的顺序能得到最新的数据
#delete 的正确使用
delete from clown_info where activities = 'dancing'; #记得加上where要不然数据都会被删除
#1、delete无法删除单个值，必须是整条数据或者多行数据
# delete from table_A 这行语句会删除整个表的数据，需要谨慎~
删除操作，首先需要插入数据，然后删除数据
#做删除操作，可以先where找到数据，然后删除
#update 只是更新需要改变的某一列的值
update doughhut_ratings set type = 'glazed' where type = 'plain glazed';
update your_table set first_column = 'newvalue',second_column = 'another_value';
#update 不仅可以修改列的值大小，还可以更新列名。
#若将where语句省略，表中的每一行数据都改成set后面的语句了
#怕更新错错误，可以巧妙的使用where语句