# Challenge 1 - Most Profiting Authors
select 
	step2.au_id,
	(t.advance * ta.royaltyper / 100) + total_royalty as Profit
from (
select 
	title_id,
    au_id,
    sum(sales_royalty) as total_royalty
	from (SELECT
    ta.title_id,
    ta.au_id,
    (t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sales_royalty
from 
	titleauthor ta
    inner join  
    titles t on t.title_id = ta.title_id
    inner join 
    sales s on t.title_id = s.title_id    
        ) as step1
group by title_id,au_id
) as step2
inner join 
titles t on t.title_id = step2.title_id
inner join 
titleauthor ta on ta.au_id = step2.au_id
order by Profit desc
limit 3;  

####################################################################"  
# Step 1
create temporary table if not exists step1
SELECT
    ta.title_id,
    ta.au_id,
    (t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sales_royalty
from 
	titleauthor ta
    inner join  
    titles t on t.title_id = ta.title_id
    inner join 
    sales s on t.title_id = s.title_id
;

# step 2
create temporary table if not exists step2
select 
	title_id,
    au_id,
    sum(sales_royalty) as total_royalty
from
	step1
group by title_id,au_id;

# step 3

select 
	step2.au_id,
    t.title_id,
	(t.advance * ta.royaltyper / 100) + total_royalty as Profit
from
	step2
inner join 
titles t on t.title_id = step2.title_id
inner join 
titleauthor ta on ta.au_id = step2.au_id
order by Profit desc
limit 3;
