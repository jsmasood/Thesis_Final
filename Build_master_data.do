// PPOL 528-09
// Masters in Public Policy Thesis

clear
set more off
// Set Path
global data "/Users/jsmasood/Documents/Stata/Thesis"

// ETHIOPIA

// Load Ethiopia Round 2 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6852-stata R2/stata/stata11_se/r2_yc/ethiopia/etchildlevel5yrold.dta", clear

// Append "r2" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r2_`x' 
} 

rename r2_childid childid

save "$data/Young Lives/Datasets/ET_R2.dta", replace


// Load Ethiopia Round 3 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6853-stata R3/stata/stata11/r3_yc/ethiopia/et_yc_childlevel.dta", clear

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r3" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r3_`x' 
} 

rename r3_childid childid

tostring r3_ppvtlang2, gen (r3ppvtlang)
tostring r3_egralang2, gen (r3egralang) 
tostring r3_mathlang2, gen (r3mathlang)

save "$data/Young Lives/Datasets/ET_R3Cog.dta", replace


// Load Ethiopia Round 3 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6853-stata R3/stata/stata11/r3_yc/ethiopia/et_yc_householdlevel.dta", clear

// Append "r3" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r3_`x' 
} 

rename r3_childid childid

save "$data/Young Lives/Datasets/ET_R3HH.dta", replace

// Load Ethiopia Round 4 Young Child Test Scores dataset
use "$data/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/ethiopia/yc_chcog/et_r4_yccog_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "ET" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/ET_R4Cog.dta", replace

// Load Ethiopia Round 4 Young Child dataset
use "$data/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/ethiopia/yc_ch/et_r4_ycch_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "ET" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/ET_R4.dta", replace

// Load Ethiopia Round 4 HH data

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/ethiopia/yc_hh/et_r4_ychh_youngerhousehold.dta"

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "ET" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/ET_R4HH.dta", replace

// Load Ethiopia Round 5 Young Child Test Scores dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/ethiopia_r5/etyc_chcog_anon/et_r5_yccogtest_youngerchild.dta", clear


tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "ET" + childid

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/ET_R5Cog.dta", replace


// Load Ethiopia Round 5 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/ethiopia_r5/etyc_ch_anon/et_r5_ycch_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "ET" + childid

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/ET_R5.dta", replace


// Load Ethiopia Round 5 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/ethiopia_r5/etyc_hh_anon/et_r5_ychh_youngerhousehold.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "ET" + childid

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/ET_R5HH.dta", replace


// Load Ethiopia Round 1 Young Child dataset and merge all future round data
use "$data/Young Lives/UKDA-5307-stata R1/stata/stata11/r1_yc/ethiopia/etchildlevel1yrold.dta", clear
gen Country = 1

// Merge R2 data

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R2.dta", keepusing (r2_score_ppvt-r2_rscorelang_ppvt r2_wi r2_zhfa r2_fhfa r2_chheight r2_mtheight r2_presch r2_hasstrt r2_condcdaq r2_condpp r2_score_cog r2_score_ppvt)

drop _merge

// Merge R3 data

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R3Cog.dta", keepusing (r3_zhfa r3_fhfa r3_rppvt_co-r3_rmath_co r3_rgegra_co r3_chlang_gr r3_ppvtlang2-r3_bppvtlang2 r3egralang r3mathlang r3ppvtlang)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R3HH.dta", keepusing (r3_wi)

drop _merge

// Merge R4 data

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R4.dta", keepusing (r4_zhfa r4_fhfa r4_sib_zhfa r4_sib_fhfa)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R4Cog", keepusing (r4_lang_raw - r4_sppvt_perco)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R4HH", keepusing (r4_wi)

drop _merge

// Merge R5 data

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R5HH.dta", keepusing (r5_wi)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R5.dta", keepusing (r5_zhfa r5_fhfa)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/ET_R5Cog", keepusing (r5_maths_raw r5_reading_raw r5_ppvt_raw r5_maths_perco r5_reading_perco r5_ppvt_perco)

