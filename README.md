# ETL_project #

## Project Goal ##
Use greenhouse gas emissions data and climate data, and find the relationships between the amount of the emission and changes in weather. Specifically, we’ll be using the data from New York City and develop a data file that allows us to examine whether there are any relationships between the amount of the gas emitted and the temperatures of the city from 1990 to 2015.

## Data Cleanup and Analysis ##

### Data Sources ###

Following data was selected because, through combining information from these tables, we can analyze how the amount of greenhouse gas emission is assocaited with the changes in temperature over the years.

Source 1: Historical monthly average weather data for New York City: https://www.weather.gov/media/okx/Climate/CentralPark/monthlyannualtemp.pdf
* Found on this site: https://www.weather.gov/okx/CentralParkHistorical
* Because this is a PDF document on the website, we copied and pasted the data into a csv file to analyze.

Source 2: Greenhouse gas emissions data for New York state: https://data.world/data-ny-gov/djfn-trk4
* This data details the estimated New York State greenhouse gas emission between 1990 and 2015.

Source 3: U.S. pollution data by pollution source: https://data.world/garyhoov/declining-pollution

### Data Transformation ###
We aggregated the monthly average temperature for New York to create an average temperature for each season, then dropped the monthly average temperature columns.

The historical average weather data covers a larger time frame (1869-2019) than the emissions data (1990-2015), so we filtered out the extra years of temperature data.

We filtered the U.S. pollution data by pollution source to only include data from New York state.

We cleaned our data by removing extra columns from our table and renaming the columns that we kept to clean our data.
Source 1:
The original table included monthly temperature from Jan - Dec. To improve clarity, we calculated mean temperatures for Jan - Mar, Apr - Jun, Jul - Sep, Oct - Dec. 
After the temperature data was aggregated, the original monthly data was excluded.
Source 2:
The original "Greenhouse gas emissions data for New York state" data (Source 2) included 'Electric Generation Total' and 'Net Imports of Electricity'. 
The values in these two columns were summed by year since both columns indicated the amounts of emission through burning fossil fuel for generating electricity.
After the amounts of emission was aggregated/summed, the original 2 columns were excluded.

We figured that the two tables (Sources 1 and 2) could be joined on "year". One file had "year" as "Year". The other had year as "YEAR". To make the join successful,
"Year" was renamed as "YEAR".

We joined the temperature and New York state greenhouse gas emissions data on YEAR to see the relationship between the amount of emissions and changes in the weather.

The merged data was originally in python data frame. It was converted to sql data and stored in PGAdmin. We also added a primary key (ID) to the table. 


### Final Production Database ###
We are producing a relational database in PostgreSQL, etl_load table in the database, ETL_project database.

### Final Tables in Database ###
We have one table showing the pollution data by pollution source by year in New York.

We have one table showing the average seasonal and yearly temperature by year.
