// PPOL 528-09
// Masters in Public Policy Thesis

// Empirical Analysis

clear
set more off
// Set Path
global data "/Users/jsmasood/Documents/Stata/Thesis"

// Load R4 Master dataset
use "$data/Young Lives/master_data.dta", clear

cd "/Users/jsmasood/Documents/Stata/Thesis/Young Lives/Output"

keep if fhfa == 0


// Round 2

// Pooled Regression R2

reg r2_read_rasch r1_stunted
outreg2 using R2_Pooled.doc, replace

reg r2_ppvt_rasch r1_stunted
outreg2 using R2_Pooled.doc, append


// Pooled Regression R2 with covariates and community/country fixed effects

reg r2_read_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condcdaq i.Country i.clustid , robust
outreg2 using R2_Pooled.doc, append

reg r2_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condpp i.Country i.clustid, robust
outreg2 using R2_Pooled.doc, append


// Round 3

// Pooled Regression R3

reg r3_egra_rasch r1_stunted
outreg2 using R3_Pooled.doc, replace

reg r3_ppvt_rasch r1_stunted
outreg2 using R3_Pooled.doc, append

reg r3_maths_rasch r1_stunted
outreg2 using R3_Pooled.doc, append

// Pooled Regression R3 with covariates and community/country fixed effects

reg r3_egra_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R3_Pooled.doc, append

reg r3_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R3_Pooled.doc, append

reg r3_maths_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R3_Pooled.doc, append


// Round 4

// Pooled Regression R4

reg r4_read_perco r1_stunted
outreg2 using R4_Pooled.doc, replace

reg r4_ppvt_perco r1_stunted
outreg2 using R4_Pooled.doc, append

reg r4_maths_perco r1_stunted
outreg2 using R4_Pooled.doc, append


// Pooled Regression R4 with covariates and community/country fixed effects

reg r4_read_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R4_Pooled.doc, append

reg r4_ppvt_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R4_Pooled.doc, append

reg r4_maths_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R4_Pooled.doc, append


// Round 5

// Pooled Regression R5

reg r5_read_perco r1_stunted
outreg2 using R5_Pooled.doc, replace

reg r5_ppvt_perco r1_stunted
outreg2 using R5_Pooled.doc, append

reg r5_maths_perco r1_stunted
outreg2 using R5_Pooled.doc, append

// Pooled Regression R5 with covariates and community/country fixed effects

reg r5_read_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R5_Pooled.doc, append

reg r5_ppvt_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R5_Pooled.doc, append

reg r5_maths_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.Country i.clustid, robust
outreg2 using R5_Pooled.doc, append

// ---------------- //

// Countrywise R2

// Ethiopia with Covariates & Community Fixed Effects

reg r2_read_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condcdaq i.clustid if Country == 1, robust
outreg2 using R2_Ethiopia.doc, replace

reg r2_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condpp i.clustid if Country == 1, robust
outreg2 using R2_Ethiopia.doc, append

// India with Covariates & Community Fixed Effects

reg r2_read_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condcdaq i.clustid if Country == 2, robust
outreg2 using R2_India.doc, replace

reg r2_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condpp i.clustid if Country == 2, robust
outreg2 using R2_India.doc, append

// Peru with Covariates & Community Fixed Effects

reg r2_read_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condcdaq i.clustid if Country == 3, robust
outreg2 using R2_Peru.doc, replace

reg r2_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condpp i.clustid if Country == 3, robust
outreg2 using R2_Peru.doc, append

// Vietnam with Covariates & Community Fixed Effects

reg r2_read_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condcdaq i.clustid if Country == 4, robust
outreg2 using R2_Vietnam.doc, replace

reg r2_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condpp i.clustid if Country == 4, robust
outreg2 using R2_Vietnam.doc, append

// ---------------- //

// Countrywise R3

// Ethiopia with Covariates & Community Fixed Effects

reg r3_egra_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R3_Ethiopia.doc, replace

