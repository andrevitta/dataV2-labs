# Challenge 1 - Who Have Published What At Where?

SELECT 
    authors.au_id, au_lname, au_fname, titles.title, p.pub_name
FROM
    authors
        INNER JOIN
    titleauthor t ON t.au_id = authors.au_id
        INNER JOIN
    titles ON titles.title_id = t.title_id
        INNER JOIN
    publishers p on p.pub_id = titles.pub_id
;

# Challenge 2 - Who Have Published How Many At Where?

SELECT 
    authors.au_id, au_lname, au_fname, p.pub_name, count(authors.au_id) as 'Title Count'
FROM
    authors
        INNER JOIN
    titleauthor t ON t.au_id = authors.au_id
        INNER JOIN
    titles ON titles.title_id = t.title_id
		INNER JOIN
    publishers p on p.pub_id = titles.pub_id
group by authors.au_id
;

# Challenge 3 - Best Selling Authors
SELECT 
    distinct authors.au_id , au_lname, au_fname, sum(s.qty) as Total
FROM
    authors
        INNER JOIN
    titleauthor t ON t.au_id = authors.au_id
        INNER JOIN
    sales s on s.title_id = t.title_id
group by authors.au_id 
order by Total desc
limit 3
;

# Challenge 4 - Best Selling Authors Ranking
SELECT 
    distinct authors.au_id , au_lname, au_fname, sum(s.qty) as Total
FROM
    authors
        left JOIN
    titleauthor t ON t.au_id = authors.au_id
        left JOIN
    sales s on s.title_id = t.title_id
group by authors.au_id 
order by Total desc
;




