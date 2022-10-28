here::i_am("code/00_clean_data.R")

# Establishing Location for the Analysis Dataset
file_cities_loc <- here::here("data/city.csv") 
cities <- read.csv(file_cities_loc) 

library(tidyverse)

cities_clean <- cities %>%
  select(zipprevcase, mprevcase, fprevcase, 
         bnhprevcase, hispprevcase, wnhprevcase, asnhprevcase, otherprevcase,
         zipndxcase, zipndxprop, mndxcase, mndxprop, fndxcase, fndxprop, bnhndxcase, bnhndxprop,
         hispndxcase, hispndxprop, wnhndxcase, wnhndxprop, 
         age1324ndxcase, age1324ndxprop, age2544ndxcase, age2544ndxprop, age4559ndxcase, age4559ndxprop,
         age60overndxcase, age60overndxprop) 

# Creating Useful Objects
# Prevalent Cases
total_prev_overall <- sum(cities_clean$zipprevcase) # creating an object that contains the total # of new dx

total_prevf <- sum(cities_clean$fprevcase) # creating an object that contains the total # of prev dx among women

total_prevf_pct <- round((total_prevf/total_prev_overall), 3) * 100 # creating an object that contains the prev % of women overall

total_prevm <- sum(cities_clean$mprevcase) # creating an object that contains the total # of prev dx among men

total_prevm_pct <- round((total_prevm/total_prev_overall), 3) * 100 # creating an object that contains the prev % of men overall

total_prevbl <- sum(cities_clean$bnhprevcase) # creating an object that contains the total # of prev dx among Blacks

total_prevbl_pct <- round((total_prevbl/total_prev_overall), 3) * 100 # creating an object that contains the prev % of Blacks

total_prevhis <- sum(cities_clean$hispprevcase) # creating an object that contains the total # of prev dx among Hispanics

total_prevhis_pct <- round((total_prevhis/total_prev_overall), 3) * 100 # creating an object that contains the prev % of Hispanics

total_prevwh <- sum(cities_clean$wnhndxcase) # creating an object that contains the total # of prev dx among Whites

total_prevwh_pct <- round((total_prevwh/total_prev_overall), 3) * 100 # creating an object that contains the total # of prev % of Whites

total_prevas <- sum(cities_clean$asnhprevcase) # creating an object that contains the total # of prev dx among Asians

total_prevoth <- sum(cities_clean$otherprevcase) # creating an object that contains the total # of prev dx among Other race

# New DX Cases
new_overall <- round(sum(cities_clean$zipndxcase), 2) # creating an object that contains the total # of new dx overall

newpr_overall <- round((new_overall/total_prev_overall), 3) * 100 # creating an object that tells the proportion of prevalent cases that are new

newf <- round(sum(cities_clean$fndxcase), 2) # creating an object that tells the total # of new dx for females

newf_pct <- round((newf/new_overall), 3) * 100 # creating an object that tells us the % of new dx that women comprise

newm <- round(sum(cities_clean$mndxcase), 2) # creating an object that tells the total # of new dx for males

newm_pct <- round((newm/new_overall), 3) * 100 # creating an object that tells us the % of new dx that men comprise

newbl <- round(sum(cities_clean$bnhndxcase), 2) # creating an object that tells the total # of new dx for Blacks

newbl_pct <- round((newbl/new_overall), 3) * 100 # creating an object that tells the % of new dx that Blacks comprise

newhis <- round(sum(cities_clean$hispndxcase), 2) # creating an object that tells the total # of new dx for Hispanics

newhis_pct <- round((newhis/new_overall),3) * 100 # creating an object that tells the % of new dx that Hispanics comprise

newwh <- round(sum(cities_clean$wnhndxprop), 2) # creating an object that tells the total # of new dx for Whites

newwh_pct <- round((newwh/new_overall), 3) * 100 # creating an object that tells us the % of new dx that Whites comprise

column1_prev <- c(total_prev_overall, total_prevf, total_prevm, total_prevbl, total_prevhis, total_prevwh)
column2_prevpct <- c(" ", total_prevf_pct, total_prevm_pct, total_prevbl_pct, total_prevhis_pct, total_prevwh_pct)
column3_new <- floor(c(new_overall, newf, newm, newbl, newhis, newwh)) # the floor was so that didn't get any decimal places
column4_newpct <- c(newpr_overall, newf_pct, newm_pct, newbl_pct, newhis_pct, newwh_pct)
Characteristics <- c(" ", "Men", "Women", "Black", "Hispanic", "White")

data <- data.frame(Characteristics, column1_prev, column2_prevpct, column3_new, column4_newpct)

saveRDS(data, 
        file = here::here("output/data_clean.rds"))