reg r3_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R3_Ethiopia.doc, append

reg r3_maths_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R3_Ethiopia.doc, append

// India with Covariates & Community Fixed Effects

reg r3_egra_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 2, robust
outreg2 using R3_India.doc, replace

reg r3_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 2, robust
outreg2 using R3_India.doc, append

reg r3_maths_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 2, robust
outreg2 using R3_India.doc, append

// Peru with Covariates & Community Fixed Effects

reg r3_egra_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R3_Peru.doc, replace

reg r3_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R3_Peru.doc, append

reg r3_maths_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R3_Peru.doc, append

// Vietnam with Covariates & Community Fixed Effects

reg r3_egra_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 4, robust
outreg2 using R3_Vietnam.doc, replace

reg r3_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 4, robust
outreg2 using R3_Vietnam.doc, append

reg r3_maths_rasch r1_stunted r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 4, robust
outreg2 using R3_Vietnam.doc, append

// ---------------- //

// Countrywise R4

// Ethiopia with Covariates & Community Fixed Effects

reg r4_read_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R4_Ethiopia.doc, replace

reg r4_ppvt_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R4_Ethiopia.doc, append

reg r4_maths_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R4_Ethiopia.doc, append

// India with Covariates & Community Fixed Effects

reg r4_read_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 2, robust
outreg2 using R4_India.doc, replace

reg r4_ppvt_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 2, robust
outreg2 using R4_India.doc, append

reg r4_maths_perco r1_stunted r2_presch r2_hasstrt wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 2, robust
outreg2 using R4_India.doc, append

// Peru with Covariates & Community Fixed Effects

reg r4_read_perco r1_stunted wi r2_presch r2_hasstrt sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R4_Peru.doc, replace

reg r4_ppvt_perco r1_stunted wi r2_presch r2_hasstrt sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R4_Peru.doc, append

reg r4_maths_perco r1_stunted wi r2_presch r2_hasstrt sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R4_Peru.doc, append

// Vietnam with Covariates & Community Fixed Effects

reg r4_read_perco r1_stunted wi r2_presch r2_hasstrt sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 4, robust
outreg2 using R4_Vietnam.doc, replace

reg r4_ppvt_perco r1_stunted wi r2_presch r2_hasstrt sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 4, robust
outreg2 using R4_Vietnam.doc, append

reg r4_maths_perco r1_stunted wi r2_presch r2_hasstrt sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 4, robust
outreg2 using R4_Vietnam.doc, append

// ---------------- //

// Countrywise R5

// Ethiopia with Covariates & Community Fixed Effects

reg r5_read_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R5_Ethiopia.doc, replace

reg r5_ppvt_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R5_Ethiopia.doc, append

reg r5_maths_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 1, robust
outreg2 using R5_Ethiopia.doc, append

// India with Covariates & Community Fixed Effects

reg r5_ppvt_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 2, robust
outreg2 using R5_India.doc, replace

reg r5_maths_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 2, robust
outreg2 using R5_India.doc, append

// Peru with Covariates & Community Fixed Effects

reg r5_read_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R5_Peru.doc, replace

reg r5_ppvt_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R5_Peru.doc, append

reg r5_maths_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 3, robust
outreg2 using R5_Peru.doc, append

// Vietnam with Covariates & Community Fixed Effects

reg r5_maths_perco r1_stunted r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid if Country == 4, robust
outreg2 using R5_Vietnam.doc, replace

// ---------------- //

// Selection bias in testing on Stunted Children

// Round 2

logit r2read_not_tested r1_stunted, robust
outreg2 using Round2_Selection.doc, replace

logit r2ppvt_not_tested r1_stunted, robust
outreg2 using Round2_Selection.doc, append


// Round 3

logit r3read_not_tested r1_stunted, robust
outreg2 using Round3_Selection.doc, replace

logit r3ppvt_not_tested r1_stunted, robust
outreg2 using Round3_Selection.doc, append

