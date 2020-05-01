# ETL_project #

## Project Goal ##
Use greenhouse gas emissions data and climate data, and find the relationships between the amount of the emission and changes in weather. Specifically, we’ll be using the data from New York City and develop a data file that allows us to examine whether there are any relationships between the amount of the gas emitted and the temperatures of the city from 1990 to 2015.

## Data Cleanup and Analysis ##

### Data Sources ###

The following data was selected because, through combining information from these tables, we can analyze how the amount of greenhouse gas emission is assocaited with the changes in temperature over the years.

Source 1: Historical monthly average weather data for New York City: https://www.weather.gov/media/okx/Climate/CentralPark/monthlyannualtemp.pdf
* Found on this site: https://www.weather.gov/okx/CentralParkHistorical
* Because this is a PDF document on the website, we copied and pasted the data into a csv file to analyze.

Source 2: Greenhouse gas emissions data for New York state: https://data.world/data-ny-gov/djfn-trk4
* This data details the estimated New York State greenhouse gas emission between 1990 and 2015.

Source 3: U.S. pollution data by pollution source: https://data.world/garyhoov/declining-pollution

### Data Transformation ###
The historical average weather data covers a larger time frame (1869-2019) than the emissions data (1990-2015), so we filtered out the extra years of temperature data.


We cleaned our data by removing extra columns from our table and renaming the columns that we kept to clean our data.

Source 1:
The original table included monthly temperature from Jan - Dec. To improve clarity, we calculated mean temperatures for Jan - Mar, Apr - Jun, Jul - Sep, Oct - Dec. After we aggregated the temperature data, we excluded the original monthly data.

Source 2:
We summed the values in these two columns by year since both columns indicated the amount of emissions that came from burning fossil fuel for generating electricity. After we summed the amount of these emissions, we excluded the original 2 columns.”

We figured that the two tables (Sources 1 and 2) could be joined on "year". One file had "year" as "Year". The other had year as "YEAR". To make the join successful, we renamed "Year" as "YEAR".

We joined the temperature and New York state greenhouse gas emissions data on YEAR to see the relationship between the amount of emissions and changes in the weather.

The merged data was originally in a Python data frame. We converted it to SQL data and stored it in PGAdmin. We also added a primary key (ID) to the table.

Source 3:
The original table included yearly emissions data by source and by pollutant for all 50 U.S. states. We filtered the pollution data to only include data from New York state.

We cleaned the data to remove extra columns ("STATE_FIPS" and "STATE_ABBR"). Then, we renamed the remaining columns to make it easier.

We converted the cleaned table to SQL data and stored it in PGAdmin as a new table.


### Final Production Database ###
We produced a relational database in PostgreSQL named ETL_project. The database contains two tables: etl_load and emissions_type.

### Final Tables in Database ###
The etl_load table shows the merged table with temperature and New York state greenhouse gas emissions by year.

The emissions_type table shows the yearly emissions by source and by pollutant for New York state.
