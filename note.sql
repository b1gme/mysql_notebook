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
<<<<<<< HEAD
##比较难里理解
select data_name from black_book where not data_name like 'A%' and not data_name like 'B%';
select data_name from black_book where  data_name not between 'A%' and  'B%';

=======
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
update drink_info set cost = 3.5 where drink_name = 'Blue Moon';
#需要注意where 后面需要是可以区分的数据（unique） 
#mysql可以对数字行进行简单的数学计算
update drink_info set cost = cost + 1 ;(这个分号需要验证)
where drink_name='Blue Moon' or drink_name='Oh My Gosh' or drink_name='Lime Fizz';
#update 可以用来执行多行记录，并且可以对数字进行简单的数学运算
=====
#2022年5月7日 为了成程家
#执行mysql脚本
#方法一：进入mysql的控制台，使用source命令执行
use database_name;
source source C:\Users\BigMe\Desktop\populate.sql
#方法二：使用cmd命令执行
mysql –uroot –p123456 -Dtest<d:\test\ss.sql
#查询mysql完整的命令选项和参数列表可用mysql --help
#输入help select 获得使用select语句的帮助
#describe table_name 等价于show columns from table_name；
#许多SQL开发人员喜欢对所有SQL关键字使用大写，而对所有列和表名使用小写，这样做使代码更易于阅读和调试。
#使用*检索（检索不需要的列）通常会降低检索和应用程序的性能；
#DISTINCT 关键字指示MYSQL只返回不同的值；
#使用DISTINCT关键字，它必须直接放在列名的前面；若给出SELECT DISTINCT vend_id,prod_price，除非指定的两个列不同，否则所有行
#都将被检索出来
#为了返回第一行或者前几行，可使用limit子句
#LIMIT 5,5 第一个5表示开始的行，第二个5表示返回的行数
SELECT prod_name FROM products LIMIT 5:
#行 0 检索出来的第一行为行0而不是行1，因此，LIMIT 1,1将检索出第二行而不是第一行
#为了明确地排序用SELECT语句检索出的数据，可使用ORDER BY,ORDER BY子句取一个或多个列的名字；
#ORDER BY 不用非得使用需要显示的数据来进行排序（通过非选择列进行排序），ORDER BY 能实现对一个列或者多个列上的数据排序
#例子（升序ASC；降序DESC）
SELECT prod_id, prod_price, prod_name
    -> FROM products
    -> ORDER BY prod_price DESC, prod_name;
#返回最大的一行
mysql> SELECT prod_price
    -> FROM products
    -> ORDER BY prod_price DESC
    -> LIMIT 1;
#使用ORDER BY 是必须保证ORDER BY 在FROM 子句之后，如果使用LIMIT，那么它必须位于ORDER BY之后；
#WHERE 子句的位置：在同时使用ORDER BY 和WHERE子句时，应该让 ORDER BY 位于 WHERE 之后，否则将会产生错误
# MYSQL 在执行匹配时默认不区分大小写
#使用 BETWEEN关键字进行检索时，需要配合 AND 来使用
#例子
 mysql> select prod_name, prod_price
    -> from products
    -> where prod_price between 5 and 10;
# NULL 与字段包含0、空字符串或仅仅包含空格不同
例子
 select cust_id from customers where cust_email is null;
 #每添加一个条件就要使用一个and
 select prod_id, prod_price, prod_name from products where vend_id = 1003 and prod_price <= 10;
 #or where子句中使用的关键字，用来表示检索匹配任意给定条件的行
#假如需要列出价格为10美元（含）以上且由1002或1003制造的所有产品。（以下例子是错误的）
select prod_name, prod_price from products where vend_id =1002 or vend_id = 1003 and prod_price >= 10;
#上诉例子是错误的，and 的使用优先级是高于or的。要想真确的实现上述操作，可以添加一个括号，如下所示
select prod_name, prod_price from products where （vend_id =1002 or vend_id = 1003） and prod_price >= 10;
#IN 操作符可以指定括号内的条件进行匹配，每个条件用逗号隔开
#in操作符和or操作符具有相同的功能
select prod_name, prod_price from products where vend_id in (1002,1003) order by prod_name;
select prod_name, prod_price from products where vend_id = 1002 or vend_id = 1003  order by prod_name;
上述例子返回的结果一样
in 相对于or 的优势有：
1、使用较长的条件时，in语句的语法更清晰且直观
2、使用in的计算次序更容易管理（因为使用的操作符更少）
3、in操作符一般比or操作符清单执行更快
4、in最大的优点是可以包含其他select语句，使得能够更动态地建立where子句
#where子句中的not只有一个功能，就是否定它之后所跟的任何条件
 select prod_name, prod_price from products where vend_id not in (1002,1003) order by prod_name;
#上述例子返回的是除vend_id=1002,1003以外的所有供应商的id
#在 where 子句中的not在复杂的子句中非常有效，在与in操作符联合使用是，not使找出条件列表不匹配的行非常容易
#mysql中的not mysql支持使用not对in、between和exists子句取反，这与多数其他DBMS允许是哟个not对各种条件取反有很大的差别
#使用like操作符在句子中使用通配符,like是利用通配符匹配而不是直接相等匹配；
#在搜索串中，%表示任何字符出现的任意次数
#通配符可在搜索模式中任意位置使用，并且可以使用多个通配符；
select prod_id, prod_name from products where prod_name like 'jet%'
select prod_id,prod_name from products where prod_name like '%anvil%'
#搜索模式'%anvil%'表示匹配任何位置包含文本anvil的值，而不论它之前或之后出现什么字符；
select prod_name from products where prod_name like 's%e';
#%通配符除了匹配一个或者多个字符外，还能匹配0个字符，%代表搜索模式中给定位置的0个、1个或多个字符
#注意尾空格，最好是使用函数去掉空格，或者在匹配字符后加上%通配符
# % 通配符无法匹配NULL
# — 通配符只能匹配单个字符
select prod_name, prod_id from products where prod_name like '_ ton anvil';
#注意 通配符搜索的处理一般要比其它的搜索所花的时间更长
#不要过度使用通配符，尽量使用操作符
#在确认一定要使用通配符时，除非绝对有必要，否者不要把它们用在搜索模式的开始处，，把通配符置于搜索模式的开始处，搜索
起来是最慢的
#仔细注意通配符的位置，如果放错地方，可能不会返回想要的数据。