logit r3maths_not_tested r1_stunted, robust
outreg2 using Round3_Selection.doc, append


// Round 4

logit r4read_not_tested r1_stunted, robust
outreg2 using Round4_Selection.doc, replace

logit r4ppvt_not_tested r1_stunted, robust
outreg2 using Round4_Selection.doc, append

logit r4maths_not_tested r1_stunted, robust
outreg2 using Round4_Selection.doc, append


// Round 5

logit r5read_not_tested r1_stunted, robust
outreg2 using Round5_Selection.doc, replace

logit r5ppvt_not_tested r1_stunted, robust
outreg2 using Round5_Selection.doc, append

logit r5maths_not_tested r1_stunted, robust
outreg2 using Round5_Selection.doc, append


// Countrywise

// Ethiopia

logit r2read_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection1.doc, replace

logit r2ppvt_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection1.doc, append

logit r3read_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection1.doc, append

logit r3ppvt_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection1.doc, append

logit r3maths_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection1.doc, append

logit r4read_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection2.doc, replace

logit r4ppvt_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection2.doc, append

logit r4maths_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection2.doc, append

logit r5read_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection2.doc, append

logit r5ppvt_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection2.doc, append

logit r5maths_not_tested r1_stunted if Country == 1, robust
outreg2 using Ethiopia_Selection2.doc, append

// India

logit r2read_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection1.doc, replace

logit r2ppvt_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection1.doc, append

logit r3read_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection1.doc, append

logit r3ppvt_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection1.doc, append

logit r3maths_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection1.doc, append

logit r4read_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection2.doc, replace

logit r4ppvt_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection2.doc, append

logit r4maths_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection2.doc, append

logit r5ppvt_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection2.doc, append

logit r5maths_not_tested r1_stunted if Country == 2, robust
outreg2 using India_Selection2.doc, append

// Peru

logit r2read_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection1.doc, replace

logit r2ppvt_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection1.doc, append

logit r3read_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection1.doc, append

logit r3ppvt_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection1.doc, append

logit r3maths_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection1.doc, append

logit r4read_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection2.doc, replace

logit r4ppvt_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection2.doc, append

logit r4maths_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection2.doc, append

logit r5read_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection2.doc, append

logit r5ppvt_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection2.doc, append

logit r5maths_not_tested r1_stunted if Country == 3, robust
outreg2 using Peru_Selection2.doc, append

// Vietnam

logit r2read_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection1.doc, replace

logit r2ppvt_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection1.doc, append

logit r3read_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection1.doc, append

logit r3ppvt_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection1.doc, append

logit r3maths_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection1.doc, append

logit r4read_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection2.doc, replace

logit r4ppvt_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection2.doc, append

logit r4maths_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection2.doc, append

logit r5maths_not_tested r1_stunted if Country == 4, robust
outreg2 using Vietnam_Selection2.doc, append


// ---------------- //

ivreg2 r3_ppvt_rasch (r1_stunted = inst) r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condcdaq i.Country i.clustid, r ffirst
outreg2 using IV_1.doc, replace

ivreg2 r3_egra_rasch (r1_stunted = inst) r2_presch r2_hasstrt wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condcdaq i.Country i.clustid, r ffirst
outreg2 using IV_2.doc, replace

ivreg2 r5_ppvt_perco (r1_stunted = inst) r2_presch r2_hasstrt wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent r2_condcdaq i.Country i.clustid, r ffirst
outreg2 using IV_3.doc, replace


// ---------------- //


// On elder sons in India subsample

keep if Country == 2 & (ageorder == 1 | ageorder == 4) & sex == 1

// R2 Model with No Controls

reg r2_read_rasch r1_stunted
outreg2 using India_firstborn_R2.doc, replace

reg r2_ppvt_rasch r1_stunted
outreg2 using India_firstborn_R2.doc, append