save "$data/Young Lives/Datasets/Ethiopia_merged.dta", replace

// ----------- //


// INDIA

// Load India Round 2 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6852-stata R2/stata/stata11_se/r2_yc/india/inchildlevel5yrold.dta", clear

// Append "r2" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r2_`x' 
} 

rename r2_childid childid

save "$data/Young Lives/Datasets/IN_R2.dta", replace


// Load India Round 3 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6853-stata R3/stata/stata11/r3_yc/india/in_yc_childlevel.dta", clear

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r3" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r3_`x' 
} 

rename r3_childid childid

replace r3_ppvtlang2 = 11 if r3_ppvtlang2 == 1
replace r3_ppvtlang2 = 12 if r3_ppvtlang2 == 2
replace r3_ppvtlang2 = 14 if r3_ppvtlang2 == 4


save "$data/Young Lives/Datasets/IN_R3Cog.dta", replace


// Load India Round 3 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6853-stata R3/stata/stata11/r3_yc/india/in_yc_householdlevel.dta", clear

// Append "r3" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r3_`x' 
} 

rename r3_childid childid

save "$data/Young Lives/Datasets/IN_R3HH.dta", replace


// Load India Round 4 Young Child Test Scores dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/india/yc_chcog_anon/in_r4_yccog_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "IN" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/IN_R4Cog.dta", replace


// Load India Round 4 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/india/yc_ch_anon/in_r4_ycch_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "IN" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/IN_R4.dta", replace

// Load India Round 4 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/india/yc_hh_anon/in_r4_ychh_youngerhousehold.dta"

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "IN" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/IN_R4HH.dta", replace


// Load India Round 5 Young Child Test Scores dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/india_r5/inyc_chcog_anon/in_r5_yccog_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "IN" + childid

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/IN_R5Cog.dta", replace


// Load India Round 5 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/india_r5/inyc_ch_anon/in_r5_ycch_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "IN" + childid

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/IN_R5.dta", replace


// Load India Round 5 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/india_r5/inyc_hh_anon/in_r5_ychh_youngerhousehold.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "IN" + childid

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/IN_R5HH.dta", replace


// Load India Round 1 Young Child dataset and merge all future round data

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-5307-stata R1/stata/stata11/r1_yc/india/inchildlevel1yrold.dta", clear

gen Country = 2

// Merge R2 data

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R2.dta", keepusing (r2_score_ppvt-r2_rscorelang_ppvt r2_wi r2_zhfa r2_fhfa r2_chheight r2_mtheight r2_presch r2_hasstrt r2_condcdaq r2_condpp)

drop _merge

// Merge R3 data

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R3Cog.dta", keepusing (r3_zhfa r3_fhfa r3_rppvt_co-r3_rmath_co r3_rgegra_co r3_chlang_gr)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R3HH.dta", keepusing (r3_wi)

drop _merge

// Merge R4 data

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R4.dta", keepusing (r4_zhfa r4_fhfa r4_sib_zhfa r4_sib_fhfa)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R4Cog", keepusing (r4_engl_raw r4_ppvt_raw r4_lang_raw r4_maths_raw r4_sibmaths_raw r4_engl_perco r4_ppvt_perco r4_lang_perco r4_maths_perco r4_sibmaths_perco)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R4HH", keepusing (r4_wi)

drop _merge

// Merge R5 data

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R5HH.dta", keepusing (r5_wi)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R5.dta", keepusing (r5_zhfa r5_fhfa)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/IN_R5Cog", keepusing (r5_maths_raw r5_read_raw r5_ppvt_raw r5_maths_perco r5_read_perco r5_ppvt_perco r5_TELADMNR5)

save "$data/Young Lives/Datasets/India_merged.dta", replace


// ------ //


// PERU

