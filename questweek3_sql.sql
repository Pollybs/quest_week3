/* SELECT column1, column2,
       LEAD(column3, 1) OVER (ORDER BY column4) AS next_value,
       LAG(column3, 1) OVER (ORDER BY column4) AS prev_value
FROM tablename; */

use sustainable_var
select * from forest_area;
create table co2_melted as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as indicator from co2_emissions
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

create table nr_depletion_melted as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as indicator from natural_resources_depletion
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

create table r_energy_melted as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as indicator from renewable_energy_consumption
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

create table water_depletion_melt as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as indicator from water_depletion
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

create table forest_area_melt as
-- economy: year - indicator value
select economy, 2010 as "year", yr2010 as indicator from forest_area
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

