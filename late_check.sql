-- trade is late when occurs 30 days after the end of the month in which you would have been paid
-- if paid 2022-3-6, then trade is late if occurs after 2022-4-30

Select trade_date, pay_date, DATE_ADD(LAST_DAY(pay_date), interval 30 day) as due_date,
	CASE WHEN trade_date > DATE_ADD(LAST_DAY(pay_date), interval 30 day) 
		THEN 'Late' ELSE 'On time' END as status
From 2022_contributions
Where Transaction = 'Contribution'

UNION

Select trade_date, pay_date, DATE_ADD(LAST_DAY(pay_date), interval 30 day) as due_date,
	CASE WHEN trade_date > DATE_ADD(LAST_DAY(pay_date), interval 30 day) 
		THEN 'Late' ELSE 'On time' END as status
From 2021_contributions
Where Transaction = 'Contribution'

UNION

Select trade_date, pay_date, DATE_ADD(LAST_DAY(pay_date), interval 30 day) as due_date,
	CASE WHEN trade_date > DATE_ADD(LAST_DAY(pay_date), interval 30 day) 
		THEN 'Late' ELSE 'On time' END as status
From 2020_contributions
Where Transaction = 'Contribution'