// Load Peru Round 2 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6852-stata R2/stata/stata11_se/r2_yc/peru/pechildlevel5yrold.dta", clear

// Append "r2" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r2_`x' 
} 

rename r2_childid childid

save "$data/Young Lives/Datasets/PE_R2.dta", replace


// Load Peru Round 3 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6853-stata R3/stata/stata11/r3_yc/peru/pe_yc_childlevel.dta", clear

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r3" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r3_`x' 
} 

rename r3_childid childid

tostring r3_ppvtlang2, gen (r3ppvtlang)
tostring r3_egralang2, gen (r3egralang) 
tostring r3_mathlang2, gen (r3mathlang)

save "$data/Young Lives/Datasets/PE_R3Cog.dta", replace


// Load Peru Round 3 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6853-stata R3/stata/stata11/r3_yc/peru/pe_yc_householdlevel.dta", clear

// Append "r3" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r3_`x' 
} 

rename r3_childid childid

save "$data/Young Lives/Datasets/PE_R3HH.dta", replace


// Load Peru Round 4 Young Child Test Scores dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/peru/yc_chcog/pe_r4_yccog_youngerchild.dta", clear

/* tostring CHILDCODE, gen (childid) // Convert child id variable to a string
replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6
replace childid = "PE" + childid */

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/PE_R4Cog.dta", replace


// Load Peru Round 4 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/peru/yc_ch/pe_r4_ycch_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "PE" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/PE_R4.dta", replace

// Load Peru Round 4 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/peru/yc_hh/pe_r4_ychh_youngerhousehold.dta"

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "PE" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/PE_R4HH.dta", replace


// Load Peru Round 5 Young Child Test Scores dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/peru_r5/pe_yc_cog_anon/pe_r5_yccogtest_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "PE" + childid

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/PE_R5Cog.dta", replace


// Load Peru Round 5 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/peru_r5/pe_yc_ch_anon/pe_r5_ycch_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "PE" + childid

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/PE_R5.dta", replace


// Load Peru Round 5 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/peru_r5/pe_yc_hh_anon/pe_r5_ychh_youngerhousehold.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "PE" + childid

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/PE_R5HH.dta", replace


// Load Peru Round 1 Young Child dataset and merge all future round data

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-5307-stata R1/stata/stata11/r1_yc/peru/pechildlevel1yrold.dta", clear

gen Country = 3

// Merge R2 data

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R2.dta", keepusing (r2_score_ppvt-r2_rscorelang_ppvt r2_wi r2_zhfa r2_fhfa r2_chheight r2_mtheight r2_presch r2_hasstrt r2_condpp r2_condcdaq r2_score_ppvt r2_score_cog)

drop _merge

// Merge R3 data

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R3Cog.dta", keepusing (r3_zhfa r3_fhfa r3_rppvt_co-r3_rmath_co r3_rgegra_co r3_chlang_gr r3egralang r3mathlang r3ppvtlang)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R3HH.dta", keepusing (r3_wi)

drop _merge

// Merge R4 data

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R4.dta", keepusing (r4_zhfa r4_fhfa r4_sib_zhfa r4_sib_fhfa)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R4Cog", keepusing (r4_lang_raw r4_ppvt_raw r4_lang_raw r4_maths_raw r4_lang_perco r4_ppvt_perco r4_lang_perco r4_maths_perco)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R4HH.dta", keepusing (r4_wi)

drop _merge

// Merge R5 data

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R5HH.dta", keepusing (r5_wi)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R5.dta", keepusing (r5_zhfa r5_fhfa)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/PE_R5Cog", keepusing (r5_maths_raw r5_reading_raw r5_ppvt_raw r5_maths_perco r5_reading_perco r5_ppvt_perco)

save "$data/Young Lives/Datasets/Peru_merged.dta", replace


// ------ //


// VIETNAM

// Load Vietnam Round 2 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6852-stata R2/stata/stata11_se/r2_yc/vietnam/vnchildlevel5yrold.dta", clear

