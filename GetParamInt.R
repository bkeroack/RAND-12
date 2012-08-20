# Look up intercepts and parameter values

GetParam <- function(ques, comp, demo) {

switch(comp, 
	PHC = {
		switch(as.character(demo), 
			"18" = {
			param <- PHC_params$Age18to24[ques] },
			"25" = {
			param <- PHC_params$Age25to44[ques] },
			"45" = {
			param <- PHC_params$Age45to64[ques] },
			"65" = {
			param <- PHC_params$Age65plus[ques] })
	},
	MHC = {
		switch(as.character(demo), 
			"18" = {
			param <- MHC_params$Age18to24[ques] },
			"25" = {
			param <- MHC_params$Age25to44[ques] },
			"45" = {
			param <- MHC_params$Age45to64[ques] },
			"65" = {
			param <- MHC_params$Age65plus[ques] })
	},

	GHC = {
		switch(as.character(demo), 
			"18" = {
			param <- GHC_params$Age18to24[ques] },
			"25" = {
			param <- GHC_params$Age25to44[ques] },
			"45" = {
			param <- GHC_params$Age45to64[ques] },
			"65" = {
			param <- GHC_params$Age65plus[ques] })
	},)

param
}


GetIntercept <- function(comp, demo) {

switch(comp, 
	PHC = {
		switch(as.character(demo), 
			"18" = {
			intercept <- PHC_ints$Age18to24[1] },
			"25" = {
			intercept <- PHC_ints$Age25to44[1] },
			"45" = {
			intercept <- PHC_ints$Age45to64[1] },
			"65" = {
			intercept <- PHC_ints$Age65plus[1] })
	},
	MHC = {
		switch(as.character(demo), 
			"18" = {
			intercept <- MHC_ints$Age18to24[1] },
			"25" = {
			intercept <- MHC_ints$Age25to44[1] },
			"45" = {
			intercept <- MHC_ints$Age45to64[1] },
			"65" = {
			intercept <- MHC_ints$Age65plus[1] })
	},

	GHC = {
		switch(as.character(demo), 
			"18" = {
			intercept <- GHC_ints$Age18to24[1] },
			"25" = {
			intercept <- GHC_ints$Age25to44[1] },
			"45" = {
			intercept <- GHC_ints$Age45to64[1] },
			"65" = {
			intercept <- GHC_ints$Age65plus[1] })
	},)

intercept
}