// R2 Model with Community Fixed Effects and Covariates

reg r2_read_rasch r1_stunted r2_presch r2_hasstrt wi r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R2.doc, append

reg r2_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R2.doc, append

// R3 Model with No Controls

reg r3_egra_rasch r1_stunted
outreg2 using India_firstborn_R3.doc, replace

reg r3_ppvt_rasch r1_stunted
outreg2 using India_firstborn_R3.doc, append

reg r3_maths_rasch r1_stunted
outreg2 using India_firstborn_R3.doc, append

// R3 Model with Community Fixed Effects and Covariates

reg r3_egra_rasch r1_stunted r2_presch r2_hasstrt wi r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R3.doc, append

reg r3_ppvt_rasch r1_stunted r2_presch r2_hasstrt wi r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R3.doc, append

reg r3_maths_rasch r1_stunted r2_presch r2_hasstrt wi r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R3.doc, append

// R4 Model with No Controls

reg r4_read_perco r1_stunted
outreg2 using India_firstborn_R4.doc, replace

reg r4_ppvt_perco r1_stunted
outreg2 using India_firstborn_R4.doc, append

reg r4_maths_perco r1_stunted
outreg2 using India_firstborn_R4.doc, append

// R4 Model with Community Fixed Effects and Covariates

reg r4_read_perco r1_stunted r2_presch r2_hasstrt wi r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R4.doc, append

reg r4_ppvt_perco r1_stunted r2_presch r2_hasstrt wi r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R4.doc, append

reg r4_maths_perco r1_stunted r2_presch r2_hasstrt wi r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R4.doc, append

// R5 Model with No Controls

reg r5_ppvt_perco r1_stunted
outreg2 using India_firstborn_R5.doc, replace

reg r5_maths_perco r1_stunted
outreg2 using India_firstborn_R5.doc, append

// R5 Model with Community Fixed Effects and Covariates

reg r5_ppvt_perco r1_stunted r2_presch r2_hasstrt wi r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R5.doc, append

reg r5_maths_perco r1_stunted r2_presch r2_hasstrt wi r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive badevent i.clustid, robust
outreg2 using India_firstborn_R5.doc, append

// Selection Bias Test

logit r2read_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection1.doc, replace

logit r2ppvt_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection1.doc, append

logit r3read_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection1.doc, append

logit r3ppvt_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection1.doc, append

logit r3maths_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection1.doc, append

logit r4read_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection2.doc, replace

logit r4ppvt_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection2.doc, append

logit r4maths_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection2.doc, append

logit r5ppvt_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection2.doc, append

logit r5maths_not_tested r1_stunted, robust
outreg2 using IndiaSubsample_Selection2.doc, append

// ---------------- //