// Append "r2" before each variable to keep track of round in Master dataset

rename *, lower

foreach x of var * { 
	rename `x' r2_`x' 
} 

rename r2_childid childid

save "$data/Young Lives/Datasets/VN_R2.dta", replace


// Load Vietnam Round 3 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6853-stata R3/stata/stata11/r3_yc/vietnam/vn_yc_childlevel.dta", clear

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r3" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r3_`x' 
} 

rename r3_childid childid

tostring r3_ppvtlang2, gen (r3ppvtlang)
tostring r3_egralang2, gen (r3egralang) 
tostring r3_mathlang2, gen (r3mathlang)

save "$data/Young Lives/Datasets/VN_R3Cog.dta", replace


// Load Vietnam Round 3 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-6853-stata R3/stata/stata11/r3_yc/vietnam/vn_yc_householdlevel.dta", clear

// Append "r3" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r3_`x' 
} 

rename r3_childid childid

save "$data/Young Lives/Datasets/VN_R3HH.dta", replace


// Load Vietnam Round 4 Young Child Test Scores dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/vietnam/yc_chcog_anon/vn_r4_yccog_youngerchildtest.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "VN" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/VN_R4Cog.dta", replace


// Load Vietnam Round 4 Young Child Anthro dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/vietnam/yc_anthro_anon/vn_r4_ycant_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "VN" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/VN_R4.dta", replace

// Load Vietnam Round 4 Young Child  dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-7931-stata R4/stata/stata11/r4_yc/vietnam/yc_hh_anon/vn_r4_ychh_youngerhousehold.dta"

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "VN" + childid

// Append "r4" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r4_`x' 
} 

rename r4_childid childid

save "$data/Young Lives/Datasets/VN_R4HH.dta", replace


// Load Vietnam Round 5 Young Child Test Scores dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/vietnam_r5/vnyc_chcog_anon/vn_r5_yccog_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "VN" + childid

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/VN_R5Cog.dta", replace


// Load Vietnam Round 5 Young Child dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/vietnam_r5/vnyc_ch_anon/vn_r5_ycch_youngerchild.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "VN" + childid

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/VN_R5.dta", replace


// Load Vietnam Round 5 Young Child HH dataset

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-8357-stata11 R5/stata11/vietnam_r5/vnyc_hh_anon/vn_r5_ychh_youngerhousehold.dta", clear

tostring CHILDCODE, gen (childid) // Convert child id variable to a string

replace childid = "0" + childid if strlen(childid) == 5 // Add a zero before string with length 5 to make all string codes equal to length 6

replace childid = "VN" + childid

rename *, lower // Convert variable names to lower case to match datasets (useful for appending later)

// Append "r5" before each variable to keep track of round in Master dataset

foreach x of var * { 
	rename `x' r5_`x' 
} 

rename r5_childid childid

save "$data/Young Lives/Datasets/VN_R5HH.dta", replace


// Load Vietnam Round 1 Young Child dataset and merge all future round data

use "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/UKDA-5307-stata R1/stata/stata11/r1_yc/vietnam/vnchildlevel1yrold.dta", clear

rename *, lower

gen Country = 4

// Merge R2 data

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R2.dta", keepusing (r2_score_ppvt-r2_rscorelang_ppvt r2_wi r2_zhfa r2_fhfa r2_chheight r2_mtheight r2_presch r2_hasstrt r2_condpp r2_condcdaq r2_score_ppvt r2_score_cog)

drop _merge

// Merge R3 data

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R3Cog.dta", keepusing (r3_zhfa r3_fhfa r3_rppvt_co-r3_rmath_co r3_rgegra_co r3_chlang_gr r3egralang r3mathlang r3ppvtlang)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R3HH.dta", keepusing (r3_wi)

drop _merge

