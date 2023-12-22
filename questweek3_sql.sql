/* SELECT column1, column2,
       LEAD(column3, 1) OVER (ORDER BY column4) AS next_value,
       LAG(column3, 1) OVER (ORDER BY column4) AS prev_value
FROM tablename; */

use sustainable_var
select * from forest_area;
drop table co2_melted;
create table co2_melted as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as co2_emissions from co2_emissions
union all
select economy, 2011 as "year", yr2011 as indicator from co2_emissions
union all
select economy, 2012 as "year", yr2012 as indicator from co2_emissions
union all
select economy, 2013 as "year", yr2013 as indicator from co2_emissions
union all
select economy, 2014 as "year", yr2014 as indicator from co2_emissions
union all
select economy, 2015 as "year", yr2015 as indicator from co2_emissions
union all
select economy, 2016 as "year", yr2016 as indicator from co2_emissions
union all
select economy, 2017 as "year", yr2017 as indicator from co2_emissions
union all
select economy, 2018 as "year", yr2018 as indicator from co2_emissions
union all
select economy, 2019 as "year", yr2019 as indicator from co2_emissions
union all
select economy, 2020 as "year", yr2020 as indicator from co2_emissions;

drop table nr_depletion_melted;
create table nr_depletion_melted as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as natural_res_depletion from natural_resources_depletion
union all
select economy, 2011 as "year", yr2011 as indicator from natural_resources_depletion
union all
select economy, 2012 as "year", yr2012 as indicator from natural_resources_depletion
union all
select economy, 2013 as "year", yr2013 as indicator from natural_resources_depletion
union all
select economy, 2014 as "year", yr2014 as indicator from natural_resources_depletion
union all
select economy, 2015 as "year", yr2015 as indicator from natural_resources_depletion
union all
select economy, 2016 as "year", yr2016 as indicator from natural_resources_depletion
union all
select economy, 2017 as "year", yr2017 as indicator from natural_resources_depletion
union all
select economy, 2018 as "year", yr2018 as indicator from natural_resources_depletion
union all
select economy, 2019 as "year", yr2019 as indicator from natural_resources_depletion
union all
select economy, 2020 as "year", yr2020 as indicator from natural_resources_depletion;

drop table r_energy_melted;
create table r_energy_melted as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as ren_energy_consumption from renewable_energy_consumption
union all
select economy, 2011 as "year", yr2011 as indicator from renewable_energy_consumption
union all
select economy, 2012 as "year", yr2012 as indicator from renewable_energy_consumption
union all
select economy, 2013 as "year", yr2013 as indicator from renewable_energy_consumption
union all
select economy, 2014 as "year", yr2014 as indicator from renewable_energy_consumption
union all
select economy, 2015 as "year", yr2015 as indicator from renewable_energy_consumption
union all
select economy, 2016 as "year", yr2016 as indicator from renewable_energy_consumption
union all
select economy, 2017 as "year", yr2017 as indicator from renewable_energy_consumption
union all
select economy, 2018 as "year", yr2018 as indicator from renewable_energy_consumption
union all
select economy, 2019 as "year", yr2019 as indicator from renewable_energy_consumption
union all
select economy, 2020 as "year", yr2020 as indicator from renewable_energy_consumption;


drop table water_depletion_melt;
create table water_depletion_melt as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as water_depletion from water_depletion
union all
select economy, 2011 as "year", yr2011 as indicator from water_depletion
union all
select economy, 2012 as "year", yr2012 as indicator from water_depletion
union all
select economy, 2013 as "year", yr2013 as indicator from water_depletion
union all
select economy, 2014 as "year", yr2014 as indicator from water_depletion
union all
select economy, 2015 as "year", yr2015 as indicator from water_depletion
union all
select economy, 2016 as "year", yr2016 as indicator from water_depletion
union all
select economy, 2017 as "year", yr2017 as indicator from water_depletion
union all
select economy, 2018 as "year", yr2018 as indicator from water_depletion
union all
select economy, 2019 as "year", yr2019 as indicator from water_depletion
union all
select economy, 2020 as "year", yr2020 as indicator from water_depletion;


drop table forest_area_melt;
create table forest_area_melt as
-- economy: year - indicator value
select economy, 2009 as "year", yr2009 as forest_area from forest_area
union all
select economy, 2010 as "year", yr2010 as forest_area from forest_area
union all
select economy, 2011 as "year", yr2011 as indicator from forest_area
union all
select economy, 2012 as "year", yr2012 as indicator from forest_area
union all
select economy, 2013 as "year", yr2013 as indicator from forest_area
union all
select economy, 2014 as "year", yr2014 as indicator from forest_area
union all
select economy, 2015 as "year", yr2015 as indicator from forest_area
union all
select economy, 2016 as "year", yr2016 as indicator from forest_area
union all
select economy, 2017 as "year", yr2017 as indicator from forest_area
union all
select economy, 2018 as "year", yr2018 as indicator from forest_area
union all
select economy, 2019 as "year", yr2019 as indicator from forest_area
union all
select economy, 2020 as "year", yr2020 as indicator from forest_area;

select economy, year, forest_area,  LAG(forest_area) OVER (partition by economy ORDER BY year) as forest_area_evolution
from forest_area_melt
order by economy;

/* SELECT column1, column2,
       LEAD(column3, 1) OVER (ORDER BY column4) AS next_value,
       LAG(column3, 1) OVER (ORDER BY column4) AS prev_value
FROM tablename; */

select * from forest_area_melt;

drop table all_indicators_together;
create table all_indicators_together as
select co2.economy, co2.year,co2.co2_emissions, re.ren_energy_consumption, nr.natural_res_depletion, wd.water_depletion, fa.forest_area
from co2_melted co2
inner join r_energy_melted re
on co2.economy = re.economy
and co2.year = re.year
inner join nr_depletion_melted nr
on nr.economy = re.economy
and nr.year = re.year
inner join water_depletion_melt wd
on nr.economy = wd.economy
and nr.year = wd.year
inner join forest_area_melt fa
on fa.economy = wd.economy
and fa.year = wd.year;


/* SELECT column1, column2,
       LEAD(column3, 1) OVER (ORDER BY column4) AS next_value,
       LAG(column3, 1) OVER (ORDER BY column4) AS prev_value
FROM tablename; */

update all_indicators_together
set natural_res_depletion = 0.561548668352516
where economy = "GBR" 
and year in (2019, 2020);

/*select *, (forest_area -
lag(forest_area) over (partition by economy order by year))/(lag(forest_area) over (partition by economy order by year)) as deforestation_rate
 from all_indicators_together;*/


/*create table scaled_indicators
select economy as country, year
,(co2_emissions - min(co2_emissions) over())/(max() over() - min() over () ) as scaled_
,(ren_energy_consumption)
,(natural_res_depletion)
,(water_depletion)
,(forest_area)
from all_indicators_together;

create table scaled_indicators
select economy as country, year
,(co2_emissions - min(co2_emissions) over ())/(max(co2_emissions) over() - min(co2_emissions) over () ) as scaled_co2_emissions
from all_indicators_together;*/



