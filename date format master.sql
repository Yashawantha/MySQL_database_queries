-- date format change 20230101 to "2023-01-01"

from_unixtime(unix_timestamp(cast (sale.order_date_key as string),'yyyyMMdd'),'yyyy-MM-dd')

-- getting first day of the MONTH

date_add(last_day(add_months(order_date_time,-1)),-1)


-- Dynamic DATE

to_date(sales.order_date_time) >= date_format(current_date - interval "1" year, "yyyy-MM-dd") and to_date(sales.order_date_time) <= current_date

to_date(sales.order_date_time) >= date_format(current_date - interval "7" month, "yyyy-MM-dd") and to_date(sales.order_date_time) <= current_date


-- Month diff from current MONTH
abs(cast(months_between(to_date(order_date_time), current_date)as int)) as Month_age


-- Date diff in days
datediff(to_date(sales.order_date_time), to_date(sales.delivered_date))

--date "2023-01-01" to 20230101
lookup_date(order_date_time)

--dynamic DATE

to_date(sale.order_date_time) >= to_date(date_sub(current_date,60)) and to_date(sales.order_date_time) <= current_dates