/* Regressions R2 - Countrywise

// Ethiopia with Covariates & Community Fixed Effects

reg r2_read_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R2_Ethiopia.doc, replace

reg r2_ppvt_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R2_Ethiopia.doc, append

// India with Covariates & Community Fixed Effects

reg r2_read_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R2_India.doc, replace

reg r2_ppvt_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R2_India.doc, append

// Peru with Covariates & Community Fixed Effects

reg r2_read_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R2_Peru.doc, replace

reg r2_ppvt_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R2_Peru.doc, append

// Vietnam with Covariates & Community Fixed Effects

reg r2_read_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R2_Vietnam.doc, replace

reg r2_ppvt_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R2_Vietnam.doc, append

// ---------------- //

// Round 3

// Pooled Regression R3

reg r3_egra_rasch r1_stunted
outreg2 using R3_Pooled_Single.doc, replace

reg r3_ppvt_rasch r1_stunted
outreg2 using R3_Pooled_Single.doc, append

reg r3_maths_rasch r1_stunted
outreg2 using R3_Pooled_Single.doc, append

// Pooled Regression R3 with country fixed

reg r3_egra_rasch r1_stunted i.Country
outreg2 using R3_Pooled_Single.doc, append

reg r3_ppvt_rasch r1_stunted i.Country
outreg2 using R3_Pooled_Single.doc, append

reg r3_maths_rasch r1_stunted i.Country
outreg2 using R3_Pooled_Single.doc, append

// Pooled Regression R3 with covariates and country fixed effects

reg r3_egra_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R3_Pooled_Multi.doc, replace

reg r3_ppvt_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R3_Pooled_Multi.doc, append

reg r3_maths_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R3_Pooled_Multi.doc, append

// Regressions R3 - Countrywise

// Ethiopia with Covariates & Community Fixed Effects

reg r3_egra_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R3_Ethiopia.doc, replace

reg r3_ppvt_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R3_Ethiopia.doc, append

reg r3_maths_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R3_Ethiopia.doc, append

// India with Covariates & Community Fixed Effects

reg r3_egra_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R3_India.doc, replace

reg r3_ppvt_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R3_India.doc, append

reg r3_maths_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R3_India.doc, append

// Peru with Covariates & Community Fixed Effects

reg r3_egra_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R3_Peru.doc, replace

reg r3_ppvt_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R3_Peru.doc, append

reg r3_maths_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R3_Peru.doc, append

// Vietnam with Covariates & Community Fixed Effects

reg r3_egra_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R3_Vietnam.doc, replace

reg r3_ppvt_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R3_Vietnam.doc, append

reg r3_maths_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R3_Vietnam.doc, append

// ---------------- //

// Round 4

// Pooled Regression R4

reg r4_read_perco r1_stunted
outreg2 using R4_Pooled_Single.doc, replace

reg r4_ppvt_perco r1_stunted
outreg2 using R4_Pooled_Single.doc, append

reg r4_maths_perco r1_stunted
outreg2 using R4_Pooled_Single.doc, append

// Pooled Regression R3 with country fixed

reg r4_read_perco r1_stunted i.Country
outreg2 using R4_Pooled_Single.doc, append

reg r4_ppvt_perco r1_stunted i.Country
outreg2 using R4_Pooled_Single.doc, append

reg r4_maths_perco r1_stunted i.Country
outreg2 using R4_Pooled_Single.doc, append

// Pooled Regression R3 with covariates and country fixed effects

reg r4_read_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R4_Pooled_Multi.doc, replace

reg r4_ppvt_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R4_Pooled_Multi.doc, append

reg r4_maths_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R4_Pooled_Multi.doc, append

// Regressions R4 - Countrywise

// Ethiopia with Covariates & Community Fixed Effects

reg r4_read_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R4_Ethiopia.doc, replace

reg r4_ppvt_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R4_Ethiopia.doc, append

reg r4_maths_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R4_Ethiopia.doc, append

// India with Covariates & Community Fixed Effects

reg r4_read_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R4_India.doc, replace

reg r4_ppvt_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R4_India.doc, append

reg r4_maths_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R4_India.doc, append

// Peru with Covariates & Community Fixed Effects

reg r4_read_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R4_Peru.doc, replace

reg r4_ppvt_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R4_Peru.doc, append

reg r4_maths_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R4_Peru.doc, append

// Vietnam with Covariates & Community Fixed Effects

reg r4_read_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R4_Vietnam.doc, replace

reg r4_ppvt_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R4_Vietnam.doc, append

reg r4_maths_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R4_Vietnam.doc, append

// ---------------- //

// Round 5

// Pooled Regression R5

reg r5_read_perco r1_stunted
outreg2 using R5_Pooled_Single.doc, replace

reg r5_ppvt_perco r1_stunted
outreg2 using R5_Pooled_Single.doc, append

reg r5_maths_perco r1_stunted
outreg2 using R5_Pooled_Single.doc, append

// Pooled Regression R3 with country fixed

reg r5_read_perco r1_stunted i.Country
outreg2 using R5_Pooled_Single.doc, append

reg r5_ppvt_perco r1_stunted i.Country
outreg2 using R5_Pooled_Single.doc, append

reg r5_maths_perco r1_stunted i.Country
outreg2 using R5_Pooled_Single.doc, append

// Pooled Regression R3 with covariates and country fixed effects

reg r5_read_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R5_Pooled_Multi.doc, replace

reg r5_ppvt_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R5_Pooled_Multi.doc, append

reg r5_maths_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using R5_Pooled_Multi.doc, append

// Regressions R5 - Countrywise

// Ethiopia with Covariates & Community Fixed Effects

reg r5_read_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R5_Ethiopia.doc, replace

reg r5_ppvt_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R5_Ethiopia.doc, append

reg r5_maths_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 1, robust
outreg2 using R5_Ethiopia.doc, append

// India with Covariates & Community Fixed Effects

reg r5_ppvt_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R5_India.doc, append

reg r5_maths_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using R5_India.doc, append

// Peru with Covariates & Community Fixed Effects

reg r5_read_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R5_Peru.doc, replace

reg r5_ppvt_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R5_Peru.doc, append

reg r5_maths_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 3, robust
outreg2 using R5_Peru.doc, append

// Vietnam with Covariates & Community Fixed Effects

reg r5_maths_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 4, robust
outreg2 using R5_Vietnam.doc, append

// ---------------- //

// IV estimates



// ---------------- //

// On elder sons in India subsample

keep if Country == 2 & (ageorder == 1 | ageorder == 4) & sex == 1

// R2 Model with No Controls

reg r2_read_rasch r1_stunted
outreg2 using India_firstborn_R2Single.doc, replace

reg r2_ppvt_rasch r1_stunted
outreg2 using India_firstborn_R2Single.doc, append

// R2 Model with Community Fixed Effects and Covariates

reg r2_read_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using India_firstborn_R2Controls.doc, replace

reg r2_ppvt_rasch r1_stunted wi sex r2_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.Country, robust
outreg2 using India_firstborn_R2Controls.doc, append

// R3 Model with No Controls

reg r3_egra_rasch r1_stunted
outreg2 using India_firstborn_R3Single.doc, replace

reg r3_ppvt_rasch r1_stunted
outreg2 using India_firstborn_R3Single.doc, append

reg r3_maths_rasch r1_stunted
outreg2 using India_firstborn_R3Single.doc, append

// R3 Model with Community Fixed Effects and Covariates

reg r3_egra_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid, robust
outreg2 using India_firstborn_R3Controls.doc, replace

reg r3_ppvt_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid, robust
outreg2 using India_firstborn_R3Controls.doc, append

reg r3_maths_rasch r1_stunted wi sex r3_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid, robust
outreg2 using India_firstborn_R3Controls.doc, append

// R4 Model with No Controls

reg r4_read_perco r1_stunted
outreg2 using India_firstborn_R4Single.doc, replace

reg r4_ppvt_perco r1_stunted
outreg2 using India_firstborn_R4Single.doc, append

reg r4_maths_perco r1_stunted
outreg2 using India_firstborn_R4Single.doc, append

// R4 Model with Community Fixed Effects and Covariates

reg r4_read_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using India_firstborn_R4Controls.doc, replace

reg r4_ppvt_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using India_firstborn_R4Controls.doc, append

reg r4_maths_perco r1_stunted wi sex r4_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using India_firstborn_R4Controls.doc, append

// R5 Model with No Controls

reg r5_ppvt_perco r1_stunted
outreg2 using India_firstborn_R5Single.doc, replace

reg r5_maths_perco r1_stunted
outreg2 using India_firstborn_R5Single.doc, append

// R5 Model with Community Fixed Effects and Covariates

reg r5_ppvt_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using India_firstborn_R5Controls.doc, replace

reg r5_maths_perco r1_stunted wi sex r5_wi shigh wantcld hosp_birth typesite agechild mightdie timelive i.clustid if Country == 2, robust
outreg2 using India_firstborn_R5Controls.doc, append

/*// Single Regression R4

