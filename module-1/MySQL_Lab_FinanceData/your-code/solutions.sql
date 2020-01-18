use finance;
# Challenge 1 - What is the most successful district?

select district_id, count(distinct account_id) as ac_freq from account group by district_id order by ac_freq desc;

# Challenge 2 - How many people changed their place of residence?

select account_id, group_concat(distinct bank_to), count( amount ) as diff, group_concat(distinct amount) as rent from finance.order where k_symbol='SIPO'  group by account_id having diff>1 order by diff desc;

#####################################################################################"
# Challenge 3 - Best Selling Districts

# see solution

#################################################################################
#Challenge 4 - Best Selling Districts UPDATED

# get code  

# Challenge 5 - Best Selling Districts UPDATED

#