// Merge R4 data

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R4.dta", keepusing (r4_zhfa r4_fhfa r4_sib_zhfa r4_sib_fhfa)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R4Cog", keepusing (r4_ppvt_raw r4_lang_raw r4_maths_raw r4_ppvt_perco r4_lang_perco r4_maths_perco)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R4HH.dta", keepusing (r4_wi)

drop _merge

// Merge R5 data

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R5HH.dta", keepusing (r5_wi)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R5.dta", keepusing (r5_zhfa r5_fhfa)

drop _merge

merge 1:1 childid using "$data/Young Lives/Datasets/VN_R5Cog", keepusing (r5_maths_raw r5_read_raw r5_maths_perco r5_read_perco)

save "$data/Young Lives/Datasets/Vietnam_merged.dta", replace


// ------ //


// Append merged datasets

use "$data/Young Lives/Datasets/Ethiopia_merged.dta", clear

append using "$data/Young Lives/Datasets/India_merged.dta"

append using "$data/Young Lives/Datasets/Peru_merged.dta"

append using "$data/Young Lives/Datasets/Vietnam_merged.dta"

label variable Country "Country"

keep clustid formno-dint region head hhsize careid-headid bwght bwdoc antnata-bplace chdborn-chldead wantcld mightdie longterm bcg-literspc inc1-debt /// 
repay badevent-worsevnt momrem1 momrem5 chweght chheght compheal-typesite citizen siblings infkid schkid hhadults sibcomp hhdisabl caresch headsch partsch ///
agechild ageorder agemum hhcare-iron3mth whichsex tallmad ownhouse agemum r2_chheight r2_mtheight r2_score_ppvt r2_score_cog r2_rscorelang_cog chldeth /// 
r2_rscorelang_ppvt r2_zhfa r2_fhfa r2_wi r3_chlang_gr r3_ppvtlang2 r3_egralang2 r3_mathlang2 r3_bppvtlang2 r3_rppvt_co r3_rsppvt_co r3_regra_co r3_rmath_co ///
r3_rgegra_co r3_zhfa r3_fhfa r3_wi r4_zhfa r4_fhfa r4_sib_zhfa r4_sib_fhfa r4_lang_raw r4_lang_perco r4_maths_raw r4_maths_perco r4_ppvt_raw r4_ppvt_perco ///
r4_sppvt_raw r4_sppvt_perco r5_wi r5_zhfa r5_fhfa r5_maths_raw r5_maths_perco r5_reading_raw r5_reading_perco r5_ppvt_raw r5_ppvt_perco Country r3_ppvtlang2 ///
r3_egralang2 r3_mathlang2

// Generate variables needed for regressions

// Stunting R1 Dummy
gen r1_stunted = 0
replace r1_stunted = 1 if zhfa <-2 & fhfa == 0
label variable r1_stunted "Indicator for stunting in Round 1"

// Stunting R2 Dummy
gen r2_stunted = 0
replace r2_stunted = 1 if r2_zhfa <-2 & r2_fhfa == 0
label variable r2_stunted "Indicator for stunting in Round 2"

// Stunting R3 Dummy
gen r3_stunted = 0
replace r3_stunted = 1 if r3_zhfa <-2 & r3_fhfa == 0
label variable r3_stunted "Indicator for stunting in Round 3"

// Stunting R4 Dummy
gen r4_stunted = 0
replace r4_stunted = 1 if r4_zhfa <-2 & r4_fhfa == 0
label variable r4_stunted "Indicator for stunting in Round 4"

// Stunting R5 Dummy
gen r5_stunted = 0
replace r5_stunted = 1 if r5_zhfa <-2 & r5_fhfa == 0
label variable r5_stunted "Indicator for stunting in Round 5"

// Country dummies
gen Ethiopia = 0
replace Ethiopia = 1 if Country == 1
label variable Ethiopia "Indicator for Ethiopia"

gen India = 0
replace India = 1 if Country == 2
label variable India "Indicator for India"

gen Peru = 0
replace Peru = 1 if Country == 3
label variable Peru "Indicator for Peru"

