# ETL_project #

## Project Goal ##
Use greenhouse gas emissions data and climate data, and find the relationships between the amount of the emission and changes in weather. Specifically, we’ll be using the data from New York City and develop a data file that allows us to examine whether there are any relationships between the amount of the gas emitted and the temperatures of the city from 1990 to 2015.

## Data Cleanup and Analysis ##

### Data Sources ###
Historical monthly average weather data for New York City: https://www.weather.gov/media/okx/Climate/CentralPark/monthlyannualtemp.pdf
* Found on this site: https://www.weather.gov/okx/CentralParkHistorical
* Because this is a PDF document on the website, we copied and pasted the data into a csv file to analyze.

Greenhouse gas emissions data for New York state: https://data.world/data-ny-gov/djfn-trk4

U.S. pollution data by pollution source: https://data.world/garyhoov/declining-pollution

### Data Transformation ###
We aggregated the monthly average temperature for New York to create an average temperature for each season, then dropped the monthly average temperature columns.

The historical average weather data covers a larger time frame (1869-2019) than the emissions data (1990-2015), so we filtered out the extra years of temperature data.

We filtered the U.S. pollution data by pollution source to only include data from New York state.

We cleaned our data by removing extra columns from our table and renaming the columns that we kept to clean our data.

We joined the temperature and New York state greenhouse gas emissions data to see the relationship between the amount of emissions and changes in the weather.

### Final Production Database ###
We are producing a relational database in PostgreSQL.

### Final Tables in Database ###
We have one table showing the pollution data by pollution source by year in New York.

We have one table showing the average seasonal and yearly temperature by year.