reg reading_perco stunted, robust
outreg2 using Round4_NoControls.doc, replace

reg maths_perco stunted, robust
outreg2 using Round4_NoControls.doc, append

reg ppvt_perco stunted, robust
outreg2 using Round4_NoControls.doc, append

// With Controls  R4

reg reading_perco stunted hq sv cdi sex hhsize shigh i.Country hosp_birth mightdie typesite agechild, robust
outreg2 using Round4_Controls.doc, replace

reg maths_perco stunted hq sv cdi sex hhsize shigh i.Country hosp_birth mightdie typesite agechild, robust
outreg2 using Round4_Controls.doc, append

reg ppvt_perco stunted hq sv cdi sex hhsize shigh i.Country hosp_birth mightdie typesite hq_sq sv_sq cdi_sq agechild, robust
outreg2 using Round4_Controls.doc, append

// With Controls and Sibling Scores

reg maths_perco stunted hq sv cdi sex hhsize shigh i.Country wantcld hosp_birth typesite smaths_perco, robust
outreg2 using Round4_Controls_Sib.doc, replace
reg ppvt_perco stunted hq sv cdi sex hhsize shigh i.Country wantcld hosp_birth typesite sppvt_perco, robust
outreg2 using Round4_Controls_Sib.doc, append

// On elder sons in India subsample

