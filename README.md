# Thesis Stata Do-Files

This paper explores the relationship between infant malnutrition and future schooling outcomes using data from the Young Lives Survey. Using this panel dataset, I track children throughout the first fifteen years of their life and analyze the effect of stunting on future educational achievement.

To carry out the analysis, this paper uses data from the Young Lives Survey.
https://www.younglives.org.uk

The Young Lives Survey tracks the lives of two cohorts of children in four developing countries: Ethiopia, India, Peru & Vietnam. The younger of these cohorts was one year old in 2001-2002 when the baseline survey took place. Subsequent rounds of the surveys tracked these children and tested their learning outcomes at ages 9 (round 3), 12 (round 4) and 15 (round 5).

There are two files for this analysis:

1. Build_master_data: For each country and round the datasets are available seperately. After downloading these I first merged country data across rounds. This allows us to control for covariates across time periods and run our main regression. After creating seperate datasets for each country I appended these into master dataset.

2. Empirical_updated_do: Runs regressions on our master data file. Also runs robustness checks to check validity of main regression results.
