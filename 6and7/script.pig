u_data = LOAD 'hdfs://aai07server:9000/input/movies/u.data' USING PigStorage('\t') as (userID:int, itemID:int, rating:int, unix_timestamp:int);

u_data_group = GROUP u_data BY itemID;

avg_rating = FOREACH u_data_group GENERATE FLATTEN(u_data.itemID), AVG(u_data.rating) as avg_u_data;

avg_rating_sort = ORDER avg_rating BY u_data.itemID DESC;

limit_avg_rating = LIMIT avg_rating_sort 20;

STORE limit_avg_rating INTO 'hdfs://aai07server:9000/output/movies/pig_Output' USING PigStorage (',');

filter_data = FILTER avg_rating BY avg_u_data <= 1.5;

filter_group = GROUP filter_data BY itemID;
count_item = FOREACH filter_group GENERATE COUNT(filter_data.avg_u_data) as count_data;
count_group = GROUP count_item ALL;
total_item = FOREACH count_group GENERATE SUM(count_item.count_data);
STORE total_item INTO 'hdfs://aai07server:9000/output/movies/pig_total_item';