keep if Country == 2 & (ageorder == 1 | ageorder == 4) & sex == 1

reg reading_perco stunted hq sv cdi hhsize shigh wantcld hosp_birth typesite wantcld agechild, robust
outreg2 using Round4_India.doc, replace

reg maths_perco stunted hq sv cdi hhsize shigh wantcld hosp_birth typesite wantcld agechild, robust
outreg2 using Round4_India.doc, append

reg ppvt_perco stunted hq sv cdi hhsize shigh wantcld hosp_birth typesite agechild, robust
outreg2 using Round4_India.doc, append
 
reg maths_perco stunted hq sv cdi hhsize shigh wantcld hosp_birth typesite smaths_perco agechild, robust
outreg2 using Round4_India.doc, append

// ivregress 2sls lang_raw hq sv cdi hhsize shigh wantcld hosp_birth typesite i.Country sex (stunted = badevent)

// Using IV regression on Peru subset

// Load R5 Master dataset
use "$data/Young Lives/master_data_2.dta", clear

// Load R4 Master dataset
use "$data/Young Lives/master_data.dta", clear

keep if fhfa == 0 & Country == 3

reg reading_perco stunted hq sv cdi hhsize shigh wantcld hosp_birth typesite wantcld agechild, robust
outreg2 using Round4_Peru.doc, replace

reg maths_perco stunted hq sv cdi hhsize shigh wantcld hosp_birth typesite wantcld agechild, robust
outreg2 using Round4_Peru.doc, append

reg ppvt_perco stunted hq sv cdi hhsize shigh wantcld hosp_birth typesite agechild, robust
outreg2 using Round4_Peru.doc, append

// ---------------------- //

// Single Regression R5

reg r5_reading_perco stunted, robust
outreg2 using Round5_NoControls.doc, replace

reg r5_maths_perco stunted, robust
outreg2 using Round5_NoControls.doc, append

reg r5_ppvt_perco stunted, robust
outreg2 using Round5_NoControls.doc, append

// With Controls  R5

reg r5_reading_perco stunted hq sv cdi sex hhsize shigh i.Country hosp_birth mightdie typesite, robust
outreg2 using Round5_Controls.doc, replace

reg r5_maths_perco stunted hq sv cdi sex hhsize shigh i.Country hosp_birth mightdie typesite, robust
outreg2 using Round5_Controls.doc, append

reg r5_ppvt_perco stunted hq sv cdi sex hhsize shigh i.Country hosp_birth mightdie typesite, robust
outreg2 using Round5_Controls.doc, append */