gen Vietnam = 0
replace Vietnam = 1 if Country == 4
label variable Vietnam "Indicator for Vietnam"

// Birth in hospital dummy
gen hosp_birth = 0
replace hosp_birth = 1 if bplace == 2 | bplace == 3
label variable hosp_birth "Indicator for birth in health facility"

// India caste dummy

gen caste_sc = 0
replace caste_sc = 1 if chldeth == 21 & Country == 2

gen caste_st = 0
replace caste_st = 1 if chldeth == 22 & Country == 2

gen caste_bc = 0
replace caste_bc = 1 if chldeth == 23 & Country == 2

gen caste_oc = 0
replace caste_oc = 1 if chldeth == 24 & Country == 2

// Ethiopia languages dummy variables


// India languages dummy variables


// Variables dropped with insufficient variation
drop irontabs iron3mth literspc literany

// Fix bad event coding
replace badevent = 0 if badevent == 2

// Fix typesite coding
replace typesite = 0 if typesite == 2

// Rename Consumer durables variable name
rename cd cdi

// Rename Reading/Lang test variable names
rename r2_rscorelang_cog r2_read_rasch
rename r2_rscorelang_ppvt r2_ppvt_rasch
rename r2_score_ppvt r2_ppvt_raw
rename r2_score_cog r2_cog_raw

rename r3_rppvt_co r3_ppvt_rasch
rename r3_regra_co r3_egra_rasch
rename r3_rmath_co r3_maths_rasch

rename r4_lang_raw r4_read_raw
rename r4_lang_perco r4_read_perco

rename r5_reading_raw r5_read_raw
rename r5_reading_perco r5_read_perco

gen r2read_not_tested = 0
replace r2read_not_tested = 1 if r2_read_rasch == .

gen r2ppvt_not_tested = 0
replace r2ppvt_not_tested = 1 if r2_ppvt_rasch == .

gen r3ppvt_not_tested = 0
replace r3ppvt_not_tested = 1 if r3_ppvt_rasch == .

gen r3maths_not_tested = 0
replace r3maths_not_tested = 1 if r3_maths_rasch == .

gen r3read_not_tested = 0
replace r3read_not_tested = 1 if r3_egra_rasch == .

gen r4read_not_tested = 0
replace r4read_not_tested = 1 if r4_read_perco == .

gen r4ppvt_not_tested = 0
replace r4ppvt_not_tested = 1 if r4_ppvt_perco == .

gen r4maths_not_tested = 0
replace r4maths_not_tested = 1 if r4_maths_perco == .

gen r5read_not_tested = 0
replace r5read_not_tested = 1 if r5_read_perco == .

gen r5ppvt_not_tested = 0
replace r5ppvt_not_tested = 1 if r5_ppvt_perco == .

gen r5maths_not_tested = 0
replace r5maths_not_tested = 1 if r5_maths_perco == .

// Nat_Disaster 

gen nat_disaster = .
replace nat_disaster = 1 if phychnge == 1
replace nat_disaster = 0 if phychnge == 2

// Crop Failure

gen crp_fail = .
replace crp_fail = 1 if hhcrps == 1
replace crp_fail = 0 if hhcrps == 2

// Gender dummy

replace sex = 0 if sex == 2

label define sexlabel 0 "Female" 1 "Male"
label values sex sexlabel

// Want Child dummy

keep if wantcld == 1 | wantcld == 2
replace wantcld = 0 if wantcld == 2

label define wantcldlabel 0 "No" 1 "Yes"
label values wantcld wantcldlabel

// Might Die dummy

keep if mightdie == 1 | mightdie == 2
replace mightdie = 0 if mightdie == 2

label define mightdielabel 0 "No" 1 "Yes"
label values mightdie mightdielabel

// Started preschool in Round 2 dummy

keep if r2_presch == 0 | r2_presch == 1

save "$data/Young Lives/master_data.dta", replace

