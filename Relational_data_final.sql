select *
from public.etl_load;

ALTER TABLE etl_load ADD COLUMN ID SERIAL PRIMARY KEY;

select *
from etl_load