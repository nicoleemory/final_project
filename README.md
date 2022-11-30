# Project: AIDSVu Final Project

**Author:** Nicole Hood

**Date:** 10/28/2022

------------------------

# Git Repository Organization

`README.md`
- contains info about git repository

`data`
- contains all data for the project
-- cities.csv
-- city.csv
-- city_minus.csv

`code/00_clean_data.R`
- loads the city.csv file that contains HIV Care Continuum data for 36 U.S. cities
- the data contains new diagnoses and prevalent diagnoses in total for each city and by demographic characteristics
- selects only data relevant to the table one 
- created objects that sums all cities's remaining data
- created vectors with all the relevant data and put it in a dataframe that can 
  be used to create table 1 and saved as a .rds file in `output/` folder

`code/01_make_table1.R`
- uses the data_clean.rds generate from 00_clean_data.R to create table 1
- the kable extra package was used to create a table 1 with new HIV dx
  and prevalent HIV dx by gender and race
- saves table_one as a `.rds` object in `output/` folder

`code/02_make_plot.R`
- loads the cities.csv and city_minus.csv
- these datasets respectively include city level gender data organized by region
  for each of the 4 HIV Care Continuum steps
- cities and city_minus are the same except city_minus does not contain
  linkage or viral suppression data for Providence, RI or Denver, CO
- creates 4 figures with ggplot geom_point that are saved as .png files 
  in `output/` folder

`code/04_render_report.R`
- renders `report.Rmd`

`makefile`
- this file contains all the rule for building the report
- rather than going into each of the individual R scripts and running them 
- one by one, you can just type "make" and this file will go through its
  rules that will run each script and generate the final report
- it contains rules for building the report.html, the rds files that 
  are used to save the relevant rds data, rds table, and the 4 png figures
- it also removes any .rds and .png files after they are used
- it also includes a phony rule that is called "install" that synchronizes package repositories with the lockfile
- if you want to run any of the make rules on their own, you simply have to type "make" and the name of the rule

`report.Rmd`
- this is the Rmd that will generate the html final report for the project
- it can be generated by typing "make" in the command line once the used
  is in the relevant directory where the file can be found
- it contains code that is set to not appear in the final report
- it calls all the various relevant .rds and .png files 
- the report contains an introduction describing the data (e.g., HIV Care Continuum
   steps for 36 U.S. cities), a table 1 that shows total number of new HIV diagnoses
   for the 2018 year as well as the prevalent number and then the breakdown by gender and race.
- it also include a description of the table1.
- finally, the report contains a 4 figures and their description. the 4 figures
  are a visual representation of each of the 4 HIV Care Continuum steps by gender 
  within each U.S. region.






